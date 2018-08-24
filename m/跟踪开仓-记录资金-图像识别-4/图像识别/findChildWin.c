#include <windows.h>
#include <string.h>
#include "mex.h"

// ���븸���ڵľ�����Ӵ��ڵı��⣬���õ��Ӵ��ڵľ����
// �����Ӵ��ڱ��������ң�ÿ��ֻ�ܲ���λ����һ����Ӵ���
// ��ťҲ��һ���Ӵ��ڣ�����ͨ���丸���ڵľ���Ͱ�ť�������

// FindWindowEx(�����ھ��,NULL,��������,���ڱ���')
/* 1. If hwndParent is NULL, the function uses the desktop window 
as the parent window. The function searches among windows 
that are child windows of the desktop.*/
/* 2.  �������ΪNULL��0,��ʾ���е���.*/
/* 3.  ���������ΪNULL��0,��ʾ���еı���.*/


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

    status = mxGetString(prhs[1], title, buflen);
    //mexPrintf("The converted string is %s.\n", title);

    hbuttonWnd = FindWindowEx(hwnd,0,0,title);
    //hbuttonWnd = FindWindowEx(hwnd,0,0,"��������");
    hh = (int)hbuttonWnd;
    
    // ���
    plhs[0] = mxCreateDoubleMatrix(1,1,mxREAL);
    h = (double *)mxGetData(plhs[0]);
    h[0] = hh;
 
}











