#include <windows.h>
#include <string.h>
#include "mex.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *Num;
    char *strNum;
    int i, strLen;
   
    Num = (double *)mxGetData(prhs[0]);
    
    gcvt(Num[0], 10, strNum);
    
    strLen = strlen(strNum);
    /*mexPrintf("strLen: %d\n",strLen);
    mexPrintf("strNum: %s\n",strNum);*/
   
    for(i=0;i<strLen;i++)
    {
        if ( (strNum[i]=='.')&&(i != strLen-1) )
        {
            keybd_event(110, 0, 0 ,0);
            keybd_event(110, 0, KEYEVENTF_KEYUP ,0);
            Sleep(20);
        }
        if ( strNum[i] != '.' )
        {
            keybd_event(strNum[i], 0, 0 ,0);
            keybd_event(strNum[i], 0, KEYEVENTF_KEYUP ,0);
            Sleep(20);
        }
        
    }

    
}













