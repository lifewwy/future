#include <windows.h>
#include <string.h>
#include "mex.h"
 
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    /*double *mousePos;

    /rows = mxGetM(prhs[0]); cols = mxGetN(prhs[0]);
    mousePos = (double *)mxGetData(prhs[0]);//  ‰»Î
    SetCursorPos(mousePos[0],mousePos[1]);
    Sleep(30);*/
     
    mouse_event(MOUSEEVENTF_RIGHTDOWN,0,0,0,0);
    mouse_event(MOUSEEVENTF_RIGHTUP,0,0,0,0);
    Sleep(30);
}





















