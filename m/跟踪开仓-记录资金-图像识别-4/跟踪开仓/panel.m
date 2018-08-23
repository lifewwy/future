function varargout = panel(varargin)
% PANEL MATLAB code for panel.fig
%      PANEL, by itself, creates a new PANEL or raises the existing
%      singleton*.
%
%      H = PANEL returns the handle to a new PANEL or the handle to
%      the existing singleton*.
%
%      PANEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PANEL.M with the given input arguments.
%
%      PANEL('Property','Value',...) creates a new PANEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before panel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to panel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help panel

% Last Modified by GUIDE v2.5 23-Aug-2018 02:46:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @panel_OpeningFcn, ...
                   'gui_OutputFcn',  @panel_OutputFcn, ...
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


% --- Executes just before panel is made visible.
function panel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to panel (see VARARGIN)

set(handles.radiobutton15,'value',0);

fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-1));
addpath(directory);
config;

if ~isempty(timerfind)
    stop(timerfind);
end
delete(timerfind);

% 打开 diary
set(handles.radiobutton14,'value',1);
radiobutton14_Callback(hObject, eventdata, handles)

[IsTodayClosed,IsNowClosed,IsTomorrowClosed] = IsMarketClosed(now);
set(handles.text9,'string',['今日 : ',IsTodayClosed]);
set(handles.text11,'string',['现在 : ',IsNowClosed]);
set(handles.text10,'string',['明日 : ',IsTomorrowClosed]);


load TradableContract;
assignin('base','TradableContract',TradableContract);

% 将窗口移到中间位置
movegui('center');

category = {'品种';'A    大豆';'AG  沪银';'AL  沪铝';'AU  黄金'; ...
    'C    玉米';'CF  棉花';'CU  沪铜';'FG  玻璃';'J     焦炭';'L     塑料';'M    豆粕'; ...
    'MA  甲醇';'OI   郑油';'P 棕榈油';'RB  螺纹';'RU  橡胶';'SR  白糖';...
    'TA  PTA';'V    PVC';'Y    豆油';'ZN  沪锌';'IF   股指'};

yymm = datestr(now,'yymm');
% yymm = '1605';
mm = mod( str2double(yymm(3:4)) + (0:11) , 12 ) + 1;
tmp = zeros(1,12);
tmp(1,12 - str2double(yymm(3:4)) + 1:end) = 1;
yy = str2double(yymm(1:2)) + tmp;
Contract = cell(14,1);
%     Contract = cell(25,1);
Contract(1) = {'合约'};
Contract(2) = {yymm};
for i = 1:12
    Contract(i+2) = cellstr([num2str(yy(i),'%02d'),num2str(mm(i),'%02d')]);
end
%     for i = 1:12
%         y = num2str(yy(i),'%02d');
%         Contract(i+13) = cellstr([y(2),num2str(mm(i),'%02d')]);
%     end

hands = cell(50,1);
hands(1) = {'手数'};
hands(2) = {'UNKNOWN'};
for i = 3:50
    hands(i) = {num2str(i-2)};
end
% hands = {'手数';'1';'2';'3';'4';'5';'6';'7';'8';'9';'10';...
%         '11';'12';'13';'14';'15';'16';'17';'18';'19';'20';'21';'22';...
%         '23';'24';'25';'26';'27';'28'; };
    
action = {'操作';'开多';'开空';'平多';'平空'};

m = 4; % category,contract,action,hands
N = 13;
for n = 1:N
    
    h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
    % set(handles.popupmenu1,'string',{'游戏难度';'简单';'中等';'困难'});
    
    set(eval(h1),'string',category);
    set(eval(h1),'value',1);
    
    h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
    set(eval(h2),'string',Contract);
    set(eval(h2),'value',1);
    
    h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
    set(eval(h3),'string',action);
    set(eval(h3),'value',1);
    
    h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];
    set(eval(h4),'string',hands);
    set(eval(h4),'value',1);
    
end

set(handles.startAt,'string',{'21:00:00';'09:00:00';'Now'});

