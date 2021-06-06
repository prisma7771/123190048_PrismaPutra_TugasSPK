function varargout = SPK_GUI_123190048_PrismaPutra(varargin)
% SPK_GUI_123190048_PRISMAPUTRA MATLAB code for SPK_GUI_123190048_PrismaPutra.fig
%      SPK_GUI_123190048_PRISMAPUTRA, by itself, creates a new SPK_GUI_123190048_PRISMAPUTRA or raises the existing
%      singleton*.
%
%      H = SPK_GUI_123190048_PRISMAPUTRA returns the handle to a new SPK_GUI_123190048_PRISMAPUTRA or the handle to
%      the existing singleton*.
%
%      SPK_GUI_123190048_PRISMAPUTRA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPK_GUI_123190048_PRISMAPUTRA.M with the given input arguments.
%
%      SPK_GUI_123190048_PRISMAPUTRA('Property','Value',...) creates a new SPK_GUI_123190048_PRISMAPUTRA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SPK_GUI_123190048_PrismaPutra_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SPK_GUI_123190048_PrismaPutra_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SPK_GUI_123190048_PrismaPutra

% Last Modified by GUIDE v2.5 05-Jun-2021 22:50:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SPK_GUI_123190048_PrismaPutra_OpeningFcn, ...
                   'gui_OutputFcn',  @SPK_GUI_123190048_PrismaPutra_OutputFcn, ...
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


% --- Executes just before SPK_GUI_123190048_PrismaPutra is made visible.
function SPK_GUI_123190048_PrismaPutra_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SPK_GUI_123190048_PrismaPutra (see VARARGIN)

% Choose default command line output for SPK_GUI_123190048_PrismaPutra
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SPK_GUI_123190048_PrismaPutra wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SPK_GUI_123190048_PrismaPutra_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PlayerName = {'Brian' 'AloenZx' 'Rein' 'Deity' 'LostVoice' 'Gandhi' 'Viletto' 'Gandhum' 'Zahra' 'BfGf'};


TFN = {  [-100/9 0 100/9] [9/100 0 -9/100]
         [0 100/9 200/9] [9/200 9/100 0]
         [100/9 200/9 300/9] [9/300 9/200 9/100]
         [200/9 300/9 400/9] [9/400 9/300 9/200]
         [300/9 400/9 500/9] [9/500 9/400 9/300]
         [400/9 500/9 600/9] [9/600 9/500 9/400]
         [500/9 600/9 700/9] [9/700 9/600 9/500]
         [600/9 700/9 800/9] [9/800 9/700 9/600]
         [700/9 800/9 900/9] [9/900 9/800 9/700]
         [800/9 900/9 1000/9] [9/1000 9/900 9/800]};


dataawal = [80 75 60 
        70 65 70
        90 55 80 
        60 80 90
        50 60 70
        40 70 60
        80 90 40
        80 80 60
        50 60 80
        80 60 60];

maksKonsistensiPerfomance = 100;
maksKDA = 100;
maksSikap = 100;

data(:,1)=dataawal(:,1)/maksKonsistensiPerfomance;
data(:,2)=dataawal(:,2)/maksKDA;
data(:,3)=dataawal(:,3)/maksSikap;

relasiAntarKriteria = [1 2 0.5
                       0 1 1/3
                       0 0 1];

RasioKonsistensi=HitungKonsistensiAHP(relasiAntarKriteria);

if RasioKonsistensi<0.10
    [bobotAntarKriteria,relasiAntarKriteria]=FuzzyAHP(relasiAntarKriteria,TFN);
    
    ahp = data*bobotAntarKriteria';
    
end
    for i =1:size(ahp,1)
    if ahp(i)<0.6
        status='Kurang';
    elseif ahp(i)<0.7
        status='Cukup';
    elseif ahp(i)<0.8
        status='Baik';
    else
        status='Sangat Baik';
    end
    
    ahptable{i,:} = {char(status)};
    end
    
   namaPlayer = PlayerName.';
   ahpcell = num2cell(ahp);
   newahptable = vertcat(ahptable{:});

   Save = {namaPlayer; ahpcell; newahptable};
   newSave = horzcat(Save{:});
    
    set(handles.uitable4,'Data',newSave)
    
    x=0;
    for i=1:10
        if isequal(newSave{i,3},'Sangat Baik') 
            x=x+1;
        rekomen{x,:} = newSave(i,:);
        end
    end
 
   rekomen = vertcat(rekomen{:});
   set(handles.uitable6,'Data',rekomen)

% --- Executes when entered data in editable cell(s) in uitable4.
function uitable4_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable4 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
