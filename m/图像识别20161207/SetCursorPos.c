#include <windows.h>
#include <string.h>
#include "mex.h"
 
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *mousePos;

    //rows = mxGetM(prhs[0]); cols = mxGetN(prhs[0]);
    mousePos = (double *)mxGetData(prhs[0]);
    SetCursorPos(mousePos[0],mousePos[1]);
    Sleep(30);
}