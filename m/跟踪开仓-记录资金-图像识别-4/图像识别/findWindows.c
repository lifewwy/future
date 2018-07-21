#include <windows.h>
#include <string.h>
#include "mex.h"

// ������һ��EnumWindowsProc �����磺
BOOL CALLBACK EnumWindowsProc(HWND hwnd,LPARAM lparam);
double hh;
//Ȼ��ʵ�ִ˺�����д���Լ����������飬���磺
BOOL CALLBACK EnumWindowsProc(HWND hwnd,LPARAM lparam)
{
    char lpWinTitle[256];
    
    GetWindowText(hwnd,lpWinTitle,255);
    
    if(strstr(lpWinTitle,lparam))
    {
        /*mexPrintf("���ڱ��⣺ %s\n",lpWinTitle) ;
        mexPrintf("hwnd: %d\n",hwnd) ;*/
        hh = (int)hwnd;
        return 0 ; // �˳�ö��
    }
    else
    {    //mexPrintf("hwnd: 0\n") ; 
         return TRUE; // ����ö��
    }
  
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    char *title;
    int   buflen;
    int   status;
    //HWND hwnd;
    double *h;
  
    buflen = (mxGetM(prhs[0]) * mxGetN(prhs[0]))*5;
    /*mexPrintf(" %d\n", mxGetM(prhs[0]));
    mexPrintf(" %d\n", mxGetN(prhs[0]));*/
    
    title = (char*)mxCalloc(buflen, sizeof(char));
    
    if (title == NULL)
        mexErrMsgTxt("Not enough heap space to hold converted string.");
    
    status = mxGetString(prhs[0], title, buflen);
    /*mexPrintf("The converted string is %s.\n", title);*/
    
    hh = 0;
    EnumWindows(EnumWindowsProc,title) ;  

    // ���
    plhs[0] = mxCreateDoubleMatrix(1,1,mxREAL);
    h = (double *)mxGetData(plhs[0]);
    h[0] = hh;
    
    mxFree(title);
    
}

// EnumChildWindows(hNMMainWnd,EnumChildProc,NULL);





































