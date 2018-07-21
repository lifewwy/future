#include <windows.h>
#include <string.h>
#include "mex.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    RECT rc;
    HWND hwnd;
    HDC hdcScreen, hdc;
    HBITMAP hbmp, hOldBitmap;
    
    hwnd = FindWindow(NULL, "交易20150504.txt - 记事本"); //注意窗口不能最小化
    //hwnd = FindWindow( NULL,"MATLAB R2013a"); //注意窗口不能最小化
    
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
    
    
    //复制到粘贴板
    OpenClipboard(NULL);
    EmptyClipboard();
    SetClipboardData(CF_BITMAP, hbmp);
    CloseClipboard();
    
    //释放
    SelectObject(hbmp,hOldBitmap);
    DeleteDC(hdc);
    DeleteObject(hbmp);
    ReleaseDC(NULL, hdcScreen);
    
    mexPrintf("成功把窗口复制到粘贴板,请粘贴到Windows画图工具\n");
 
}







































