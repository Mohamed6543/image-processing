function varargout = Task(varargin)
% TASK M-file for Task.fig
%      TASK, by itself, creates a new TASK or raises the existing
%      singleton*.
%
%      H = TASK returns the handle to a new TASK or the handle to
%      the existing singleton*.
%
%      TASK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TASK.M with the given input arguments.
%
%      TASK('Property','Value',...) creates a new TASK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Task_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Task_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Task

% Last Modified by GUIDE v2.5 18-Dec-2018 10:10:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Task_OpeningFcn, ...
                   'gui_OutputFcn',  @Task_OutputFcn, ...
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


% --- Executes just before Task is made visible.
function Task_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Task (see VARARGIN)

% Choose default command line output for Task
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Task wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Task_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
x = imread('img.JPG');
axes(handles.axes1);
imshow(x)

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
y = rgb2gray(x)
axes(handles.axes2);
imshow(y)

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
z = im2bw(x)
axes(handles.axes3);
imshow(z);


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global x;
image= x; 

H = padarray(2,[2 2]) - fspecial('gaussian' ,[5 5],2);  
sharpened = imfilter(image,H);  
axes(handles.axes4);
imshow([sharpened]);




% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
noise = imnoise(x,'gaussian',0.01)
axes(handles.axes5);
imshow(noise);


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
J = imadjust(x,[.2 .3 0; .6 .7 1],[])
axes(handles.axes6);
imshow(J);


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
gray = rgb2gray(x);
axes(handles.axes7);
imhist(gray);


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
gray = rgb2gray(x);
axes(handles.axes8);
histe = histeq(gray);
imshow(histe);


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x; 
im=x;
im1=rgb2gray(im);
im1=medfilt2(im1,[3 3]); 
BW = edge(im1,'sobel'); 
[imx,imy]=size(BW);
msk=[0 0 0 0 0;
     0 1 1 1 0;
     0 1 1 1 0;
     0 1 1 1 0;
     0 0 0 0 0;];
B=conv2(double(BW),double(msk)); 
L = bwlabel(B,8);
mx=max(max(L))
[r,c] = find(L==17);  
rc = [r c];
[sx sy]=size(rc);
n1=zeros(imx,imy); 
for i=1:sx
    x1=rc(i,1);
    y1=rc(i,2);
    n1(x1,y1)=255;
end
figure; 
subplot(1,3,1);imshow(im); title('Original image');
subplot(1,3,2);imshow(im1); title('Gray Image');
subplot(1,3,3);imshow(B);; title('Segmentated Image');



% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x; 
z=x;
[X_no_dither,map] = rgb2ind(z,8,'nodither');
axes(handles.axes10);
imshow(X_no_dither,map);


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x; 
a=x; 
SE = strel('line',11,90);
rod=imerode(x,SE);
dai=imdilate(x,SE);
figure; 
subplot(1,2,1);imshow(rod); title('Erosion');
subplot(1,2,2);imshow(dai); title('Dilation');


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
M1 = imread('img.jpg');
M2 = imnoise(M1,'salt & pepper',0.02);
%M3 = medfilt2(M2);
axes(handles.axes12);
imshow(M2);
