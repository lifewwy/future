function varargout = x009(varargin)
% X009 M-file for x009.fig
%      X009, by itself, creates a new X009 or raises the existing
%      singleton*.
%
%      H = X009 returns the handle to a new X009 or the handle to
%      the existing singleton*.
%
%      X009('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in X009.M with the given input arguments.
%
%      X009('Property','Value',...) creates a new X009 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before x009_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to x009_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help x009

% Last Modified by GUIDE v2.5 26-Jun-2010 18:09:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @x009_OpeningFcn, ...
                   'gui_OutputFcn',  @x009_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before x009 is made visible.
function x009_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to x009 (see VARARGIN)

% Choose default command line output for x009
handles.output = hObject;
data = rand(6,6);
data = mat2cell(data,ones(1,size(data,1)),ones(1,size(data,2)))
data{1,1}=['<html><table><tr><td width=100 bgcolor="red">','<FONT face="Times New Roman"size="4"color=black">',num2str(data{1,1},'%10.4f'), '</table></html>'];
data{2,2}=['<html><table><tr><td width=100 bgcolor="yellow">','<FONT face="Times New Roman"size="4"color=black">',num2str(data{2,2},'%10.4f'), '</table></html>'];
data{3,3}=['<html><table><tr><td width=100 bgcolor="blue">','<FONT face="Times New Roman"size="4"color=black">',num2str(data{3,3},'%10.4f'), '</table></html>'];
% data{1,1} = ['<html><FONT color=#ff0000">' num2str(data{1,1},'%10.4f') '</Font></html>']
% data{2,2} = ['<html><FONT color=#3333ff">' num2str(data{2,2},'%10.4f') '</Font></html>']
% data{3,3} = ['<html><FONT color=#00cc00">' num2str(data{3,3},'%10.4f') '</Font></html>']
% data{4,4} = ['<html><FONT color=#ffccff">' num2str(data{4,4},'%10.4f') '</Font></html>']
% data{5,5} = ['<html><FONT color=#ffff00">' num2str(data{5,5},'%10.4f') '</Font></html>']
% data{6,6} = ['<html><FONT color=#993366">' num2str(data{6,6},'%10.4f') '</Font></html>']
% data{6,3} = ['<html><FONT color=#ffcccc">' num2str(data{6,3},'%10.4f') '</Font></html>']


set(handles.uitable1,'data',data)
get(handles.uitable1,'ColumnWidth')
% Data inversion procedure -------------------------------------------------
% str  = ['<html><FONT color=#ff0000">' num2str(rand(1,1),'%16.16f') '</Font></html>'];
% tok  = regexp(str,'<.*?><.*?>((\w+).*?)<.*?><.*?>','tokens');
% data = str2num(cell2mat(tok{:}))
% --------------------------------------------------------------------------
% str = data{6,6};
% tok  = regexp(str,'<.*?><.*?>((\w+).*?)<.*?><.*?>','tokens');
% Recovery = str2num(cell2mat(tok{:}))
% -------------------------------------------------------------------------
guidata(hObject, handles);

% UIWAIT makes x009 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = x009_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
