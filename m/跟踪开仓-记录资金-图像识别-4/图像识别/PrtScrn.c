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
    bool bshowmatlab;//ץ��ʱ�Ƿ�����matlab������
    HWND hwin,hactw;
    HDC dc,memdc;
    RECT rect;
    HBITMAP hbitm,hold;
    BITMAPINFOHEADER binfoh;
    if(nrhs!=1)  //������������м���
        mexErrMsgTxt("Need 1 argument!\n");
    if(!mxIsDouble(prhs[0]))
        mexErrMsgTxt("The input argument must be a numeric!\n");
    if(*(double*)(mxGetData(prhs[0]))==0)
        bshowmatlab=false;
    else
        bshowmatlab=true;
    
    hactw=GetForegroundWindow();//��ȡmatlab�Ĵ��ھ��
    
    
    hwin=GetDesktopWindow();//��ȡ���洰�ھ��
    //hwin = 0X000106F0;
    dc=GetWindowDC(hwin);//��ȡ���洰��DC
    GetWindowRect(hwin,&rect);//��ȡ���洰�ڴ�С
    
    cx=rect.right-rect.left;
    cy=rect.bottom-rect.top;
    /* mexPrintf("cx: %d cy: %d!\n",cx,cy);*/
    
    
    memdc=CreateCompatibleDC(dc);//���������洰��DC����Ӧ���ڴ�DC
    //mexPrintf("Handles: %d %d %d\n!",hwin,dc,memdc);
    hbitm=CreateCompatibleBitmap(dc,cx,cy);//��������Ӧ��λͼ
    if(hbitm==0)
        mexErrMsgTxt("Fail to create a compatible bitmap!\n");
    if (!(hold=SelectObject(memdc, hbitm))) //���½���λͼѡ���ڴ�DC��
        mexErrMsgTxt("Compatible Bitmap Selection!\n");
    
    // Hide the application window.
    if(!bshowmatlab)
    {
        ShowWindow(hactw, SW_HIDE); //����matlab������
        Sleep(1000);//�ӳ�100ms����Ϊ������matlab�����ڵĹ����в���ץ��
    }
    
    if (!BitBlt(memdc,0,0,cx,cy,dc,0,0,SRCCOPY)) //�����洰��DC�������ڴ�DC��
        mexErrMsgTxt("Screen to Compat Blt Failed");
    
    dims[0]=cy;//ע��cx,cy��˳��
    dims[1]=cx;
    dims[2]=3;
    plhs[0]=mxCreateNumericArray(3,dims,mxUINT8_CLASS,mxREAL);
    //������������ռ�������ͼ������, �����ǲ�ɫͼ�񣬺�RGB������������Ϊ��ά����
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
  
    /*��λͼ���������.�򿪼�����
     * OpenClipboard(NULL);
     * //��ռ���������
     * EmptyClipboard();
     * //��λͼ����Ϣ�ŵ���������
     * SetClipboardData(CF_BITMAP,hbitm);
     * CloseClipboard();*/
    
}






























