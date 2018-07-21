#include <windows.h>
#include <string.h>
#include "mex.h"
 
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    HWND hwin;
    int rows, cols, i;
    double *rectout, *h;
    RECT rect;
    
    /*hwin = FindWindow(NULL,"adf.txt - 记事本");
    mexPrintf("hwin: %d\n",hwin);*/
    
    // 输入
    rows = mxGetM(prhs[0]); cols = mxGetN(prhs[0]);
    h = (double *)mxGetData(prhs[0]);
    
    
    // 输出
    plhs[0] = mxCreateDoubleMatrix(4,cols,mxREAL);
    rectout = (double *)mxGetData(plhs[0]);
    
    for (i = 0;i<cols;i++)
    {  
        hwin = (HWND)((int)h[i]);
        if (IsWindow(hwin))
        {
            
            GetWindowRect(hwin,&rect);

            rectout[i*4] = rect.left;
            rectout[i*4+1] = rect.top;
            rectout[i*4+2] = rect.right;
            rectout[i*4+3] = rect.bottom;
        }
        else
        {
            rectout[i*4] = 0;
            rectout[i*4+1] = 0;
            rectout[i*4+2] = 0;
            rectout[i*4+3] = 0;
        }

    }
}








