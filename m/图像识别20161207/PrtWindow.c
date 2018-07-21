#include <windows.h>
#include <string.h>
#include "mex.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    RECT rc;
    HWND hwnd;
    HDC hdcScreen, hdc;
    HBITMAP hbmp, hOldBitmap;
    
    hwnd = FindWindow(NULL, "����20150504.txt - ���±�"); //ע�ⴰ�ڲ�����С��
    //hwnd = FindWindow( NULL,"MATLAB R2013a"); //ע�ⴰ�ڲ�����С��
    
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
    
    
    //���Ƶ�ճ����
    OpenClipboard(NULL);
    EmptyClipboard();
    SetClipboardData(CF_BITMAP, hbmp);
    CloseClipboard();
    
    //�ͷ�
    SelectObject(hbmp,hOldBitmap);
    DeleteDC(hdc);
    DeleteObject(hbmp);
    ReleaseDC(NULL, hdcScreen);
    
    mexPrintf("�ɹ��Ѵ��ڸ��Ƶ�ճ����,��ճ����Windows��ͼ����\n");
 
}







