pp  = mfilename('fullpath');
i = strfind(pp,'\');
dir1 = pp(1:i(end));
load([dir1,'startAt.mat']);

set(handles.startAt,'value',startAt);
set(handles.TradeAccout,'string',{'国贸期货';'新湖期货';'SimNow 1';'SimNow 2'});

% pp  = mfilename('fullpath');
% i = strfind(pp,'\');
% dir1 = pp(1:i(end));
load([dir1,'AccountSelection.mat']);


set(handles.TradeAccout,'value',AccountSelection);

handles.category = category;
handles.Contract = Contract;
handles.hands = hands;
handles.action = action;
handles.m = m;
handles.N = N;

handles.abPos = cell(25,6);

% Choose default command line output for panel
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes panel wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 
% 加载默认的订单文件
% directory = 'D:\wangwy\m\跟踪开仓\';
pp  = mfilename('fullpath');
i = strfind(pp,'\');
directory = pp(1:i(end-1));
directory = [directory,'记录资金\'];

% filename = [directory, '订单.csv'];
% if exist(filename,'file') == 2
%     handles.filename = filename;
%     readOrdersFile(hObject, eventdata, handles);
% end

rowname ={'1','2','3','4','5','6','7','8',...
    '9','10','11','12','13','14','15','16','17','18', ...
    '19','20','21','22'};  

columnname ={'策略', '持仓状态','','持仓', '持仓状态','持仓手数'}; 
set(handles.uitable2,'columnname',columnname) 
set(handles.uitable2,'rowname',rowname) 

set(handles.radiobutton16,'value',1) 

handles.IsDataUpdateCompleted = 0;
handles.Step1_GetMyAccount_Flg = 0;
% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = panel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure

% varargout{1} = handles.output;
varargout{1} = handles; % Modified by wwy

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

% value = get(handles.popupmenu1, 'value');
% switch value
%     case 2
%         disp('You');      
%     case 3        
%         disp('are');
%     case 4
%         disp('unique.');
% end 


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu8


% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu9


% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu10.
function popupmenu10_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu10


% --- Executes during object creation, after setting all properties.
function popupmenu10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu11.
function popupmenu11_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu11 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu11


% --- Executes during object creation, after setting all properties.
function popupmenu11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu12.
function popupmenu12_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu12 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu12


% --- Executes during object creation, after setting all properties.
function popupmenu12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu13.
function popupmenu13_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu13 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu13


% --- Executes during object creation, after setting all properties.
function popupmenu13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu14.
function popupmenu14_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu14 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu14


% --- Executes during object creation, after setting all properties.
function popupmenu14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu15.
function popupmenu15_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu15 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu15


% --- Executes during object creation, after setting all properties.
function popupmenu15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu16.
function popupmenu16_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu16 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu16


% --- Executes during object creation, after setting all properties.
function popupmenu16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu17.
function popupmenu17_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu17 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu17


% --- Executes during object creation, after setting all properties.
function popupmenu17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu18.
function popupmenu18_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu18 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu18


% --- Executes during object creation, after setting all properties.
function popupmenu18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu19.
function popupmenu19_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu19 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu19


% --- Executes during object creation, after setting all properties.
function popupmenu19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu20.
function popupmenu20_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu20 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu20


% --- Executes during object creation, after setting all properties.
function popupmenu20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(gcf)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% AccountSelection = get(handles.TradeAccout,'value');
% if AccountSelection~=4
%     [~,IsNowClosed,~] = IsMarketClosed(now);
%     if strcmp(IsNowClosed,'休市')
%         fprintf(2,'现在休市！\n');
%         return;
%     end;
% end

clc;

if ~isempty(timerfind)
    stop(timerfind);
end
delete(timerfind);

close(setdiff(findobj('menubar','figure','-or','menubar','none'),gcf));

% value = get(handles.popupmenu1, 'value')

% orders = {
%     struct('contract', 'CU1702', 'action', 'Buy Open', 'hands', 5, 'price', 2035)
%     struct('contract', 'SR1705', 'action', 'Sell Open', 'hands', 10, 'price', 123)
%     struct('contract', 'Y1705', 'action', 'Buy EvenUp', 'hands', 17, 'price', 458)
%     % struct('contract', 'ru1705', 'action', 'Sell EvenUp', 'hands', 62, 'price', 1023)
%     };

% m = 4; % category,contract,action,hands
m = handles.m;
N = handles.N;

orders = cell(1,N);

category = handles.category;
yearMonth = handles.Contract;
% action = handles.action;
action = {'操作','Buy Open','Sell Open', 'Sell EvenUp', 'Buy EvenUp'};
hands = handles.hands;

nCount = 0;
for n = 1:N
    h = ['handles.radiobutton', num2str(n)];
    set(eval(h),'value',0);
    
    h1 = ['handles.popupmenu', num2str((n-1)*m + 1)]; % category
    h2 = ['handles.popupmenu', num2str((n-1)*m + 2)]; % contract
    h3 = ['handles.popupmenu', num2str((n-1)*m + 3)]; % action
    h4 = ['handles.popupmenu', num2str((n-1)*m + 4)]; % hands
    value1 = get(eval(h1), 'value');
    value2 = get(eval(h2), 'value');
    value3 = get(eval(h3), 'value');
    value4 = get(eval(h4), 'value');
    
    if (value1==1)||(value2==1)||(value3==1)||(value4==1)
        continue;
    end
    
    nCount = nCount+1;
    
    cy = category{value1};
    pos = find(cy == ' ');
    cy = cy(1:pos-1);
    
    orders{nCount}.contract = [cy,yearMonth{value2}];
    orders{nCount}.action = action{value3};
    orders{nCount}.hands = hands{value4};
    orders{nCount}.n = n;
end
orders = orders(1:nCount);
% orders %#ok
% orders{1:nCount} %#ok

% save orders orders;
% Open_CloseOut1;
Open_CloseOut_func(orders,handles)

% 显示是否已经下单
% h = ['handles.radiobutton', '1'];
% set(eval(h),'value',1);


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if ~isempty(timerfind)
    stop(timerfind);
end
delete(timerfind);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% 打开 csv 文件
pp  = mfilename('fullpath');
i = strfind(pp,'\');
directory = pp(1:i(end-1));
directory = [directory,'记录资金\'];
[FileName,PathName] = uigetfile([directory,'*.csv'],'Select the CSV-file');

% 读 CSV 文件
filename = [PathName,FileName];
if sum(filename) == 0
    return; 
else
    handles.filename = filename;
    pushbutton6_Callback(hObject, eventdata, handles);
    readOrdersFile(hObject, eventdata, handles);
end

% -------------------------- 下面这部分被放到了一个函数中 -------------------%

% ------------------------------------------------------------------------- %

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% m = 4; % category,contract,action,hands
m = handles.m;
N = handles.N;
for n = 1:N
    h = ['handles.radiobutton', num2str(n)];
    set(eval(h),'value',0);
    
    h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
    h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
    h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
    h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];
    
    value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;
    
    set(eval(h1),'value',value1);
    set(eval(h2),'value',value2);
    set(eval(h3),'value',value3);
    set(eval(h4),'value',value4);
    
end


% --- Executes on selection change in popupmenu21.
function popupmenu21_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu21 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu21


% --- Executes during object creation, after setting all properties.
function popupmenu21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu22.
function popupmenu22_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu22 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu22


% --- Executes during object creation, after setting all properties.
function popupmenu22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu23.
function popupmenu23_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu23 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu23


% --- Executes during object creation, after setting all properties.
function popupmenu23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu24.
function popupmenu24_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu24 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu24


% --- Executes during object creation, after setting all properties.
function popupmenu24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu25.
function popupmenu25_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu25 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu25


% --- Executes during object creation, after setting all properties.
function popupmenu25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu26.
function popupmenu26_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu26 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu26


% --- Executes during object creation, after setting all properties.
function popupmenu26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu27.
function popupmenu27_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu27 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu27


% --- Executes during object creation, after setting all properties.
function popupmenu27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu28.
function popupmenu28_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu28 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu28


% --- Executes during object creation, after setting all properties.
function popupmenu28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = handles.m;
n = 1;

h = ['handles.radiobutton', num2str(n)];
set(eval(h),'value',0);

h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];

value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;

set(eval(h1),'value',value1);
set(eval(h2),'value',value2);
set(eval(h3),'value',value3);
set(eval(h4),'value',value4);
    



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = handles.m;
n = 2;

h = ['handles.radiobutton', num2str(n)];
set(eval(h),'value',0);

h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];

value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;

set(eval(h1),'value',value1);
set(eval(h2),'value',value2);
set(eval(h3),'value',value3);
set(eval(h4),'value',value4);


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = handles.m;
n = 7;

h = ['handles.radiobutton', num2str(n)];
set(eval(h),'value',0);

h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];

value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;

set(eval(h1),'value',value1);
set(eval(h2),'value',value2);
set(eval(h3),'value',value3);
set(eval(h4),'value',value4);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = handles.m;
n = 6;

h = ['handles.radiobutton', num2str(n)];
set(eval(h),'value',0);

h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];

value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;

set(eval(h1),'value',value1);
set(eval(h2),'value',value2);
set(eval(h3),'value',value3);
set(eval(h4),'value',value4);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = handles.m;
n = 5;

h = ['handles.radiobutton', num2str(n)];
set(eval(h),'value',0);

h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];

