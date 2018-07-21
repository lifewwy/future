#include <windows.h>
#include <string.h>
#include "mex.h"

//首先定义
HWND g_hWnd; //定义一个窗口的句柄
HHOOK g_hMouse; //鼠标的钩子过程
HHOOK g_hKeyBoard; //键盘的钩子过程

//鼠标钩子过程的回调函数
LRESULT CALLBACK MouseProc( int nCode, 
        WPARAM wParam, LPARAM lParam)        
{
    // return 0： 不拦截
    // return 1： 拦截
    MSLLHOOKSTRUCT  mhs = *((PMSLLHOOKSTRUCT )lParam);
    //mexPrintf("%d\n",mhs.flags&1) ;
    if (mhs.flags&1 == 1) // 模拟的鼠标事件
    {
        return 0;
    }
    else // 真实的鼠标事件
    {
        // 拦截
        return 1; 
    }
}

//提示: 键盘钩子过程的回调函数
LRESULT CALLBACK KeyboardProc( int nCode, WPARAM wParam, LPARAM lParam)
{
    // return 0： 不拦截
    // return 1： 拦截
    KBDLLHOOKSTRUCT  mhs = *((PKBDLLHOOKSTRUCT)lParam);
    
    // mexPrintf("%d\n",mhs.flags>>4&1) ;
    if ((mhs.flags>>4&1) == 1) // 模拟的键盘事件
    {
        return 0;
    }
    else // 真实的键盘事件
    {
        if(mhs.vkCode == VK_ESCAPE)
        {   // 按 Esc 退出对真实鼠标和键盘消息的拦截
            SendMessage(g_hWnd,WM_CLOSE,0,0); 
            UnhookWindowsHookEx(g_hKeyBoard); // 移除已经安装的hook
            UnhookWindowsHookEx(g_hMouse);    // 移除已经安装的hook
            return 0;
        }
        else
            // 拦截
            return 1;
    }
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    BOOL *a;
   
//     HWND hwin;
//     double *h;
//     h = (double *)mxGetData(prhs[1]);
//     hwin = (HWND)((int)h);

    a = (BOOL*)mxGetData(prhs[0]);
    // mexPrintf("a = %f\n",a[0]) ;
    
    if (a[0] == TRUE)
    {
        // mexPrintf("a = %f\n",a[0]) ;
        
        // TODO: Add extra initialization here
        
        g_hWnd = GetActiveWindow();
        // g_hWnd = hwin;
        //g_hWnd = m_hWnd; //获得当前窗口的句柄，供回调函数用
        
        // 安装一个鼠标hook,GetCurrentThreadId()前往调用线程的线程标识
        //g_hMouse = SetWindowsHookEx(WH_MOUSE,MouseProc,NULL,GetCurrentThreadId());
        g_hMouse = SetWindowsHookEx(WH_MOUSE_LL, MouseProc, GetModuleHandle(NULL), NULL);
        // mexPrintf("g_hMouse = %d\n",g_hMouse) ;
        
        // 安装一个键盘hook
        //g_hKeyBoard = SetWindowsHookEx(WH_KEYBOARD,KeyboardProc,NULL,GetCurrentThreadId());
        g_hKeyBoard = SetWindowsHookEx(WH_KEYBOARD_LL, KeyboardProc, GetModuleHandle(NULL), NULL);
        // mexPrintf("g_hKeyBoard = %d\n",g_hKeyBoard) ;
    }
    else
    {        
        SendMessage(g_hWnd,WM_CLOSE,0,0); //发送关闭消息
        UnhookWindowsHookEx(g_hKeyBoard);
        UnhookWindowsHookEx(g_hMouse);    //移除一个已经安装的hook
    }
    
}


































