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

    SendMessage(hwnd, WM_CLOSE, 0, 0);
 
}