value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;

set(eval(h1),'value',value1);
set(eval(h2),'value',value2);
set(eval(h3),'value',value3);
set(eval(h4),'value',value4);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = handles.m;
n = 4;

h = ['handles.radiobutton', num2str(n)];
set(eval(h),'value',0);

h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];

value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;

set(eval(h1),'value',value1);
set(eval(h2),'value',value2);
set(eval(h3),'value',value3);
set(eval(h4),'value',value4);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = handles.m;
n = 3;

h = ['handles.radiobutton', num2str(n)];
set(eval(h),'value',0);

h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];

value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;

set(eval(h1),'value',value1);
set(eval(h2),'value',value2);
set(eval(h3),'value',value3);
set(eval(h4),'value',value4);

function readOrdersFile(hObject, eventdata, handles)

filename = handles.filename;
% 读 CSV 文件
dstruct = importdata(filename);
textdata = dstruct.textdata;
sizeTextdata = size(textdata);
sizeData = size(dstruct.data);
handsNum = cell(sizeTextdata(1),1);
handsNum(1:sizeData(1)) = num2cell(dstruct.data);
if sizeData(1)<sizeTextdata(1)
    handsNum(sizeData(1)+1:end) = {NaN};
end
orders = [textdata  handsNum];

% orders = [textdata  num2cell(dstruct.data)];

% 取出当天日期的交易单
orders = orders(~strcmp(orders(:,1),''),:);

orders = orders( datenum(orders(:,1)) == ...
    datenum(datestr(now,'yyyy-mm-dd')),: );

sizeOrders = size(orders);
nOrders = sizeOrders(1);
if nOrders == 0
    return;
end

ordersTmp = [];
for i = 1:nOrders
    if length(orders{i,3}) == 4
        oo = [orders(i,1),orders(i,2),{orders{i,3}(1:2)}, NaN;...
            orders(i,1),orders(i,2),{orders{i,3}(3:4)}, orders(i,4)];
        ordersTmp = [ordersTmp; oo]; %#ok
    else
        ordersTmp = [ordersTmp;orders(i,:)];  %#ok
    end    
end
orders = ordersTmp;
sizeOrders = size(orders);
nOrders = sizeOrders(1);

% 手数未知的订单
nanPos = find(isnan(cell2mat(orders(:,end))) == 1);

HandsUnknownOrders = orders(nanPos,:); 

% 读持仓文件，以获得平仓手数
pp  = mfilename('fullpath');
i = strfind(pp,'\');
directory = pp(1:i(end-1));
directory = [directory,'记录资金\'];
filename = [directory,'持仓.csv'];
if exist(filename,'file') == 2
    xx = importdata(filename);
    td = xx.textdata;
    cc = td(:,2);
    ls =  td(:,3);
    % hs = td(:,4);
    hs = xx.data; hs = [0 ; hs];
end

sizeEvenUpOrders = size(HandsUnknownOrders);
nEvenUpOrders = sizeEvenUpOrders(1);

for i = 1:nEvenUpOrders
    contractTmp = HandsUnknownOrders{i,2};
    if ~isempty( intersect( contractTmp(1:2),...
            {'CF','FG','MA','OI','SR','TA','cf','fg','ma','oi','sr','ta'}))
        contractTmp(3) = [];
        HandsUnknownOrders(i,2) = {contractTmp};
    end
end


for i = 1:nEvenUpOrders
    rowIndex = strcmpi(HandsUnknownOrders(i,2),cc);
    if sum(rowIndex) == 1
        lstmp = ls(rowIndex);
        lstmp{1}(char(lstmp) == ' ') = [];
        if strcmp(HandsUnknownOrders{i,3}(2),lstmp{1})          
            % orders(tt(i),4) = num2cell(str2double(hs{rowIndex}));
            orders(nanPos(i),4) = num2cell(hs(rowIndex));
        end
        % 换合约的订单
        if strcmp(HandsUnknownOrders{i,3},'(换合约)')          
            % orders(tt(i),4) = num2cell(str2double(hs{rowIndex}));
            orders(nanPos(i),4) = num2cell(hs(rowIndex));
            orders(nanPos(i),3) = {['平',ls{rowIndex},'(换合约)']};
        end
        
    end
end

% 合并相同的行
tmpOrders = cell(sizeOrders(1),1);
for i = 1:sizeOrders(1)
  tmpOrders(i) = {[orders{i,1},orders{i,2},orders{i,3}]};
end
warning('off'); %#ok
[~,ia,~] = unique(tmpOrders,'rows');
orders = orders(ia,:);

% % 去除非持仓的平仓订单 2017.9.11
NaNpos = find(isnan(cell2mat(orders(:,4))) == 1);
orders(NaNpos(~ismember(orders(NaNpos,3),'(换合约)')),:) = [];

% 处理换合约的开仓手数 2017.9.10
sizeOrders = size(orders);
nOrders = sizeOrders(1);
category = cell(nOrders,1);
for i = 1:nOrders
    tmp = orders{i,2};
    tmp = tmp(isletter(tmp));
    category(i) = {tmp};
end
NaNpos = find(isnan(cell2mat(orders(:,4))) == 1);

for i = 1:length(NaNpos)
    tmp = orders{NaNpos(i),2};
    tmp = tmp(isletter(tmp));
    pos = find(strcmp(category,tmp) == 1);
    pos = setdiff(pos,NaNpos(i));
    if strcmp(orders{pos,3}(end-4:end),orders{NaNpos(i),3})
        orders(NaNpos(i),4) = orders(pos,4);
        if strcmp(orders{pos,3}(1:2) , '平空')
            orders(NaNpos(i),3) =  {['开空',orders{NaNpos(i),3}]};
        end
        if strcmp(orders{pos,3}(1:2) , '平多')
            orders(NaNpos(i),3) = {['开多',orders{NaNpos(i),3}]};
        end
    end
end



category = {'品种';'A';'AG';'AL';'AU'; ...
    'C';'CF';'CU';'FG';'J';'L';'M'; ...
    'MA';'OI';'P';'RB';'RU';'SR';...
    'TA';'V';'Y';'ZN';'IF'};
% strcmp( 'SR' , category)

yearMonth = handles.Contract;
action = handles.action;
hands = handles.hands;
% 相同项合并

% m = 4; % category,contract,action,hands
m = handles.m;
N = handles.N;
for n = 1:N
    h = ['handles.radiobutton', num2str(n)];
    set(eval(h),'value',0);
    
    h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
    h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
    h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
    h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];
    
    if n<= nOrders
        value1 = find( strcmpi( orders{n,2}(1:end-4), category) == 1);
        value2 = find( strcmp( orders{n,2}(end-3:end), yearMonth) == 1);
        value3 = find( strcmp( orders{n,3}(1:2), action) == 1);
        if isnan(orders{n,4})
            value4 = 2;
        else
            value4 = find( strcmp( num2str(orders{n,4}), hands) == 1);
        end
    else
        value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;
    end
       
    set(eval(h1),'value',value1);
    set(eval(h2),'value',value2);
    set(eval(h3),'value',value3);
    set(eval(h4),'value',value4);
    
end


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(setdiff(findobj('menubar','figure','-or','menubar','none'),gcf));


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton15,'Enable','off');

