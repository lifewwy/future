#include <windows.h>
#include <string.h>
#include "mex.h"

//���ȶ���
HWND g_hWnd; //����һ�����ڵľ��
HHOOK g_hMouse; //���Ĺ��ӹ���
HHOOK g_hKeyBoard; //���̵Ĺ��ӹ���

//��깳�ӹ��̵Ļص�����
LRESULT CALLBACK MouseProc( int nCode, 
        WPARAM wParam, LPARAM lParam)        
{
    // return 0�� ������
    // return 1�� ����
    MSLLHOOKSTRUCT  mhs = *((PMSLLHOOKSTRUCT )lParam);
    //mexPrintf("%d\n",mhs.flags&1) ;
    if (mhs.flags&1 == 1) // ģ�������¼�
    {
        return 0;
    }
    else // ��ʵ������¼�
    {
        // ����
        return 1; 
    }
}

//��ʾ: ���̹��ӹ��̵Ļص�����
LRESULT CALLBACK KeyboardProc( int nCode, WPARAM wParam, LPARAM lParam)
{
    // return 0�� ������
    // return 1�� ����
    KBDLLHOOKSTRUCT  mhs = *((PKBDLLHOOKSTRUCT)lParam);
    
    // mexPrintf("%d\n",mhs.flags>>4&1) ;
    if ((mhs.flags>>4&1) == 1) // ģ��ļ����¼�
    {
        return 0;
    }
    else // ��ʵ�ļ����¼�
    {
        if(mhs.vkCode == VK_ESCAPE)
        {   // �� Esc �˳�����ʵ���ͼ�����Ϣ������
            SendMessage(g_hWnd,WM_CLOSE,0,0); 
            UnhookWindowsHookEx(g_hKeyBoard); // �Ƴ��Ѿ���װ��hook
            UnhookWindowsHookEx(g_hMouse);    // �Ƴ��Ѿ���װ��hook
            return 0;
        }
        else
            // ����
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
        //g_hWnd = m_hWnd; //��õ�ǰ���ڵľ�������ص�������
        
        // ��װһ�����hook,GetCurrentThreadId()ǰ�������̵߳��̱߳�ʶ
        //g_hMouse = SetWindowsHookEx(WH_MOUSE,MouseProc,NULL,GetCurrentThreadId());
        g_hMouse = SetWindowsHookEx(WH_MOUSE_LL, MouseProc, GetModuleHandle(NULL), NULL);
        // mexPrintf("g_hMouse = %d\n",g_hMouse) ;
        
        // ��װһ������hook
        //g_hKeyBoard = SetWindowsHookEx(WH_KEYBOARD,KeyboardProc,NULL,GetCurrentThreadId());
        g_hKeyBoard = SetWindowsHookEx(WH_KEYBOARD_LL, KeyboardProc, GetModuleHandle(NULL), NULL);
        // mexPrintf("g_hKeyBoard = %d\n",g_hKeyBoard) ;
    }
    else
    {        
        SendMessage(g_hWnd,WM_CLOSE,0,0); //���͹ر���Ϣ
        UnhookWindowsHookEx(g_hKeyBoard);
        UnhookWindowsHookEx(g_hMouse);    //�Ƴ�һ���Ѿ���װ��hook
    }
    
}


































