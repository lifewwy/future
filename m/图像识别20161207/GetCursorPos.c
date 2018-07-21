#include <windows.h>
#include <string.h>
#include "mex.h"
// #include <atltypes.h>
 
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *mousePos;
    POINT  pt;
    
    // Êä³ö
    plhs[0] = mxCreateDoubleMatrix(1,2,mxREAL);
    mousePos = (double *)mxGetData(plhs[0]);

    GetCursorPos(&pt);
    mousePos[0] = pt.x;
    mousePos[1] = pt.y;
}