pp  = mfilename('fullpath');
nn = strfind(pp,'\');
directory1 = pp(1:nn(end-1));
directory1 = [directory1,'记录资金'];
cd(directory1);

% 测试登录能否成功
pushbutton24_Callback(hObject, eventdata, handles);
global LoginFlg;
if strcmp(LoginFlg , '未登录成功')
    set(handles.pushbutton15,'Enable','on');
    return;
end

% 记录资金-查询订单-更新(或生成)订单文件
IsSuccessful = GenOrders(handles);
pause(.1);

if IsSuccessful==1
    % 加载默认的订单文件
    filename = [directory1, '\订单.csv'];
    if exist(filename,'file') == 2
        handles.filename = filename;
        readOrdersFile(hObject, eventdata, handles);
    end
end

set(handles.pushbutton15,'Enable','on');

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on selection change in startAt.
function startAt_Callback(hObject, eventdata, handles)
% hObject    handle to startAt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns startAt contents as cell array
%        contents{get(hObject,'Value')} returns selected item from startAt
startAt = get(handles.startAt,'value'); %#ok

pp  = mfilename('fullpath');
i = strfind(pp,'\');
directory = pp(1:i(end));
save([directory,'startAt.mat'], 'startAt');


% --- Executes during object creation, after setting all properties.
function startAt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startAt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in TradeAccout.
function TradeAccout_Callback(hObject, eventdata, handles)
% hObject    handle to TradeAccout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns TradeAccout contents as cell array
%        contents{get(hObject,'Value')} returns selected item from TradeAccout
AccountSelection = get(handles.TradeAccout,'value'); %#ok
pp  = mfilename('fullpath');
i = strfind(pp,'\');
directory = pp(1:i(end));
save([directory,'AccountSelection.mat'], 'AccountSelection');


% --- Executes during object creation, after setting all properties.
function TradeAccout_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TradeAccout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

directory = mfilename('fullpath');
pp = strfind(directory,'\');
directory = directory(1:pp(end));
st = dir(fullfile(directory,'TradableContract.mat'));

UpdatedDay = datestr(st.datenum,'yyyy-mm-dd');
choice = questdlg({'上次更新日期为: ';...
    UpdatedDay;...
    '距离今天: ';[num2str(datenum(date) - datenum(UpdatedDay)),' 天'] }, ...
    '更新日期', ...
    '继续','退出','退出');
% Handle response
switch choice
    case '继续'
    case '退出'
        return;
end

set(handles.pushbutton23,'Enable','off');
set(handles.TradeAccout,'value',4);

AccountSelection = get(handles.TradeAccout,'value');

if AccountSelection == 3
    % SimNow 1   交易阶段(服务时间)：与实际生产环境保持一致
    FRONT_ADDR_TD = 'tcp://180.168.146.187:10000';
    BROKER_ID = '9999';
    INVESTOR_ID = '101042';
    PASSWORD = '518888';
end

if AccountSelection == 4
    % SimNow 2
    %  交易阶段(服务时间)：交易日，16：00～次日09：00；非交易日，16：00～次日15：00。
    % 账户、钱、仓跟第一套环境上一个交易日保持一致。
    FRONT_ADDR_TD = 'tcp://180.168.146.187:10030';
    BROKER_ID = '9999';
    INVESTOR_ID = '101042';
    PASSWORD = '518888';
end

if AccountSelection == 1
    % 快期-国贸期货
    FRONT_ADDR_TD = 'tcp://61.152.165.100:41201';
    BROKER_ID = '0187';
    INVESTOR_ID = '28006311';
    PASSWORD = '518888';
end

if AccountSelection == 2
    % 快期-新湖期货
    FRONT_ADDR_TD = 'tcp://116.228.171.216:41205';
    BROKER_ID = '6090';
    INVESTOR_ID = '10501951';
    PASSWORD = '202031';
end
Contract = 'ALL';

set(handles.pushbutton23,'Enable','off');
TradableContract = GetTradableContracts(FRONT_ADDR_TD,BROKER_ID,...
    INVESTOR_ID,PASSWORD,Contract); %#ok


% 当前路径下 （mat和m文件在一起）：  load  ***.mat; 
% 在下一级路径下：  load  .\下一级路径的文件名\***.mat; 
% 在上一级路径下：  load  ..\***.mat; 
% 在平行文件夹内:   load  ..\平行的文件夹\***.mat;
pp  = mfilename('fullpath');
i = strfind(pp,'\');
dir1 = pp(1:i(end));
save([dir1,'TradableContract.mat'], 'TradableContract');

set(handles.pushbutton23,'Enable','on');


% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

AccountSelection = get(handles.TradeAccout,'value');

if AccountSelection == 3
    % SimNow 1   交易阶段(服务时间)：与实际生产环境保持一致
    FRONT_ADDR_TD = 'tcp://180.168.146.187:10000';
    BROKER_ID = '9999';
    INVESTOR_ID = '101042';
    PASSWORD = '518888';
end

if AccountSelection == 4
    % SimNow 2
    %  交易阶段(服务时间)：交易日，16：00～次日09：00；非交易日，16：00～次日15：00。
    % 账户、钱、仓跟第一套环境上一个交易日保持一致。
    FRONT_ADDR_TD = 'tcp://180.168.146.187:10030';
    BROKER_ID = '9999';
    INVESTOR_ID = '101042';
    PASSWORD = '518888';
end

if AccountSelection == 1
    % 快期-国贸期货
    FRONT_ADDR_TD = 'tcp://61.152.165.100:41201';
    BROKER_ID = '0187';
    INVESTOR_ID = '28006311';
    PASSWORD = 'wy518888';
end

if AccountSelection == 2
    % 快期-新湖期货
    FRONT_ADDR_TD = 'tcp://116.228.171.216:41205';
    BROKER_ID = '6090';
    INVESTOR_ID = '10501951';
    PASSWORD = 'wy518888';
end

set(handles.text8,'string','');

global LoginFlg;

LoginFlg = LoginTest(FRONT_ADDR_TD,BROKER_ID,...
    INVESTOR_ID,PASSWORD);

set(handles.text8,'string',LoginFlg);


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% addpath C:\D\future\数据维护;
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-3));
path = [directory,'数据维护'];
addpath(path);

IsDataUpdateCompleted = main_csv888Refresh_daily(handles);
handles.IsDataUpdateCompleted = IsDataUpdateCompleted;
% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function pushbutton15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in popupmenu29.
function popupmenu29_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu29 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu29


% --- Executes during object creation, after setting all properties.
function popupmenu29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu30.
function popupmenu30_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu30 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu30


% --- Executes during object creation, after setting all properties.
function popupmenu30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu32.
function popupmenu32_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu32 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu32


% --- Executes during object creation, after setting all properties.
function popupmenu32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu31.
function popupmenu31_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu31 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu31


% --- Executes during object creation, after setting all properties.
function popupmenu31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu33.
function popupmenu33_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu33 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu33


% --- Executes during object creation, after setting all properties.
function popupmenu33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu34.
function popupmenu34_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu34 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu34


% --- Executes during object creation, after setting all properties.
function popupmenu34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu36.
function popupmenu36_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu36 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu36


% --- Executes during object creation, after setting all properties.
function popupmenu36_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu35.
function popupmenu35_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu35 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu35


% --- Executes during object creation, after setting all properties.
function popupmenu35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu37.
function popupmenu37_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu37 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu37


% --- Executes during object creation, after setting all properties.
function popupmenu37_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu38.
function popupmenu38_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu38 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu38


% --- Executes during object creation, after setting all properties.
function popupmenu38_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu40.
function popupmenu40_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu40 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu40


% --- Executes during object creation, after setting all properties.
function popupmenu40_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu39.
function popupmenu39_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu39 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu39


% --- Executes during object creation, after setting all properties.
function popupmenu39_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu41.
function popupmenu41_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu41 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu41


% --- Executes during object creation, after setting all properties.
function popupmenu41_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu42.
function popupmenu42_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu42 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu42


% --- Executes during object creation, after setting all properties.
function popupmenu42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu44.
function popupmenu44_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu44 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu44


% --- Executes during object creation, after setting all properties.
function popupmenu44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu43.
function popupmenu43_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu43 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu43


% --- Executes during object creation, after setting all properties.
function popupmenu43_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu45.
function popupmenu45_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu45 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu45


% --- Executes during object creation, after setting all properties.
function popupmenu45_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu46.
function popupmenu46_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu46 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu46


% --- Executes during object creation, after setting all properties.
function popupmenu46_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu48.
function popupmenu48_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu48 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu48


% --- Executes during object creation, after setting all properties.
function popupmenu48_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu47.
function popupmenu47_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu47 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu47


% --- Executes during object creation, after setting all properties.
function popupmenu47_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu49.
function popupmenu49_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu49 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu49


% --- Executes during object creation, after setting all properties.
function popupmenu49_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu50.
function popupmenu50_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu50 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu50


% --- Executes during object creation, after setting all properties.
function popupmenu50_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu52.
function popupmenu52_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu52 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu52


% --- Executes during object creation, after setting all properties.
function popupmenu52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu51.
function popupmenu51_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu51 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu51


% --- Executes during object creation, after setting all properties.
function popupmenu51_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton10


% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton11


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton12


% --- Executes on button press in radiobutton13.
function radiobutton13_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton13


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = handles.m;
n = 8;

h = ['handles.radiobutton', num2str(n)];
set(eval(h),'value',0);

h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];

value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;

set(eval(h1),'value',value1);
set(eval(h2),'value',value2);
set(eval(h3),'value',value3);
set(eval(h4),'value',value4);

% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = handles.m;
n = 9;

h = ['handles.radiobutton', num2str(n)];
set(eval(h),'value',0);

h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];

value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;

set(eval(h1),'value',value1);
set(eval(h2),'value',value2);
set(eval(h3),'value',value3);
set(eval(h4),'value',value4);

% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = handles.m;
n = 10;

h = ['handles.radiobutton', num2str(n)];
set(eval(h),'value',0);

h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];

