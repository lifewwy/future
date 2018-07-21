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
    
    //hwnd = FindWindow(NULL, "����20150504.txt - ���±�"); //ע�ⴰ�ڲ�����С��
    hwnd = 656024; 
    
    //mexPrintf("hwnd %d\n",hwnd);
    
    if (hwnd == NULL)
    {
        mexPrintf("�Ҳ������ڣ�\n");
    }

    /* ʹ�� GetClientRect ���� GetWindowRect �� Ҫ�� PrintWindow �ĵ�3��
     ������Ӧ */
    //GetClientRect(hwnd, &rc);
    GetWindowRect(hwnd, &rc);
    
    //����
    hdcScreen = GetDC(NULL);
    hdc = CreateCompatibleDC(hdcScreen);
    hbmp = CreateCompatibleBitmap(hdcScreen, rc.right - rc.left, rc.bottom - rc.top);
    hOldBitmap = SelectObject(hdc, hbmp);
    
    //����
    /*PW_CLIENTONLY��Only the client area of the window is copied to hdcBlt.
    By default, the entire window is copied.
    PW_CLIENTONLY����ʾ�����������ڵĿͻ�����
    ��Ĭ������£�ִ��printwindow�´����������*/
    //PrintWindow(hwnd, hdc, PW_CLIENTONLY);
    PrintWindow(hwnd, hdc, 0);
    
    
    /*���Ƶ�ճ����
    OpenClipboard(NULL);
    EmptyClipboard();
    SetClipboardData(CF_BITMAP, hbmp);
    CloseClipboard();
    
    mexPrintf("�ɹ��Ѵ��ڸ��Ƶ�ճ����,��ճ����Windows��ͼ����\n");*/
    
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
    
    //�ͷ�
    SelectObject(hbmp,hOldBitmap);
    DeleteDC(hdc);
    DeleteObject(hbmp);
    ReleaseDC(NULL, hdcScreen);

}







































