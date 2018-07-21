#include <windows.h>
#include <string.h>
#include "mex.h"
 
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *h;
    
    //  ‰»Î
    h = (double *)mxGetData(prhs[0]);

    SwitchToThisWindow((HWND)((int)h[0]),TRUE);

}
