function varargout = gui1(varargin)
% GUI1 MATLAB code for gui1.fig
%      GUI1, by itself, creates a new GUI1 or raises the existing
%      singleton*.
%
%      H = GUI1 returns the handle to a new GUI1 or the handle to
%      the existing singleton*.
%
%      GUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI1.M with the given input arguments.
%
%      GUI1('Property','Value',...) creates a new GUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui1

% Last Modified by GUIDE v2.5 05-Jan-2014 20:33:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui1_OpeningFcn, ...
                   'gui_OutputFcn',  @gui1_OutputFcn, ...
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


% --- Executes just before gui1 is made visible.
function gui1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui1 (see VARARGIN)



% Choose default command line output for gui1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.listbox1,'String',{'连续' ,'波动幅度突破' ...
   });

set(handles.listbox3,'String',{'跟踪止损'  ...
   });

list = dir('*.csv'); celllist = struct2cell(list);
set(handles.listbox4,'String',celllist(1,:));
% set(handles.listbox4,'String',{'黄金' ,'锌','稻','铜','铅','棉花' ...
%     '玉米','橡胶','白银','棕榈油'});

 % 黄金
% dstruct = importdata('zn888.csv'); % 锌
% dstruct = importdata('er888.csv'); % 稻 
% dstruct = importdata('cu888.csv'); % 铜
% dstruct = importdata('pb888.csv'); % 铅
% dstruct = importdata('cf888.csv'); % 棉花
% dstruct = importdata('c9888.csv'); % 玉米
% dstruct = importdata('ru888.csv');   % 橡胶


% --- Outputs from this function are returned to the command line.
function varargout = gui1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clc;
%% 交易品种选择
list1 = get(handles.listbox4,'String');
index1 = get(handles.listbox4,'Value');
dataFileName = char(list1(index1));
% switch char(list1(index1))
%     case '黄金'
%         dataFileName = 'au888.csv';
%     case '锌'
%         dataFileName = 'zn888.csv';
%     case '稻'
%         dataFileName = 'er888.csv';
%     case '铜'
%         dataFileName = 'cu888.csv';
%     case '铅'
%         dataFileName = 'pb888.csv';
%     case '棉花'
%         dataFileName = 'cf888.csv';
%     case '玉米'
%         dataFileName = 'c9888.csv';
%     case '橡胶'
%         dataFileName = 'ru888.csv';
%     case '白银'
%         dataFileName = 'ag888.csv';
%     case '棕榈油'
%         dataFileName = 'p9888.csv';
%     otherwise
%         display '无此品种';
%         return;
% end

dstruct = importdata(dataFileName); 
display(dstruct.textdata(1,1))
data = dstruct.data;
o = data(:,1); h = data(:,2); l = data(:,3);
c = data(:,4); v = data(:,5); atr = data(:,7);

%% 入场规则选择
list = get(handles.listbox1,'String');
index = get(handles.listbox1,'Value');
switch char(list(index))
    case '连续'
        posEntry =  1:length(c)-1;
    otherwise
        display '无此入场规则';
        return;
end
%% 出场规则选择
list = get(handles.listbox3,'String');
index = get(handles.listbox3,'Value');
switch char(list(index))
    case '跟踪止损'
        nStart = 50;
        posEntry =  posEntry(posEntry>=nStart);
        posExit = zeros(size(posEntry));
        Rinit = zeros(size(posEntry));
        for posEntry1 = posEntry
            [posExit(posEntry1-nStart+1),Rinit(posEntry1-nStart+1)] = ExitRule2('goLong',posEntry1,c,atr,5,5);
        end
    otherwise
        display '无此入场规则';
        return;
end
%% 结果分析
re = (c(posExit)-c(posEntry));%./Rinit';
ep = mean(re); 
op = length(re)*240/length(c);
vr = sum(re>0)/length(re); 
% display(['平均收益风险比: ' num2str(ep) ...
%     '    交易机会: ' num2str(op) '次/年    胜率: ' num2str(vr)]);

pos1 = posEntry(re>=0); pos2 = posEntry(re<0);
re1 = re(re>=0); re2 = re(re<0);

set(handles.text6,'String',['平均收益风险比:   ' num2str(ep) ...
    10,10,'交易机会:   ' num2str(op) '次/年',10,10 ,'胜率:   ' num2str(vr)]);


%% 画图
% close figure(1）;
figure;plot(c,'LineWidth',2); hold on; grid
for i = 1:length(pos1)
    plot([pos1(i),pos1(i)],[c(pos1(i)),c(pos1(i))+re1(i)],'r')
end

for i = 1:length(pos2)
    plot([pos2(i),pos2(i)],[c(pos2(i)),c(pos2(i))+re2(i)],'g')
end

lead = 10; lag = 120;
[short,long] = movavg(c,lead,lag);
short(1:lead-1) = NaN; long(1:lag-1) = NaN;
plot(short,'k','LineWidth',2); plot(long,'r','LineWidth',2);
title(char(list1(index1)));
