#include <windows.h>
#include <string.h>
#include "mex.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *hwin;
    
    HWND hForeWnd, hwnd;
    DWORD dwForeID, dwCurID;
    
    hwin = (double *)mxGetData(prhs[0]);  
    hwnd = (HWND)((int)hwin[0]);
    
    hForeWnd = GetForegroundWindow();
    dwForeID = GetWindowThreadProcessId(hForeWnd,NULL);
    dwCurID = GetCurrentThreadId();
    AttachThreadInput(dwCurID,dwForeID,TRUE);
    ShowWindow(hwnd,SW_SHOWMAXIMIZED);
    //SetWindowPos(hwnd,HWND_TOPMOST,0,0,0,0,SWP_NOSIZE|SWP_NOMOVE);
    //SetWindowPos(hwnd,HWND_NOTOPMOST,0,0,0,0, SWP_NOSIZE|SWP_NOMOVE);
    SetForegroundWindow(hwnd);
    AttachThreadInput(dwCurID,dwForeID,FALSE);
 
}











