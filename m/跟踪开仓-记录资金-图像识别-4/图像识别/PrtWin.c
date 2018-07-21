#include <windows.h>
#include <string.h>
#include "mex.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    RECT rc;
    HWND hwnd;
    HDC hdcScreen, hdc;
    HBITMAP hbmp, hOldBitmap;
    
    /////////////////////////////////////////////////
    BITMAPINFO bmpInfo = {0}; 
    int r;
    char *pchar,*mloc;
    int cx,cy;
    BITMAP bm;
    int dims[3],i,j,k;
    BITMAPINFOHEADER binfoh;
    /////////////////////////////////////////////////
    
    //hwnd = FindWindow(NULL, "交易20150504.txt - 记事本"); //注意窗口不能最小化
    hwnd = 656024; 
    
    //mexPrintf("hwnd %d\n",hwnd);
    
    if (hwnd == NULL)
    {
        mexPrintf("找不到窗口！\n");
    }

    /* 使用 GetClientRect 还是 GetWindowRect ， 要和 PrintWindow 的第3个
     参数对应 */
    //GetClientRect(hwnd, &rc);
    GetWindowRect(hwnd, &rc);
    
    //创建
    hdcScreen = GetDC(NULL);
    hdc = CreateCompatibleDC(hdcScreen);
    hbmp = CreateCompatibleBitmap(hdcScreen, rc.right - rc.left, rc.bottom - rc.top);
    hOldBitmap = SelectObject(hdc, hbmp);
    
    //复制
    /*PW_CLIENTONLY：Only the client area of the window is copied to hdcBlt.
    By default, the entire window is copied.
    PW_CLIENTONLY：表示仅仅拷贝窗口的客户区域，
    而默认情况下，执行printwindow会拷贝整个窗口*/
    //PrintWindow(hwnd, hdc, PW_CLIENTONLY);
    PrintWindow(hwnd, hdc, 0);
    
    
    /*复制到粘贴板
    OpenClipboard(NULL);
    EmptyClipboard();
    SetClipboardData(CF_BITMAP, hbmp);
    CloseClipboard();
    
    mexPrintf("成功把窗口复制到粘贴板,请粘贴到Windows画图工具\n");*/
    
    ////////////////////////////////////////////////////////////
    
    bmpInfo.bmiHeader.biSize = sizeof(BITMAPINFOHEADER);

    r = GetDIBits(hdc, hbmp, 0 , 0 ,NULL ,  &bmpInfo, DIB_RGB_COLORS);
    
    /*mexPrintf("%d \n",r);
    mexPrintf("%d \n",bmpInfo.bmiHeader.biSizeImage);
    mexPrintf("%d  %d\n",rc.right - rc.left, rc.bottom - rc.top);
    mexPrintf("%d \n",bmpInfo.bmiHeader.biPlanes);
    mexPrintf("%d \n",bmpInfo.bmiHeader.biBitCount);
    mexPrintf("%d \n",bmpInfo.bmiHeader.biHeight);*/
    

    bmpInfo.bmiHeader.biCompression = BI_RGB;
    bmpInfo.bmiHeader.biPlanes = 1;
 
    mloc = (char*)mxMalloc(bmpInfo.bmiHeader.biSizeImage);

    
    r = GetDIBits(hdc, hbmp, 0 , bmpInfo.bmiHeader.biHeight ,
            mloc ,  &bmpInfo, DIB_RGB_COLORS);

     /*mexPrintf("%d \n",r);
     mexPrintf("%d \n",bmpInfo.bmiHeader.biBitCount);
     mexPrintf("%d \n",bmpInfo.bmiHeader.biSizeImage);*/

    dims[0] = bmpInfo.bmiHeader.biHeight;
    dims[1] = bmpInfo.bmiHeader.biWidth;
    dims[2]=3;
    plhs[0]=mxCreateNumericArray(3,dims,mxUINT8_CLASS,mxREAL);
    pchar=(char*)mxGetData(plhs[0]);
    
    cx = bmpInfo.bmiHeader.biWidth;
    cy = bmpInfo.bmiHeader.biHeight;
    for(k=0;k<3;k++)
        for(j=0;j<cy;j++)
            for(i=0;i<cx;i++)
            {
                pchar[i*cy+j+k*cx*cy]=mloc[(j*cx+i)*4+2-k];
            }
    mxFree(mloc);

    ////////////////////////////////////////////////////////////
    
    //释放
    SelectObject(hbmp,hOldBitmap);
    DeleteDC(hdc);
    DeleteObject(hbmp);
    ReleaseDC(NULL, hdcScreen);

}







































