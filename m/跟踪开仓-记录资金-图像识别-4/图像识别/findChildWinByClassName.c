#include <windows.h>
#include <string.h>
#include "mex.h"

// 输入父窗口的句柄和子窗口的类名、标题，来得到子窗口的句柄。
// 查找子窗口必须逐层查找，每次只能查找位于下一层的子窗口
// 按钮也是一个子窗口，可以通过其父窗口的句柄和按钮标题查找

// FindWindowEx(父窗口句柄,NULL,窗口类名,窗口标题')
/* 1. If hwndParent is NULL, the function uses the desktop window 
as the parent window. The function searches among windows 
that are child windows of the desktop.*/
/* 2.  如果类名为NULL或0,表示匹配所有的类.*/
/* 3.  如果标题名为NULL或0,表示匹配所有的标题.*/

// MATLAB 用法
// findChildWinByClassName(0,'','abc')，表示匹配所有的类名，标题名为abc
// findChildWinByClassName(0,'Ghost','')，表示匹配所有的标题名，类名为Ghost

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *hwin;
    double hh;
    double *h;
    char *ClassName;
    char *Title;
    int   buflen;
    int   buflen1;
    int   status;
    int   status1;
    
    HWND hChildWnd, hwnd;
    
    hwin = (double *)mxGetData(prhs[0]);  
    hwnd = (HWND)((int)hwin[0]);
    
    buflen = (mxGetM(prhs[1]) * mxGetN(prhs[1]))*5;
    /*mexPrintf(" %d\n", mxGetM(prhs[1]));
    mexPrintf(" %d\n", mxGetN(prhs[1]));*/
    buflen1 = (mxGetM(prhs[2]) * mxGetN(prhs[2]))*5;
    
    ClassName = (char*)mxCalloc(buflen, sizeof(char));
    Title = (char*)mxCalloc(buflen1, sizeof(char));
    
    status = mxGetString(prhs[1], ClassName, buflen);
    //mexPrintf("The converted ClassName string is %s.\n", ClassName);
    
    status1 = mxGetString(prhs[2], Title, buflen1);
    //mexPrintf("The converted Title string is %s.\n", Title);

    hChildWnd = FindWindowEx(hwnd,0,ClassName,Title);
    hh = (int)hChildWnd;
    
    // 输出
    plhs[0] = mxCreateDoubleMatrix(1,1,mxREAL);
    h = (double *)mxGetData(plhs[0]);
    h[0] = hh;
 
}











