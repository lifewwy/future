#include <windows.h>
#include <string.h>
#include "mex.h"


void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    keybd_event(0x11, 0, 0, 0); // press ctrl
    keybd_event(0x56, 0, 0, 0); // press v
    keybd_event(0x56, 0, KEYEVENTF_KEYUP, 0); //release v
    keybd_event(0x11, 0, KEYEVENTF_KEYUP, 0); //release ctrl
    Sleep(200);
}













