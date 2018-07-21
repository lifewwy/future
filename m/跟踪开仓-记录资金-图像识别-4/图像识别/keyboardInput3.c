#include <windows.h>
#include <string.h>
#include "mex.h"


void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    double *Num;
    char *strNum;
    int i, strLen;  
    int dec, sign;
    int ndig; // 保留小数点后面 ndig 位
    
    ndig = 2;
   
    Num = (double *)mxGetData(prhs[0]);
    strNum = fcvt(Num[0], ndig, &dec, &sign);
    strLen = strlen(strNum);
    
//     mexPrintf("Num: %f\n",Num[0]);
//     mexPrintf("strNum: %s\n",strNum);
//     mexPrintf("strLen: %d\n",strLen);
//     mexPrintf("dec: %d\n",dec);
//     mexPrintf("sign: %d\n",sign);
    
    for(i=0;i<dec;i++)
    {
        keybd_event(strNum[i], 0, 0 ,0);
        keybd_event(strNum[i], 0, KEYEVENTF_KEYUP ,0);
        Sleep(20);    
    }
    
    keybd_event(110, 0, 0 ,0);
    keybd_event(110, 0, KEYEVENTF_KEYUP ,0);
    Sleep(20);
    
    for(i=dec;i<strLen;i++)
    {
        keybd_event(strNum[i], 0, 0 ,0);
        keybd_event(strNum[i], 0, KEYEVENTF_KEYUP ,0);
        Sleep(20);   
    }
    
}













