#include <windows.h>
#include <string.h>
#include "mex.h"

// ������һ��EnumWindowsProc �����磺
BOOL CALLBACK EnumWindowsProc(HWND hwnd,LPARAM lparam);
char *WinTitle;
//Ȼ��ʵ�ִ˺�����д���Լ����������飬���磺
BOOL CALLBACK EnumWindowsProc(HWND hwnd,LPARAM lparam)
{
    char lpWinTitle[256];
    
    GetWindowText(hwnd,lpWinTitle,255);
    
    if(strstr(lpWinTitle,lparam))
    {
        /*mexPrintf("���ڱ��⣺ %s\n",lpWinTitle) ;
        mexPrintf("hwnd: %d\n",hwnd) ;*/
        WinTitle = lpWinTitle;
        //mexPrintf("���ڱ��⣺ %s\n",WinTitle) ;
        
        return 0 ; // �˳�ö��
    }
    else
    {    //mexPrintf("hwnd: 0\n") ; 
         return TRUE; // ����ö��
    }
  
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    char *title;
    int   buflen;
    int   status;
    //HWND hwnd;
//     char *tt;
  
    buflen = (mxGetM(prhs[0]) * mxGetN(prhs[0]))*5;
    /*mexPrintf(" %d\n", mxGetM(prhs[0]));
    mexPrintf(" %d\n", mxGetN(prhs[0]));*/
    
    title = (char*)mxCalloc(buflen, sizeof(char));
    
    if (title == NULL)
        mexErrMsgTxt("Not enough heap space to hold converted string.");
    
    status = mxGetString(prhs[0], title, buflen);
    /*mexPrintf("The converted string is %s.\n", title);*/
    
    EnumWindows(EnumWindowsProc,title) ; 
    //mexPrintf("���ڱ��⣺ %s\n",WinTitle); 

    // ���
    plhs[0] = mxCreateString(WinTitle);
    
    mxFree(title);  
}

// EnumChildWindows(hNMMainWnd,EnumChildProc,NULL);





































