#include <windows.h>
#include <string.h>
#include "mex.h"

// ���밴ť�ľ��

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *hwin;
    HWND hwnd;
  
    hwin = (double *)mxGetData(prhs[0]);  
    hwnd = (HWND)((int)hwin[0]);
    
    /*SendMessage(hwnd, WM_LBUTTONDOWN, 0, 0);  //����������  
    Sleep(20);  
    SendMessage(hwnd, WM_LBUTTONUP, 0, 0);   
    Sleep(20);*/ 
    
    PostMessage(hwnd, WM_LBUTTONDOWN, 0, 0);  //����������  
    Sleep(20);  
    PostMessage(hwnd, WM_LBUTTONUP, 0, 0);   
    Sleep(20);
 
}