value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;

set(eval(h1),'value',value1);
set(eval(h2),'value',value2);
set(eval(h3),'value',value3);
set(eval(h4),'value',value4);

% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = handles.m;
n = 11;

h = ['handles.radiobutton', num2str(n)];
set(eval(h),'value',0);

h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];

value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;

set(eval(h1),'value',value1);
set(eval(h2),'value',value2);
set(eval(h3),'value',value3);
set(eval(h4),'value',value4);

% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = handles.m;
n = 12;

h = ['handles.radiobutton', num2str(n)];
set(eval(h),'value',0);

h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];

value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;

set(eval(h1),'value',value1);
set(eval(h2),'value',value2);
set(eval(h3),'value',value3);
set(eval(h4),'value',value4);

% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = handles.m;
n = 13;

h = ['handles.radiobutton', num2str(n)];
set(eval(h),'value',0);

h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];

value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;

set(eval(h1),'value',value1);
set(eval(h2),'value',value2);
set(eval(h3),'value',value3);
set(eval(h4),'value',value4);


% --- Executes during object deletion, before destroying properties.
function uipanel2_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in radiobutton14.
function radiobutton14_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton14

if get(handles.radiobutton14,'value')
    
    pp  = mfilename('fullpath');
    i = strfind(pp,'\');
    
    filename = [pp(1:i(end-1)),'DIARY\diary_',datestr(now,'yyyymmddTHHMMSS'),'.txt'];
    
    diary off;
    diary(filename);
    
    %  To see the name of the diary file, use get(0,'DiaryFile').
    get(0,'DiaryFile')
    
else
    diary off;
end


% --- Executes on button press in refreshButton.
function refreshButton_Callback(hObject, eventdata, handles)
% hObject    handle to refreshButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text9,'string','');
set(handles.text11,'string','');
set(handles.text10,'string','');

