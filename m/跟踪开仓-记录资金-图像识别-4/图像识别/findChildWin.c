#include <windows.h>
#include <string.h>
#include "mex.h"

// 输入父窗口的句柄和子窗口的标题，来得到子窗口的句柄。
// 查找子窗口必须逐层查找，每次只能查找位于下一层的子窗口
// 按钮也是一个子窗口，可以通过其父窗口的句柄和按钮标题查找

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *hwin;
    double hh;
    double *h;
    char *title;
    int   buflen;
    int   status;
    
    HWND hbuttonWnd, hwnd;
    
    hwin = (double *)mxGetData(prhs[0]);  
    hwnd = (HWND)((int)hwin[0]);
    
    buflen = (mxGetM(prhs[1]) * mxGetN(prhs[1]))*5;
    /*mexPrintf(" %d\n", mxGetM(prhs[1]));
    mexPrintf(" %d\n", mxGetN(prhs[1]));*/
    title = (char*)mxCalloc(buflen, sizeof(char));
    if (title == NULL)
        mexErrMsgTxt("Not enough heap space to hold converted string.");
    status = mxGetString(prhs[1], title, buflen);
    //mexPrintf("The converted string is %s.\n", title);

    hbuttonWnd = FindWindowEx(hwnd,0,0,title);
    //hbuttonWnd = FindWindowEx(hwnd,0,0,"批量导入");
    hh = (int)hbuttonWnd;
    
    // 输出
    plhs[0] = mxCreateDoubleMatrix(1,1,mxREAL);
    h = (double *)mxGetData(plhs[0]);
    h[0] = hh;
 
}











