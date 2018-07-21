#include <windows.h>
#include <string.h>
#include "mex.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *hwin;
    HWND hwnd;
  
    hwnd = GetForegroundWindow();
    // mexPrintf("hwnd: %d\n",hwnd); 
    
    plhs[0] = mxCreateDoubleMatrix(1,1,mxREAL);
    hwin = (double *)mxGetData(plhs[0]);
    hwin[0] = (int)hwnd;
    
    // mexPrintf("hwnd: %d\n",hwnd); 
 
}