[IsTodayClosed,IsNowClosed,IsTomorrowClosed] = IsMarketClosed(now);
set(handles.text9,'string',['今日 : ',IsTodayClosed]);
set(handles.text11,'string',['现在 : ',IsNowClosed]);
set(handles.text10,'string',['明日 : ',IsTomorrowClosed]);


% --- Executes on button press in ApplyStrategyButton.
function ApplyStrategyButton_Callback(hObject, eventdata, handles)
% hObject    handle to ApplyStrategyButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

PltFlg = get(handles.radiobutton15,'value');

PosStatus = StrategyMainFunc01(PltFlg);

fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end));
fn1 = [directory,'strategyPos.mat'];
fn2 = [directory,'strategyPosLen.mat'];

if ~isempty(PosStatus)
    xx = cell(length(PosStatus),2);
    for i = 1:length(PosStatus)
        xx(i,1) = {PosStatus(i).a};
        if PosStatus(i).b == -1
            xx(i,2) = {'空'};
        else
            xx(i,2) = {'多'};
        end
    end
    xx(:,1) = upper(xx(:,1));
    strategyPos = sortrows(xx);
    strategyPosLen = length(PosStatus);
%     save strategyPos strategyPos;
%     save strategyPosLen strategyPosLen;
    save(fn1,'strategyPos');
    save(fn2,'strategyPosLen');
else 
%     load strategyPos;
%     load strategyPosLen;
    load(fn1); 
    load(fn2);
end

handles.abPos(1:strategyPosLen,1:2) = strategyPos;
handles.abPosLen1 = strategyPosLen;

% Update handles structure
guidata(hObject, handles);

set(handles.uitable2,'Data',handles.abPos)

% rowname ={'1','2','3','4','5','6','7','8',...
%     '9','10','11','12','13','14','15','16','17','18', ...
%     '19','20','21','22'};  
% set(handles.uitable2,'rowname',rowname(1:length(PosStatus))); 

1;


% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton34,'Enable','off');

pushbutton24_Callback(hObject, eventdata, handles);
global LoginFlg;
if strcmp(LoginFlg , '未登录成功')
    set(handles.pushbutton15,'Enable','on');
else
    GetAccount(handles);
end

set(handles.pushbutton34,'Enable','on');

% 读 CSV 文件
% filename = 'C:\D\future\m\跟踪开仓-记录资金-图像识别-4\记录资金\持仓.csv';
fp  = mfilename('fullpath');
pp = strfind(fp,'\');
directory = fp(1:pp(end-1));
filename = [directory,'记录资金\持仓.csv'];


dstruct = importdata(filename);
if isempty(dstruct)
    return;
end

hands = dstruct.data;
pos = find(hands~=0);

textdata = dstruct.textdata;
xx = [textdata(pos+1,[2,3]),cellstr(num2str(hands(pos)))];
xx(:,1) = upper(xx(:,1));

sizexx = size(xx);
emptyRowInd = [];
for i = 1:sizexx(1)
    if strfind(xx{i,1},'SPC')
        emptyRowInd = [i,emptyRowInd]; %#ok
    end
end
xx(emptyRowInd,:) = [];

AcountPos = sortrows(xx);

AcountPos = convertTo1xxx(AcountPos);

handles.abPos(1:length(pos)-length(emptyRowInd),4:6) = AcountPos;
handles.abPosLen2 = length(pos)-length(emptyRowInd);
% Update handles structure
guidata(hObject, handles);

set(handles.uitable2,'Data',handles.abPos)

% ---------- 设置表格单元格颜色 -----------
% % data{1,1}=['<html><table><tr><td width=100 bgcolor="red">','<FONT face="Times New Roman"size="4"color=black">',num2str(data{1,1},'%10.4f'), '</table></html>'];
% data = rand(6,6);
% data = mat2cell(data,ones(1,size(data,1)),ones(1,size(data,2)));
% data{1,1}=['<html><table><tr><td width=100 bgcolor="red">','<FONT face="Times New Roman"size="4"color=black">',num2str(data{1,1}), '</table></html>'];
% set(handles.uitable2,'Data',data)

if ~isempty(handles.abPos{1,1})
    
    cpd1 = cell(handles.abPosLen1,1);
    for i = 1:handles.abPosLen1
        cpd1(i) = {[handles.abPos{i,1},handles.abPos{i,2}]};
    end
    cpd2 = cell(handles.abPosLen2,1);
    for i = 1:handles.abPosLen2
        cpd2(i) = {[handles.abPos{i,4},handles.abPos{i,5}]};
    end
    
    [~,ia] = setdiff(cpd1,cpd2);
    [~,ib] = setdiff(cpd2,cpd1);
    
    fprintf('\n');
    if ~isempty(ia)
        fprintf(2,'少开的：\n');
        disp(cpd1(ia));
    end
    if ~isempty(ib)
        fprintf(2,'多开的：\n');
        disp(cpd2(ib));
    end
    fprintf('\n');
    
    if ~isempty(ia)
        for i = 1:length(ia)
            handles.abPos{ia(i),1} = ['<html><table><tr><td width=100 bgcolor="red">','<FONT face="Times New Roman"size="5"color=black">',handles.abPos{ia(i),1}, '</table></html>'];
        end
    end
    
    if ~isempty(ib)
        for i = 1:length(ib)
            handles.abPos{ib(i),4} = ['<html><table><tr><td width=100 bgcolor="red">','<FONT face="Times New Roman"size="5"color=black">',handles.abPos{ib(i),4}, '</table></html>'];
        end
    end
    
    set(handles.uitable2,'Data',handles.abPos)
    
end


% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton15


% --- Executes on button press in pushbutton36.
function pushbutton36_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text13,'Enable','off');

