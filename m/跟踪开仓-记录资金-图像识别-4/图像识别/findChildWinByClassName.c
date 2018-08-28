#include <windows.h>
#include <string.h>
#include "mex.h"

// ���븸���ڵľ�����Ӵ��ڵ����������⣬���õ��Ӵ��ڵľ����
// �����Ӵ��ڱ��������ң�ÿ��ֻ�ܲ���λ����һ����Ӵ���
// ��ťҲ��һ���Ӵ��ڣ�����ͨ���丸���ڵľ���Ͱ�ť�������

// FindWindowEx(�����ھ��,NULL,��������,���ڱ���')
/* 1. If hwndParent is NULL, the function uses the desktop window 
as the parent window. The function searches among windows 
that are child windows of the desktop.*/
/* 2.  �������ΪNULL��0,��ʾƥ�����е���.*/
/* 3.  ���������ΪNULL��0,��ʾƥ�����еı���.*/

// MATLAB �÷�
// findChildWinByClassName(0,'','abc')����ʾƥ�����е�������������Ϊabc
// findChildWinByClassName(0,'Ghost','')����ʾƥ�����еı�����������ΪGhost

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
    
    // ���
    plhs[0] = mxCreateDoubleMatrix(1,1,mxREAL);
    h = (double *)mxGetData(plhs[0]);
    h[0] = hh;
 
}











