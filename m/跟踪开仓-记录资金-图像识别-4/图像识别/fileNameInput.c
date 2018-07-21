#include <windows.h>
#include <string.h>
#include "mex.h"


void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    
    char *InputStr;
    int i, strLen, a; 
    int flg;
    
    InputStr = mxArrayToString(prhs[0]);
    strLen = strlen(InputStr);

//     mexPrintf("InputStr: %s\n",InputStr);
//     mexPrintf("strLen: %d\n",strLen);

    for(i=0;i<strLen;i++)
    {
        flg = 0;
        a = InputStr[i];
//         mexPrintf("a: %d\n",a);

        if (a>90)
            a = a-32;    

        if (!((a>=48)&&(a<=57)))
            keybd_event( VK_SHIFT, 0, 0, 0 );
        
        keybd_event(a, 0, 0 ,0);
        keybd_event(a, 0, KEYEVENTF_KEYUP ,0);
        
        if (!((a>=48)&&(a<=57)))
            keybd_event( VK_SHIFT, 0, KEYEVENTF_KEYUP, 0);

        Sleep(20);
    }
    
//     keybd_event(VK_RETURN, 0, 0 ,0);
//     keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP ,0);
    Sleep(200);
}













