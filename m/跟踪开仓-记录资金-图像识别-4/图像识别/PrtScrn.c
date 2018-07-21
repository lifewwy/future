// matlab mex file to snap the screen
// compile to use>> mex screensnap.c user32.lib gdi32.lib
// usage:1, >>a=screensnap(0)     %exclude the matlab window
//        >>imshow(a);
//       2, >>a=screensnap(1);    %include the matlab window
//          >> imshow(a);
// designed by darnshong   chenzushang@sina.com
// 2005,12,18
#include <windows.h>
#include <string.h>
#include "mex.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    int cx,cy,recnum;
    int dims[3],i,j,k;
    char *pchar,*mloc;
    bool bshowmatlab;//抓屏时是否屏蔽matlab主窗口
    HWND hwin,hactw;
    HDC dc,memdc;
    RECT rect;
    HBITMAP hbitm,hold;
    BITMAPINFOHEADER binfoh;
    if(nrhs!=1)  //对输入参数进行检验
        mexErrMsgTxt("Need 1 argument!\n");
    if(!mxIsDouble(prhs[0]))
        mexErrMsgTxt("The input argument must be a numeric!\n");
    if(*(double*)(mxGetData(prhs[0]))==0)
        bshowmatlab=false;
    else
        bshowmatlab=true;
    
    hactw=GetForegroundWindow();//获取matlab的窗口句柄
    
    
    hwin=GetDesktopWindow();//获取桌面窗口句柄
    //hwin = 0X000106F0;
    dc=GetWindowDC(hwin);//获取桌面窗口DC
    GetWindowRect(hwin,&rect);//获取桌面窗口大小
    
    cx=rect.right-rect.left;
    cy=rect.bottom-rect.top;
    /* mexPrintf("cx: %d cy: %d!\n",cx,cy);*/
    
    
    memdc=CreateCompatibleDC(dc);//创建与桌面窗口DC相适应的内存DC
    //mexPrintf("Handles: %d %d %d\n!",hwin,dc,memdc);
    hbitm=CreateCompatibleBitmap(dc,cx,cy);//创建相适应的位图
    if(hbitm==0)
        mexErrMsgTxt("Fail to create a compatible bitmap!\n");
    if (!(hold=SelectObject(memdc, hbitm))) //将新建的位图选入内存DC中
        mexErrMsgTxt("Compatible Bitmap Selection!\n");
    
    // Hide the application window.
    if(!bshowmatlab)
    {
        ShowWindow(hactw, SW_HIDE); //屏蔽matlab主窗口
        Sleep(1000);//延迟100ms，因为在屏蔽matlab主窗口的过程中不能抓屏
    }
    
    if (!BitBlt(memdc,0,0,cx,cy,dc,0,0,SRCCOPY)) //将桌面窗口DC拷贝到内存DC中
        mexErrMsgTxt("Screen to Compat Blt Failed");
    
    dims[0]=cy;//注意cx,cy的顺序
    dims[1]=cx;
    dims[2]=3;
    plhs[0]=mxCreateNumericArray(3,dims,mxUINT8_CLASS,mxREAL);
    //创建输出变量空间来传递图像数据, 由于是彩色图像，含RGB三分量，所以为三维数据
    pchar=(char*)mxGetData(plhs[0]);
    binfoh.biSize=sizeof(BITMAPINFOHEADER);
    binfoh.biWidth=cx;
    binfoh.biHeight=-cy;
    binfoh.biPlanes=1;
    binfoh.biBitCount=24;
    binfoh.biCompression=BI_RGB;
    binfoh.biSizeImage=0;
    binfoh.biXPelsPerMeter=0;
    binfoh.biYPelsPerMeter =0;
    binfoh.biClrUsed=0;
    binfoh.biClrImportant=0;
    
    mloc=(char*)mxMalloc(cx*cy*3);
    
    recnum=GetDIBits(memdc,hbitm,0,cy,mloc,(BITMAPINFO*)&binfoh,DIB_RGB_COLORS);
    
    //mexPrintf("mloc = %d\n", mloc);
    
    for(k=0;k<3;k++)
        for(j=0;j<cy;j++)
            for(i=0;i<cx;i++)
            {
                pchar[i*cy+j+k*cx*cy]=mloc[(j*cx+i)*3+2-k];
            }
    mxFree(mloc);
    SelectObject(hbitm,hold);
    DeleteDC(memdc);
    ReleaseDC(hwin,dc);
    DeleteObject(hbitm);
    
    if(!bshowmatlab)
        ShowWindow(hactw, SW_SHOW);
  
    /*将位图放入剪贴板.打开剪贴板
     * OpenClipboard(NULL);
     * //清空剪贴板内容
     * EmptyClipboard();
     * //把位图的信息放到剪贴板上
     * SetClipboardData(CF_BITMAP,hbitm);
     * CloseClipboard();*/
    
}






























