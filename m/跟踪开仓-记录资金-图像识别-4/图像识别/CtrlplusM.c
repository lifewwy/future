#include <windows.h>
#include <string.h>
#include "mex.h"

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    keybd_event(VK_CONTROL, 0, 0, 0);
    Sleep(20);
    keybd_event(77, 0, 0, 0);
    Sleep(20);
    keybd_event(77, 0, KEYEVENTF_KEYUP, 0);
    Sleep(20);
    keybd_event(VK_CONTROL,0, KEYEVENTF_KEYUP,  0);
    Sleep(20);
}













