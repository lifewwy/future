#include <windows.h>
#include <string.h>
#include "mex.h"


void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    
    char *InputStr;
    int i, strLen, a; 
    
    InputStr = mxArrayToString(prhs[0]);
    strLen = strlen(InputStr);
    
    
//     mexPrintf("InputStr: %s\n",InputStr);
//     mexPrintf("strLen: %d\n",strLen);

    for(i=0;i<strLen;i++)
    {
        a = InputStr[i];
        mexPrintf("a: %d\n",a);
        if (i<strLen-4)
        {
            if (a>=90)
                a = a-32;
           keybd_event( VK_SHIFT, 0, 0, 0 ); 
           keybd_event(a, 0, 0 ,0);
           keybd_event(a, 0, KEYEVENTF_KEYUP ,0);
           keybd_event( VK_SHIFT, 0, KEYEVENTF_KEYUP, 0); 
        }
        else
        {
            keybd_event(InputStr[i], 0, 0 ,0);
            keybd_event(InputStr[i], 0, KEYEVENTF_KEYUP ,0);
        }
        Sleep(20);    
    }
    
}