set(handles.pushbutton36,'Enable','off');

pushbutton24_Callback(hObject, eventdata, handles);
global LoginFlg;
if strcmp(LoginFlg , '未登录成功')
    set(handles.pushbutton36,'Enable','on');
    return;
end

GetAccount(handles)
set(handles.pushbutton36,'Enable','on');


% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% DOS 命令
!taskkill /F /IM testTraderApi.exe /T


% --- Executes on button press in pushbutton40.
function pushbutton40_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.Step1_GetMyAccount_Flg = 0;
guidata(hObject, handles);

pp  = mfilename('fullpath');
nn = strfind(pp,'\');
directory1 = pp(1:nn(end-1));
directory1 = [directory1,'记录资金'];
cd(directory1);

% 测试登录能否成功
pushbutton24_Callback(hObject, eventdata, handles);
global LoginFlg;
if strcmp(LoginFlg , '未登录成功')
    set(handles.pushbutton15,'Enable','on');
    return;
end

% 记录资金-查询订单-更新(或生成)订单文件
IsSuccessful = GetMyAccount(handles);
pause(.1);

handles.Step1_GetMyAccount_Flg = IsSuccessful;
guidata(hObject, handles);

% --- Executes on button press in radiobutton16.
function radiobutton16_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton16


% --- Executes on button press in pushbutton41.
function pushbutton41_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

IsSuccessful = GenOrders1(handles);

% --- Executes on button press in pushbutton42.
function pushbutton42_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% filename = handles.filename;

pp  = mfilename('fullpath');
nn = strfind(pp,'\');
directory1 = pp(1:nn(end-1));
directory1 = [directory1,'记录资金\'];

AccountSelection = get(handles.TradeAccout,'value');
switch AccountSelection
    case 1
        adInfo = '国贸期货';
    case 2
        adInfo = '新湖期货';
    case 3
        adInfo = 'SimNow1';
    case 4
        adInfo = 'SimNow2';
end

filename = [directory1,'订单-',adInfo,'.csv'];
if exist(filename,'file') ~= 2
    fprintf(2,'订单文件不存在！\n');
    return;
end

% 读 CSV 文件
dstruct = importdata(filename);
if isfield(dstruct,'textdata')
    textdata = dstruct.textdata;
    sizeTextdata = size(textdata);
    sizeData = size(dstruct.data);
    handsNum = cell(sizeTextdata(1),1);
    handsNum(1:sizeData(1)) = num2cell(dstruct.data);
    if sizeData(1)<sizeTextdata(1)
        handsNum(sizeData(1)+1:end) = {NaN};
    end
    orders = [textdata  handsNum];
else
    orders = dstruct;
    sizeOrd = size(orders);
    orders = [dstruct, num2cell(NaN*ones(sizeOrd(1),1))];
end

% orders = [textdata  num2cell(dstruct.data)];

% 取出当天日期的交易单
orders = orders(~strcmp(orders(:,1),''),:);

orders = orders( datenum(orders(:,1)) == ...
    datenum(datestr(now,'yyyy-mm-dd')),: );

sizeOrders = size(orders);
nOrders = sizeOrders(1);
if nOrders == 0
    fprintf(2,'今日无订单！\n');
    return;
end

ordersTmp = [];
for i = 1:nOrders
    if length(orders{i,3}) == 4
        oo = [orders(i,1),orders(i,2),{orders{i,3}(1:2)}, NaN;...
            orders(i,1),orders(i,2),{orders{i,3}(3:4)}, orders(i,4)];
        ordersTmp = [ordersTmp; oo]; %#ok
    else
        ordersTmp = [ordersTmp;orders(i,:)];  %#ok
    end    
end
orders = ordersTmp;
sizeOrders = size(orders);
% nOrders = sizeOrders(1);

% 手数未知的订单
nanPos = find(isnan(cell2mat(orders(:,end))) == 1);

HandsUnknownOrders = orders(nanPos,:); 

% 读持仓文件，以获得平仓手数
pp  = mfilename('fullpath');
i = strfind(pp,'\');
directory = pp(1:i(end-1));
directory = [directory,'记录资金\'];
filename = [directory,'持仓-',adInfo,'.csv'];
if exist(filename,'file') == 2
    xx = importdata(filename);
    td = xx.textdata;
    cc = td(:,2);
    ls =  td(:,3);
    % hs = td(:,4);
    hs = xx.data; hs = [0 ; hs];
end

sizeEvenUpOrders = size(HandsUnknownOrders);
nEvenUpOrders = sizeEvenUpOrders(1);

for i = 1:nEvenUpOrders
    contractTmp = HandsUnknownOrders{i,2};
    if ~isempty( intersect( contractTmp(1:2),...
            {'CF','FG','MA','OI','SR','TA','cf','fg','ma','oi','sr','ta'}))
        contractTmp(3) = [];
        HandsUnknownOrders(i,2) = {contractTmp};
    end
end


for i = 1:nEvenUpOrders
    rowIndex = strcmpi(HandsUnknownOrders(i,2),cc);
    if sum(rowIndex) == 1
        lstmp = ls(rowIndex);
        lstmp{1}(char(lstmp) == ' ') = [];
        if strcmp(HandsUnknownOrders{i,3}(2),lstmp{1})          
            % orders(tt(i),4) = num2cell(str2double(hs{rowIndex}));
            orders(nanPos(i),4) = num2cell(hs(rowIndex));
        end
        % 换合约的订单
        if strcmp(HandsUnknownOrders{i,3},'(换合约)')          
            % orders(tt(i),4) = num2cell(str2double(hs{rowIndex}));
            orders(nanPos(i),4) = num2cell(hs(rowIndex));
            orders(nanPos(i),3) = {['平',ls{rowIndex},'(换合约)']};
        end
        
    end
end

% 合并相同的行
tmpOrders = cell(sizeOrders(1),1);
for i = 1:sizeOrders(1)
  tmpOrders(i) = {[orders{i,1},orders{i,2},orders{i,3}]};
end
warning('off'); %#ok
[~,ia,~] = unique(tmpOrders,'rows');
orders = orders(ia,:);

% 处理换合约的开仓手数 2017.9.10
sizeOrders = size(orders);
nOrders = sizeOrders(1);
category = cell(nOrders,1);
for i = 1:nOrders
    tmp = orders{i,2};
    tmp = tmp(isletter(tmp));
    category(i) = {tmp};
end


% 20180727,换合约的同时，需要平仓或者反手
TABLE = tabulate(category);
p33 = find(cell2mat(TABLE(:,2))==3);
p44 = find(cell2mat(TABLE(:,2))==4);
p34 = [p33;p44];

AA = zeros(length(p34),1);
for i = 1:length(p34)
    pp = find(strcmp(category,TABLE{p34(i),1})==1);
    fprintf(2,[orders{pp(1),2},'   换合约&反手 ！\n']);
    aa = strfind(orders(pp,3),'(换合约)');
    aa = [{100};aa]; %#ok % 防止空cell不计入索引
    index1 = find([aa{:}] == 1); % 只有 '(换合约)'
    index3 = find([aa{:}] == 3); % '**(换合约)'
    AA(i) = pp(index1-1);
    % orders(pp(index1-1),:) = [];
    tt = orders{pp(index3-1),3};
    orders(pp(index3-1),3) = {tt(1:end-5)};
end
orders(AA,:) = [];
category(AA) = [];

% % 去除非持仓的平仓订单 2017.9.11
NaNpos = find(isnan(cell2mat(orders(:,4))) == 1);
pnp = NaNpos(~ismember(orders(NaNpos,3),'(换合约)'));
orders(pnp,:) = [];
category(pnp) = [];

NaNpos = find(isnan(cell2mat(orders(:,4))) == 1);

for i = 1:length(NaNpos)
    tmp = orders{NaNpos(i),2};
    tmp = tmp(isletter(tmp));
    pos = find(strcmp(category,tmp) == 1);
    pos = setdiff(pos,NaNpos(i));
    if strcmp(orders{pos,3}(end-4:end),orders{NaNpos(i),3})
        orders(NaNpos(i),4) = orders(pos,4);
        if strcmp(orders{pos,3}(1:2) , '平空')
            orders(NaNpos(i),3) =  {['开空',orders{NaNpos(i),3}]};
        end
        if strcmp(orders{pos,3}(1:2) , '平多')
            orders(NaNpos(i),3) = {['开多',orders{NaNpos(i),3}]};
        end
    end
end

orders %#ok

handles.orders20180817 = orders;
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in pushbutton43.
function pushbutton43_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if ~isfield(handles,'orders20180817')
    fprintf(2,'最终订单文件还未生成！\n');
    return;
end

orders = handles.orders20180817;
sizeOrders = size(orders);
nOrders = sizeOrders(1);

category = {'品种';'A';'AG';'AL';'AU'; ...
    'C';'CF';'CU';'FG';'J';'L';'M'; ...
    'MA';'OI';'P';'RB';'RU';'SR';...
    'TA';'V';'Y';'ZN';'IF'};
% strcmp( 'SR' , category)

yearMonth = handles.Contract;
action = handles.action;
hands = handles.hands;
% 相同项合并

% m = 4; % category,contract,action,hands
m = handles.m;
N = handles.N;
for n = 1:N
    h = ['handles.radiobutton', num2str(n)];
    set(eval(h),'value',0);
    
    h1 = ['handles.popupmenu', num2str((n-1)*m + 1)];
    h2 = ['handles.popupmenu', num2str((n-1)*m + 2)];
    h3 = ['handles.popupmenu', num2str((n-1)*m + 3)];
    h4 = ['handles.popupmenu', num2str((n-1)*m + 4)];
    
    if n<= nOrders
        value1 = find( strcmpi( orders{n,2}(1:end-4), category) == 1);
        value2 = find( strcmp( orders{n,2}(end-3:end), yearMonth) == 1);
        value3 = find( strcmp( orders{n,3}(1:2), action) == 1);
        if isnan(orders{n,4})
            value4 = 2;
        else
            value4 = find( strcmp( num2str(orders{n,4}), hands) == 1);
        end
    else
        value1 = 1;  value2 = 1;  value3 = 1;  value4 = 1;
    end
       
    set(eval(h1),'value',value1);
    set(eval(h2),'value',value2);
    set(eval(h3),'value',value3);
    set(eval(h4),'value',value4);
    
end


% --- Executes on button press in pushbutton44.
function pushbutton44_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fp  = mfilename('fullpath');
pp = strfind(fp,'\');

flg = get(handles.radiobutton17,'value');
if flg == 1
    directory2 = fp(1:pp(end-3));
    fileStruct = dir([directory2,'TB持仓\TB持仓情况*.csv']);
    dstrcut = importdata([directory2,'TB持仓\',fileStruct.name]);
    Position = dstrcut.data(:,2);
    if Position(1)~=100
        fprintf(2,'持仓文件内容格式不正确!\n');
        return;
    end
    PositionCell = cell(length(Position),2);
    PositionCell(:,1) = dstrcut.textdata;
    PositionCell(Position==1,2) = {'多'};
    PositionCell(Position==-1,2) = {'空'};
    PositionCell(Position==0,:) = [];
    PositionCell(Position==100,:) = [];
    strategyPos = sortrows(PositionCell,1);
    sp = size(strategyPos);
    strategyPosLen = sp(1);
else
    directory1 = fp(1:pp(end));
    fn1 = [directory1,'strategyPos.mat'];
    fn2 = [directory1,'strategyPosLen.mat'];
    load(fn1);
    load(fn2);
end

handles.abPos(:,1:2) = {[]};
handles.abPos(1:strategyPosLen,1:2) = strategyPos;
handles.abPosLen1 = strategyPosLen;

% Update handles structure
guidata(hObject, handles);

set(handles.uitable2,'Data',handles.abPos)

% rowname ={'1','2','3','4','5','6','7','8',...
%     '9','10','11','12','13','14','15','16','17','18', ...
%     '19','20','21','22'};  
% set(handles.uitable2,'rowname',rowname(1:length(PosStatus))); 

1;


% --- Executes on button press in radiobutton17.
function radiobutton17_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton17
