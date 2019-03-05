function varargout = Diseno(varargin)
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
        'gui_Singleton',  gui_Singleton, ...
        'gui_OpeningFcn', @Diseno_OpeningFcn, ...
        'gui_OutputFcn',  @Diseno_OutputFcn, ...
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
    
function Diseno_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to Diseno (see VARARGIN)
    set(handles.popupmenu1,'enable','off')
    set(handles.edit6,'enable','off')
    axes(handles.axes2);
    axis off
    axes(handles.axes3);
    axis off
    axes(handles.axes1);
    grid on
    
    % Choose default command line output for Diseno
    handles.output = hObject;
    
    guidata(hObject, handles);
    
function varargout = Diseno_OutputFcn(hObject, eventdata, handles)
    varargout{1} = handles.output;
    
function z_Callback(hObject, eventdata, handles)
    global ValorZita Valorwn Valorn ValorSobre ValorEstablece Vector
    Valorwn=get(handles.wn,'Value');
    ValorZita=get(handles.z,'Value');
    Valorn=get(handles.n,'Value');
    ValorSobre=get(handles.mp,'Value');
    ValorEstablece=get(handles.ts,'Value');
    set(handles.popupmenu1,'enable','off')
    Vector=[num2str(Valorwn) num2str(ValorEstablece) num2str(ValorSobre) num2str(Valorn)];
    
    switch ValorZita
        case 0
            switch Vector
                case '0000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0001'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    %**
                    set(handles.ewn,'String',0)
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                    
                case '0010'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    %*
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0011'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    %***
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.ets,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0100'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    %**
                    set(handles.ewn,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0101'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    %**
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '0110'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','off')
                    %**
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','off')
                case '1000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    %*
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
                case '1001'
                    msgbox('Conjunto no valido')
                case '1010'
                    msgbox('Conjunto no valido')
                case '1100'
                    msgbox('Conjunto no valido')
            end
        case 1
            switch Vector
                case '0000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    %*
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '0001'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    %*
                    set(handles.ewn,'String',0)
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '0010'
                    msgbox('Error, conjunto no válido')
                case '0100'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    %*
                    set(handles.ewn,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
                case '1000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    %*
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
            end
        otherwise
            
    end
    
function wn_Callback(hObject, eventdata, handles)
    global ValorZita Valorwn Valorn ValorSobre ValorEstablece Vector2
    Valorwn=get(handles.wn,'Value');
    ValorZita=get(handles.z,'Value');
    Valorn=get(handles.n,'Value');
    ValorSobre=get(handles.mp,'Value');
    ValorEstablece=get(handles.ts,'Value');
    set(handles.popupmenu1,'enable','off')
    Vector2=[num2str(ValorZita) num2str(ValorEstablece) num2str(ValorSobre) num2str(Valorn)];
    
    switch Valorwn
        case 0
            switch Vector2
                case '0000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0001'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.ewn,'String',0)
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '0010'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0011'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.ets,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0100'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    
                    set(handles.ewn,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0101'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '0110'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','off')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','off')
                case '1000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '1001'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.ewn,'String',0)
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '1010'
                    msgbox('Conjunto no valido')
                case '1100'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    
                    set(handles.ewn,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
                otherwise
            end
        case 1
            switch Vector2
                case'0000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
                case'0001'
                    msgbox('Conjunto no valido')
                case'0010'
                    msgbox('Conjunto no valido')
                case'0100'
                    msgbox('Conjunto no valido')
                case'1000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
                    
                otherwise
            end
        otherwise
            
    end
    
function n_Callback(hObject, eventdata, handles)
    global ValorZita Valorwn Valorn ValorSobre ValorEstablece Vector5
    Valorwn=get(handles.wn,'Value');
    ValorZita=get(handles.z,'Value');
    Valorn=get(handles.n,'Value');
    ValorSobre=get(handles.mp,'Value');
    ValorEstablece=get(handles.ts,'Value');
    set(handles.popupmenu1,'enable','off')
    Vector5=[num2str(ValorZita) num2str(Valorwn) num2str(ValorEstablece) num2str(ValorSobre)];
    
    switch Valorn
        case 0
            switch Vector5
                case '0000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0001'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0010'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    
                    set(handles.ewn,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0011'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','off')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','off')
                case '0100'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
                case '0101'
                    msgbox('Error,Conjunto no válido')
                case '0110'
                    msgbox('Error,Conjunto no válido')
                case '0111'
                    msgbox('Error,Conjunto no válido')
                case '1000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '1001'
                    msgbox('Error,Conjunto no válido')
                case '1010'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    
                    set(handles.ewn,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
                case '1100'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
                otherwise
            end
        case 1
            switch Vector5
                case'0000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    
                    set(handles.ewn,'String',0)
                    
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case'0001'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.ets,'String',0)
                    
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case'0010'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case'0100'
                    msgbox('Conjunto no valido')
                case'1000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.ewn,'String',0)
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                otherwise
            end
        otherwise
    end
    
function mp_Callback(hObject, eventdata, handles)
    global ValorZita Valorwn Valorn ValorSobre ValorEstablece Vector4
    Valorwn=get(handles.wn,'Value');
    ValorZita=get(handles.z,'Value');
    Valorn=get(handles.n,'Value');
    ValorSobre=get(handles.mp,'Value');
    ValorEstablece=get(handles.ts,'Value');
    set(handles.popupmenu1,'enable','off')
    Vector4=[num2str(ValorZita) num2str(Valorwn) num2str(ValorEstablece) num2str(Valorn)];
    
    switch ValorSobre
        case 0
            switch Vector4
                case '0000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0001'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.ewn,'String',0)
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '0010'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    
                    set(handles.ewn,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0011'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '0100'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
                case '0101'
                    msgbox('Error,Conjunto no válido')
                case '0110'
                    msgbox('Error,Conjunto no válido')
                case '0111'
                    msgbox('Error,Conjunto no válido')
                case '1000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '1001'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.ewn,'String',0)
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '1010'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    
                    set(handles.ewn,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
                case '1100'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
                otherwise
            end
        case 1
            switch Vector4
                case'0000'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case'0001'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.ets,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case'0010'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','off')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','off')
                case'0100'
                    msgbox('Conjunto no valido')
                case'1000'
                    msgbox('Conjunto no valido')
                otherwise
            end
        otherwise
    end
    
function ts_Callback(hObject, eventdata, handles)
    global ValorZita Valorwn Valorn ValorSobre ValorEstablece Vector3
    Valorwn=get(handles.wn,'Value');
    ValorZita=get(handles.z,'Value');
    Valorn=get(handles.n,'Value');
    ValorSobre=get(handles.mp,'Value');
    ValorEstablece=get(handles.ts,'Value');
    set(handles.popupmenu1,'enable','off')
    Vector3=[num2str(ValorZita) num2str(Valorwn) num2str(ValorSobre) num2str(Valorn)];
    
    switch ValorEstablece
        case 0
            switch Vector3
                case '0000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0001'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.ewn,'String',0)
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '0010'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0011'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.ets,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case '0100'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
                case '0101'
                    msgbox('Error,Conjunto no válido')
                case '0110'
                    msgbox('Error,Conjunto no válido')
                case '0111'
                    msgbox('Error,Conjunto no válido')
                case '1000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '1001'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.ewn,'String',0)
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case '1010'
                    msgbox('Error, no valido')
                case '1100'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','on')
                    set(handles.ts,'enable','off')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    
                    set(handles.ets,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','on')
                    set(handles.ets,'enable','off')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
                otherwise
            end
        case 1
            switch Vector3
                case'0000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','on')
                    
                    set(handles.ewn,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','on')
                case'0001'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','on')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.emp,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','on')
                case'0010'
                    set(handles.z,'enable','off')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','on')
                    set(handles.n,'enable','off')
                    
                    set(handles.ez,'String',0)
                    set(handles.ewn,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','off')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','on')
                    set(handles.en,'enable','off')
                case'0100'
                    msgbox('Conjunto no valido')
                case'1000'
                    set(handles.z,'enable','on')
                    set(handles.wn,'enable','off')
                    set(handles.ts,'enable','on')
                    set(handles.mp,'enable','off')
                    set(handles.n,'enable','off')
                    
                    set(handles.ewn,'String',0)
                    set(handles.emp,'String',0)
                    set(handles.en,'String',0)
                    
                    set(handles.ez,'enable','on')
                    set(handles.ewn,'enable','off')
                    set(handles.ets,'enable','on')
                    set(handles.emp,'enable','off')
                    set(handles.en,'enable','off')
                otherwise
            end
        otherwise
    end
    
function ez_Callback(hObject, eventdata, handles)
    
function ez_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function ewn_Callback(hObject, eventdata, handles)
    
function ewn_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function ets_Callback(hObject, eventdata, handles)
    
function ets_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function emp_Callback(hObject, eventdata, handles)
    
function emp_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function en_Callback(hObject, eventdata, handles)
    
function en_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function confirmar_Callback(hObject, eventdata, handles)
    global Zita wn ts mp n ValorZita Valorwn Valorn ValorSobre ValorEstablece Periodo G Polo Angulo Gz PeriodoOriginal PeriodoManueal
    global AnguloOri PoloOri PERIODOUSUARIO
    ValorZita=get(handles.z,'Value');
    Valorwn=get(handles.wn,'Value');
    ValorEstablece=get(handles.ts,'Value');
    ValorSobre=get(handles.mp,'Value');
    Valorn=get(handles.n,'Value');
    
    set(handles.edit6,'enable','on')
    if ValorZita~=0 && Valorwn~=0
        try
            Zita=str2num(get(handles.ez,'String'));
            wn=str2num(get(handles.ewn,'String'));
            ts=0;
            mp=0;
            n=0;
        set(handles.tz,'String',Zita);
        set(handles.twn,'String',wn);
        set(handles.tmp,'String','-');
        set(handles.tn,'String','-');
        set(handles.tts,'String','-');
            if PeriodoManueal==0
                Periodo=periodoopciones(mp,ts,Zita,wn,0,G);
            else
                Periodo=Periodo
            end
            
            [Polo,Angulo]=opciona(G,Periodo,Zita,wn);
            set(handles.text5,'String',real(Polo))
            set(handles.text9,'String',imag(Polo))
            set(handles.angc,'String',Angulo)
            set(handles.popupmenu1,'enable','on')
            set(handles.T,'String',Periodo);
        catch
            msgbox('Error, posiblemente ingreso un valor erroneo')
        end
        
    elseif ValorZita~=0 && Valorn~=0
        try
            Zita=str2double(get(handles.ez,'String'));
            wn=0;
            ts=0;
            mp=0;
            n=str2double(get(handles.en,'String'));
                    set(handles.tz,'String',Zita);
        set(handles.twn,'String','-');
        set(handles.tmp,'String','-');
        set(handles.tn,'String',n);
        set(handles.tts,'String','-');
            if PeriodoManueal==0
                Periodo=periodoopciones(mp,ts,Zita,wn,1,G);
            else
                Periodo=Periodo
            end
            [Polo,Angulo]=opcionb(G,Zita,n,Periodo);
            set(handles.text5,'String',real(Polo))
            set(handles.text9,'String',imag(Polo))
            set(handles.angc,'String',Angulo)
            set(handles.popupmenu1,'enable','on')
            set(handles.T,'String',Periodo);
            
        catch
            msgbox('Error, posiblemente ingreso un valor erroneo')
        end
        
    elseif  ValorEstablece~=0 && ValorSobre~=0
        try
            Zita=0;
            wn=0;
            ts=str2num(get(handles.ets,'String'));
            mp=str2num(get(handles.emp,'String'))/100;
            n=0;
            disp('PERIODOMANUAL')
            disp(PeriodoManueal)
            disp('PERIODO')
            disp(Periodo)
            if PeriodoManueal==0
                Periodo=periodoopciones(mp,ts,Zita,wn,0,G);
            else
                Periodo=Periodo
            end
            [Polo,Angulo]=opcionc(G,Periodo,ts,mp)
            set(handles.text5,'String',real(Polo))
            set(handles.text9,'String',imag(Polo))
            set(handles.angc,'String',Angulo)
            set(handles.popupmenu1,'enable','on')
            set(handles.T,'String',Periodo);
            
        catch
            msgbox('Error, posiblemente ingreso un valor erroneo')
        end
        
    elseif ValorEstablece~=0 && ValorZita~=0
        try
            Zita=str2num(get(handles.ez,'String'));
            wn=0;
            ts=str2num(get(handles.ets,'String'));
            mp=0;
            n=0;
            if PeriodoManueal==0
                Periodo=periodoopciones(mp,ts,Zita,wn,0,G);
            else
                Periodo=Periodo;
            end
            [Polo,Angulo]=opciond(G,Zita,ts,Periodo);
            set(handles.text5,'String',real(Polo))
            set(handles.text9,'String',imag(Polo))
            set(handles.angc,'String',Angulo)
            set(handles.popupmenu1,'enable','on')
            set(handles.T,'String',Periodo);
            
        catch
            msgbox('Error, posiblemente ingreso un valor erroneo')
        end
        
    elseif ValorEstablece~=0 && Valorn~=0
        try
            Zita=0;
            wn=0;
            ts=str2double(get(handles.ets,'String'));
            mp=0;
            n=str2num(get(handles.en,'String'));
            if PeriodoManueal==0
                Periodo=periodoopciones(mp,ts,Zita,wn,1,G);
            else
                Periodo=Periodo
            end
            [Polo,Angulo]=opcione(G,Periodo,ts,n);
            set(handles.text5,'String',real(Polo))
            set(handles.text9,'String',imag(Polo))
            set(handles.angc,'String',Angulo)
            set(handles.popupmenu1,'enable','on')
            set(handles.T,'String',Periodo);
            
        catch
            msgbox('Error, posiblemente ingreso un valor erroneo')
            disp(Polo);
            
        end
        
    elseif Valorn~=0 && ValorSobre~=0
        try
            Zita=0;
            wn=0;
            ts=0;
            mp=str2num(get(handles.emp,'String'))/100;
            n=str2double(get(handles.en,'String'));
            if PeriodoManueal==0
                Periodo=periodoopciones(mp,ts,Zita,wn,1,G);
            else
                Periodo=Periodo
            end
            [Polo,Angulo]=opcionf(G,mp,n,Periodo);
            set(handles.text5,'String',real(Polo))
            set(handles.text9,'String',imag(Polo))
            set(handles.angc,'String',Angulo)
            set(handles.popupmenu1,'enable','on')
            set(handles.T,'String',Periodo);
            
        catch
            msgbox('Error, posiblemente ingreso un valor erroneo')
        end
        
    else
        msgbox('Seleccione almenos dos opciones.')
    end
   
    PeriodoOriginal=Periodo;
     if (PeriodoManueal)
         disp("AJIACO")
         Periodo=PERIODOUSUARIO;
         set(handles.T,'String',Periodo);
     end
         
    PoloOri=Polo;
    AnguloOri=Angulo;
    Gz=c2d(G,Periodo);
    texto4=tf_to_latex(Gz,'G(z)');
    
    axes(handles.axes3);
    cla 'reset'
    text('Interpreter','LaTex','string',texto4,'FontSize',18);
    axis off
    
function controladores (handles)
    global listacontrol  Controlador Polo Angulo Periodo G texto4 Gz
    listacontrol=get(handles.popupmenu1,'Value');
    angtem=str2num(get(handles.angc,'String'));
    switch listacontrol
        case 2
            try
                if angtem>0
                    msgbox('El controlador deber aportar angulos positivos,seleccione otra opción')
                    return;
                else
                    Controlador=PI(Polo,Angulo,Periodo,G,1);
                    [num,den]=tfdata(Controlador);
                    Controlador=tf(num,den,Periodo);
                    texto4=tf_to_latex(Controlador,'C(z)');
                    [~,e]=errores(Controlador,Gz,Periodo);
                    set(handles.tep,'String',e(1));
                    set(handles.tev,'String',e(2));
                    set(handles.tea,'String',e(3));
                    
                    axes(handles.axes2);
                    cla 'reset'
                    text('Interpreter','LaTex','string',texto4,'FontSize',18);
                    axis off
                end
            catch
                msgbox('Controlador no disponible')
            end
        case 3
            try
                if angtem<0
                    msgbox('El controlador deber aportar angulos negativos,seleccione otra opción')
                    return;
                else
                    Controlador=PD(Polo,Angulo,Periodo,G);
                    [num,den]=tfdata(Controlador);
                    Controlador=tf(num,den,Periodo);
                    texto4=tf_to_latex(Controlador,'C(z)')
                    [~,e]=errores(Controlador,Gz,Periodo);
                    set(handles.tep,'String',e(1));
                    set(handles.tev,'String',e(2));
                    set(handles.tev,'String',e(3));
                    axes(handles.axes2);
                    cla 'reset'
                    text('Interpreter','LaTex','string',texto4,'FontSize',18);
                    axis off
                end
            catch
                msgbox('Controlador no disponible')
            end
        case 4
            try
                Controlador=PID(Polo,Angulo,Periodo,G);
                [~,e]=errores(Controlador,Gz,Periodo);
                [num,den]=tfdata(Controlador);
                Controlador=tf(num,den,Periodo);
                
                texto4=tf_to_latex(Controlador,'C(z)');
                set(handles.tep,'String',e(1));
                set(handles.tev,'String',e(2));
                set(handles.tea,'String',e(3));
                axes(handles.axes2);
                cla 'reset'
                text('Interpreter','LaTex','string',texto4,'FontSize',18);
                axis off
            catch
                msgbox('Controlador no disponible')
                
            end
        case 5
            
            try
                Anguloasumido=get(handles.edit6,'String');
                (Anguloasumido);
                Controlador=Compensadorcero(Polo,Angulo,Periodo,G,str2double(Anguloasumido));
                [num,den]=tfdata(Controlador);
                Controlador=tf(num,den,Periodo);
                [~,e]=errores(Controlador,Gz,Periodo);
                set(handles.tep,'String',e(1));
                set(handles.tev,'String',e(2));
                set(handles.tev,'String',e(3));
                texto4=tf_to_latex(Controlador,'C(z)')
                axes(handles.axes2);
                cla 'reset'
                text('Interpreter','LaTex','string',texto4,'FontSize',18);
                axis off
            catch
                msgbox('Controlador no disponible, posiblemente ingreso un angulo erroneo')
            end
        case 6
            try
                Anguloasumido=get(handles.edit6,'String');
                Controlador=Compensadorpolo(Polo,Angulo,Periodo,G,str2double(Anguloasumido));
                [num,den]=tfdata(Controlador);
                Controlador=tf(num,den,Periodo);
                [~,e]=errores(Controlador,Gz,Periodo);
                set(handles.tep,'String',e(1));
                set(handles.tev,'String',e(2));
                set(handles.tev,'String',e(3));
                texto4=tf_to_latex(Controlador,'C(z)')
                axes(handles.axes2);
                cla 'reset'
                text('Interpreter','LaTex','string',texto4,'FontSize',18);
                axis off
            catch
                msgbox('Controlador no disponible')
            end
        otherwise
    end
    
function popupmenu1_Callback(hObject, eventdata, handles)
    global Zita wn ts mp n ValorZita Valorwn Valorn ValorSobre ValorEstablece Periodo G Polo Angulo Gz Controlador PeriodoOriginal PoloOri AnguloOri
    set(handles.angc,'String',AnguloOri);
    Periodo=PeriodoOriginal;
    Polo=PoloOri;
    Angulo=AnguloOri;
    set(handles.recal,'visible','off');
    Gz=c2d(G,Periodo);
    controladores(handles);
    if get(handles.mp,'Value')==1 && get(handles.ts,'Value')==1
        planta=feedback(Gz*Controlador,1);
        datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
        Mp=str2double(get(handles.emp,'String'));
        Ts=str2double(get(handles.ets,'String'));
        set(handles.tz,'String','-');
        set(handles.twn,'String','-');
        set(handles.tmp,'String',datos.Overshoot);
        set(handles.tn,'String','-');
        set(handles.tts,'String',datos.SettlingTime);
        
        if datos.Overshoot>Mp || datos.SettlingTime>Ts
            msgbox('Necesita rediseño');
            set(handles.recal,'visible','on');
            
        end
    end
    if get(handles.z,'Value')==1 && get(handles.ts,'Value')==1
        planta=feedback(Gz*Controlador,1);
        datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
        Ts=str2double(get(handles.ets,'String'));
        set(handles.tz,'String',Zita);
        set(handles.twn,'String','-');
        set(handles.tmp,'String','-');
        set(handles.tn,'String','-');
        set(handles.tts,'String',datos.SettlingTime);
        if  datos.SettlingTime>Ts
            msgbox('Necesita rediseño');
            set(handles.recal,'visible','on');
            
        end
    end
    if get(handles.n,'Value')==1 && get(handles.ts,'Value')==1
        planta=feedback(Gz*Controlador,1);
        datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
        Ts=str2double(get(handles.ets,'String'));
        N=360/abs(angle(Polo));
        set(handles.tz,'String','-');
        set(handles.twn,'String','-');
        set(handles.tmp,'String','-');
        set(handles.tn,'String',N);
        set(handles.tts,'String',datos.SettlingTime);
        if  datos.SettlingTime>Ts
            msgbox('Necesita rediseño');
            set(handles.recal,'visible','on');
            
        end
    end
    if get(handles.n,'Value')==1 && get(handles.mp,'Value')==1
        planta=feedback(Gz*Controlador,1);
        datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
        Mp=str2double(get(handles.emp,'String'));
        N=360/abs(angle(Polo));
        set(handles.tz,'String','-');
        set(handles.twn,'String','-');
        set(handles.tmp,'String',datos.Overshoot);
        set(handles.tn,'String',N);
        set(handles.tts,'String','-');
        if  datos.Overshoot>Mp
            msgbox('Necesita rediseño');
            set(handles.recal,'visible','on');
            
        end
    end
    if get(handles.n,'Value')==1 && get(handles.mp,'Value')==1
        planta=feedback(Gz*Controlador,1);
        datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
        Mp=str2double(get(handles.emp,'String'));
        N=360/abs(angle(Polo));
        set(handles.tz,'String','-');
        set(handles.twn,'String','-');
        set(handles.tmp,'String',datos.Overshoot);
        set(handles.tn,'String',N);
        set(handles.tts,'String','-');
        if  datos.Overshoot>Mp
            msgbox('Necesita rediseño');
            set(handles.recal,'visible','on');
            
        end
    end
    
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
    
function G_tex = tf_to_latex(tf_data, name)
    var = evalin(symengine, tf_data.Variable);
    Num = tf_data.Numerator;
    Den = tf_data.Denominator;
    delay = tf_data.OutputDelay;
    if tf_data.Variable == 's'
        sys_syms = poly2sym(cell2mat(Num),var)/poly2sym(cell2mat(Den),var)*exp(-delay*var);
    elseif tf_data.Variable == 'z'
        sys_syms = poly2sym(cell2mat(Num),var)/poly2sym(cell2mat(Den),var)*var^(-delay);
    end
    sys_syms = vpa(sys_syms,4);
    G_tex = latex(sys_syms);
    font_dcount = (50 - length(G_tex))/50;
    fontsize_0 = 8 + floor(font_dcount * (font_dcount < 0));
    font_dcount = (50 - length(G_tex))/10;
    fontsize_1 = 8 + ceil(font_dcount * (font_dcount < 0));
    if fontsize_1 < 12
        fontsize_1 = 12;
    end
    G_tex = ['$ \fontsize{' num2str(fontsize_0) '}{0}\selectfont ' name ' = \fontsize{' num2str(fontsize_1) '}{0}\selectfont ' G_tex '$'];
    
function pushbutton2_Callback(hObject, eventdata, handles)
    
function escalon_Callback(hObject, eventdata, handles)
    global Gz Controlador ValorLista4 Periodo G Polo controlador2
    ValorLista4=get(handles.popupmenu3,'Value');
    switch ValorLista4
        case 1
            try
                Gz=c2d(G,Periodo);
                axes(handles.axes1);
                cla 'reset'
                step(((Gz*Controlador)/(1+(Gz*Controlador))));
                set(handles.axes1,'xgrid','on','ygrid','on')
                
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
        case 2
            %         handles.g1=plot(handles.axes3,y1)
            try
                Gz=c2d(G,Periodo);
                
                axes(handles.axes1);
                cla 'reset'
                step((Gz)*Controlador);
                set(handles.axes1,'xgrid','on','ygrid','on')
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
        case 3
            try
                Gz=c2d(G,Periodo);
                
                axes(handles.axes1);
                cla 'reset'
                step(feedback(Gz*Controlador*controlador2,1));
                set(handles.axes1,'xgrid','on','ygrid','on')
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
        otherwise
            set(handles.axes1,'xgrid','on','ygrid','on')
    end
    
function pushbutton4_Callback(hObject, eventdata, handles)
    global Gz Controlador ValorLista4 Periodo G Polo controlador2
    ValorLista4=get(handles.popupmenu3,'Value');
    switch ValorLista4
        case 1
            try
                planta=feedback(Gz*Controlador,1);
                step(planta);
                [~,t] = step(planta);
                t = 0:planta.Ts:t(end);
                axes(handles.axes1);
                lsim(planta,t,t);%Rampa
                set(handles.axes1,'xgrid','on','ygrid','on')
                axis([0 t(end) 0 t(end)])
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
        case 2
            %         handles.g1=plot(handles.axes3,y1)
            try
                planta=feedback(Gz*Controlador,1);
                step(planta);
                [~,t] = step(planta);
                t = 0:planta.Ts:t(end);
                axes(handles.axes1);
                lsim(planta,t,t);%Rampa
                set(handles.axes1,'xgrid','on','ygrid','on')
                %                     axis([0 10 0 10])
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
        case 3
            %         handles.g1=plot(handles.axes3,y1)
            try
                planta=feedback(Gz*Controlador*controlador2,1);
                step(planta);
                [~,t] = step(planta);
                t = 0:planta.Ts:t(end);
                axes(handles.axes1);
                lsim(planta,t,t);%Rampa
                set(handles.axes1,'xgrid','on','ygrid','on')
                %                     axis([0 10 0 10])
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
        otherwise
            set(handles.axes1,'xgrid','on','ygrid','on')
    end
    
function pushbutton5_Callback(hObject, eventdata, handles)
    global Gz Controlador ValorLista4 Periodo G Polo controlador2
    ValorLista4=get(handles.popupmenu3,'Value');
    switch ValorLista4
        case 1
            try
                planta=feedback(Gz*Controlador,1);
                step(planta);
                [~,t] = step(planta);
                t = 0:planta.Ts:t(end);
                axes(handles.axes1);
                lsim(planta,t.^2,t);%Rampa
                set(handles.axes1,'xgrid','on','ygrid','on')
                %                     axis([0 10 0 10])
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
        case 2
            %         handles.g1=plot(handles.axes3,y1)
            try
                planta=feedback(Gz*Controlador,1);
                step(planta);
                [~,t] = step(planta);
                t = 0:planta.Ts:t(end);
                axes(handles.axes1);
                lsim(planta,t.^2,t);%Rampa
                set(handles.axes1,'xgrid','on','ygrid','on')
                %                     axis([0 10 0 10])
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
        case 3
            try
                planta=feedback(Gz*Controlador+controlador2,1);
                step(planta);
                [~,t] = step(planta);
                t = 0:planta.Ts:t(end);
                axes(handles.axes1);
                lsim(planta,t.^2,t);%Rampa
                set(handles.axes1,'xgrid','on','ygrid','on')
                %                     axis([0 10 0 10])
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
        otherwise
            set(handles.axes1,'xgrid','on','ygrid','on')
    end
    
function popupmenu3_Callback(hObject, eventdata, handles)
    
    % Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
    %        contents{get(hObject,'Value')} returns selected item from popupmenu3
    
    
    % --- Executes during object creation, after setting all properties.
    
    cerrado=get(handles.popupmenu3,'Value');
    disp(cerrado)
    if cerrado==1
        set(handles.pushbutton6,'visible','off');
        
    else
        set(handles.pushbutton6,'visible','on');
        
    end
function popupmenu3_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to popupmenu3 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: popupmenu controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    % --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
    global Gz Controlador ValorLista4 Periodo G Polo controlador2
    ValorLista4=get(handles.popupmenu3,'Value');
    switch ValorLista4
        case 1
            try
                Gz=c2d(G,Periodo)
                axes(handles.axes1)
                y1=feedback(Gz*Controlador,1);
                axes(handles.axes1)
                plot(real(Polo),imag(Polo),'*k', 'MarkerSize',10)
                hold on
                rlocus(y1)
                hold off;
                axis equal
                set(handles.axes1,'xgrid','on','ygrid','on')
                
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
        case 2
            %         handles.g1=plot(handles.axes3,y1)
            
            try
                Gz=c2d(G,Periodo)
                axes(handles.axes1)
                plot(real(Polo),imag(Polo),'*k', 'MarkerSize',10)
                hold on
                rlocus(Gz*Controlador)
                hold off
                axis equal
                set(handles.axes1,'xgrid','on','ygrid','on')
                
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
        case 3
            try
                Gz=c2d(G,Periodo)
                axes(handles.axes1)
                plot(real(Polo),imag(Polo),'*k', 'MarkerSize',10)
                hold on
                rlocus(Gz*Controlador*controlador2)
                hold off
                axis equal
                set(handles.axes1,'xgrid','on','ygrid','on')
                
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
            
        otherwise
            set(handles.axes1,'xgrid','on','ygrid','on')
            
    end
    
    
    
function edit6_Callback(hObject, eventdata, handles)
    % hObject    handle to edit6 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit6 as text
    %        str2double(get(hObject,'String')) returns contents of edit6 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit6 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    % --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to axes1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: place code in OpeningFcn to populate axes1
    
    
    
function eep_Callback(hObject, eventdata, handles)
    % hObject    handle to eep (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of eep as text
    %        str2double(get(hObject,'String')) returns contents of eep as a double
    global Periodo  Polo Angulo Gz Controlador controlador2
    ep=str2double(get(handles.tep,'String'));
    if ep==0
        msgbox('Error,No se puede modificar.')
        
    else
        error=str2double(get(handles.eep,'String'));
        [a,controlador2]=eestacionario(1,error,Controlador,Gz,Periodo,Polo,Angulo);
        [~,e]=errores(controlador2,Controlador*Gz,Periodo);
        set(handles.tep,'String',e(1));
        set(handles.tev,'String',e(2));
        set(handles.tea,'String',e(3));
    end
     
    % --- Executes during object creation, after setting all properties.
function eep_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to eep (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
function eev_Callback(hObject, eventdata, handles)
    % hObject    handle to eev (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of eev as text
    %        str2double(get(hObject,'String')) returns contents of eev as a double
    
    global Periodo  Polo Angulo Gz Controlador controlador2
    
    ep=str2double(get(handles.tep,'String'));
    ev=str2double(get(handles.tev,'String'));
    
    if ev==0
        msgbox('Error,No se puede modificar.')
        
    else
        if ep~=0
            aux=PI(0.9999,0.00001,Periodo,Controlador*Gz,2);
            control=Controlador*aux;
            [~,e]=errores(controlador2,control*Gz,Periodo);
            
            error=str2double(get(handles.eev,'String'));
            [~,controlador2]=eestacionario(3,error,control,Gz,Periodo,Polo,Angulo);
            
            [~,e]=errores(controlador2,control*Gz,Periodo);
            set(handles.tep,'String',e(1));
            set(handles.tev,'String',e(2));
            set(handles.tea,'String',e(3));
        else
            error=str2double(get(handles.eev,'String'));
            [~,controlador2]=eestacionario(3,error,Controlador,Gz,Periodo,Polo,Angulo);
            
            [~,e]=errores(controlador2,Controlador*Gz,Periodo);
            set(handles.tep,'String',e(1));
            set(handles.tev,'String',e(2));
            set(handles.tea,'String',e(3));
        end
        
    end
    % --- Executes during object creation, after setting all properties.
function eev_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to eev (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
function eea_Callback(hObject, eventdata, handles)
    % hObject    handle to eea (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of eea as text
    %        str2double(get(hObject,'String')) returns contents of eea as a double
    
    global Periodo  Polo Angulo Gz Controlador controlador2
    ev=str2double(get(handles.tev,'String'));
    ea=str2double(get(handles.tea,'String'));
    if ea==0
        msgbox('Error,No se puede modificar.')
        
    else
        if ev~=0
            aux=PI(0.9999,0.00001,Periodo,Controlador*Gz,2);
            control=Controlador*aux*aux;
            [~,e]=errores(controlador2,control*Gz,Periodo);
            error=str2double(get(handles.eea,'String'));
            [~,controlador2]=eestacionario(5,error,control,Gz,Periodo,Polo,Angulo);
            [~,e]=errores(controlador2,control*Gz,Periodo);
            set(handles.tep,'String',e(1));
            set(handles.tev,'String',e(2));
            set(handles.tea,'String',e(3));
        else
            error=str2double(get(handles.eea,'String'));
            [~,controlador2]=eestacionario(5,error,Controlador,Gz,Periodo,Polo,Angulo);
            [~,e]=errores(controlador2,Controlador*Gz,Periodo);
            set(handles.tep,'String',e(1));
            set(handles.tev,'String',e(2));
            set(handles.tea,'String',e(3));
        end
    end
    % --- Executes during object creation, after setting all properties.
function eea_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to eea (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    % --- Executes during object creation, after setting all properties.
function tep_CreateFcn(hObject, eventdata, handles)
    
function recal_Callback(hObject, eventdata, handles)
    % hObject    handle to recal (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of recal
    set(handles.op1,'visible','on');
    set(handles.op2,'visible','on');
    
function opc(handles)
    global Gz Controlador G Periodo Polo Angulo
    
    planta=feedback(Gz*Controlador,1);
    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
    Mp1=str2double(get(handles.emp,'String'));
    Mp=Mp1/100;
    Ts1=str2double(get(handles.ets,'String'));
    Ts=Ts1;
    opcion=1;
    while datos.Overshoot>Mp1 || datos.SettlingTime>Ts1
        
        if opcion==1
            Mp=Mp-0.05;
            if Mp>0
                Periodo=periodoopciones(Mp,Ts,0,0,0,G);
                [Polo,Angulo]=opcionc(G,Periodo,Ts,Mp);
                Gz=c2d(G,Periodo);
                controladores(handles);
                
                planta=feedback(Gz*Controlador,1);
                datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
            else
                opcion=0;
                Mp=str2double(get(handles.emp,'String'))/100;
            end
        else
            Ts=Ts-Ts1*0.1;
            
            if Ts>0
                Periodo=periodoopciones(Mp,Ts,0,0,0,G);
                [Polo,Angulo]=opcionc(G,Periodo,Ts,Mp);
                Gz=c2d(G,Periodo);
                controladores(handles);
                planta=feedback(Gz*Controlador,1);
                datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
            else
                break;
            end
        end
    end
    planta=feedback(Gz*Controlador,1);
    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
    disp(Ts1);
    disp(Mp1);
    if datos.Overshoot>Mp1 || datos.SettlingTime>Ts1
        disp(datos.SettlingTime);
        disp(datos.Overshoot);
        msgbox('No se puede cumplir los requerimientos')
    else
        msgbox('Rediseño exitoso');
        
        [Polo,Angulo]=opcionc(G,Periodo,Ts,Mp);
        set(handles.text5,'String',real(Polo));
        set(handles.text9,'String',imag(Polo));
        set(handles.T2,'String',Periodo);
        
 
    end
           set(handles.tz,'String','-');
        set(handles.twn,'String','-');
        set(handles.tmp,'String',datos.Overshoot);
        set(handles.tn,'String','-');
        set(handles.tts,'String',datos.SettlingTime);
function opd(handles)
    global Gz Controlador G Periodo Polo Angulo
    
    planta=feedback(Gz*Controlador,1);
    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
    zita=str2double(get(handles.ez,'String'));
    Ts=str2double(get(handles.ets,'String'));
    zita=zita-zita/2;
    while datos.SettlingTime>Ts
        zita=zita+0.02;
        if(zita>=1)
            break;
        end
        Periodo=periodoopciones(0,Ts,zita,0,0,G);
        [Polo,Angulo]=opciond(G,zita,Ts,Periodo);
        Gz=c2d(G,Periodo);
        controladores(handles);
        planta=feedback(Gz*Controlador,1);
        datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
        set(handles.T2,'String',Periodo);
    end
    planta=feedback(Gz*Controlador,1);
    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
    if datos.SettlingTime>Ts
        msgbox('No se puede rediseñar');
    else
        msgbox('Rediseño exitoso');
        disp(datos.SettlingTime);
        [Polo,Angulo]=opciond(G,zita,Ts,Periodo);
        set(handles.text5,'String',real(Polo));
        set(handles.text9,'String',imag(Polo));
        set(handles.T2,'String',Periodo);
        
    end
        set(handles.tz,'String','-');
        set(handles.twn,'String','-');
        set(handles.tmp,'String','-');
        set(handles.tn,'String','-');
        set(handles.tts,'String',datos.SettlingTime);
    
function ope(handles)
    global Gz Controlador G Periodo
    
    planta=feedback(Gz*Controlador,1);
    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
    Ts=str2double(get(handles.ets,'String'));
    Periodo=0.001;
    
    while datos.SettlingTime>Ts
        Periodo=Periodo+0.01
        Gz=c2d(G,Periodo);
        controladores(handles);
        planta=feedback(Gz*Controlador,1);
        datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
        
    end
             set(handles.tz,'String','-');
        set(handles.twn,'String','-');
        set(handles.tmp,'String','-');
        set(handles.tts,'String',datos.SettlingTime);
function opf(handles)
    global Gz Controlador G Periodo Polo Angulo
    PeriodoOriginal=Periodo;
    PoloOriginal=Polo;
    AnguloOriginal=Angulo;
    planta=feedback(Gz*Controlador,1);
    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
    Mp=str2double(get(handles.emp,'String'))/100;
    n=str2double(get(handles.en,'String'));
    
    Periodo=PeriodoOriginal;
    
    while datos.Overshoot>(Mp*100)
        Periodo=Periodo+0.1;
        if(Periodo>=4*PeriodoOriginal)
            [Polo,Angulo]=opcionf(G,Mp,n,Periodo);
            disp(datos.Overshoot);
            set(handles.T,'String',PeriodoOriginal);
            set(handles.T2,'String',Periodo);
            break;
        end
        % [Polo,Angulo]=opcionf(G,Mp,n,Periodo);
        Gz=c2d(G,Periodo);
        controladores(handles);
        planta=feedback(Gz*Controlador,1);
        datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
    end
    if datos.Overshoot>(Mp*100)
        msgbox('No se puede rediseñar');
    else
        msgbox('Rediseño exitoso');
        
        [Polo,Angulo]=opcionf(G,Mp,n,Periodo);
        set(handles.text5,'String',real(Polo));
        set(handles.text9,'String',imag(Polo));
    end
             set(handles.tz,'String','-');
        set(handles.twn,'String','-');
        set(handles.tmp,'String',datos.Overshoot);
        %set(handles.tn,'String','-');
        set(handles.tts,'String','-');
    % --- Executes on button press in op1.
function op1_Callback(hObject, eventdata, handles)
    % hObject    handle to op1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    switch(get(hObject,'Value'))
        case 0
            set(handles.op2,'visible','on');
            
        case 1
            set(handles.op2,'visible','off');
            
            if get(handles.mp,'Value')==1 && get(handles.ts,'Value')==1
                opc(handles);
            end
            if get(handles.ts,'Value')==1 && get(handles.z,'Value')==1
                opd(handles);
            end
            if get(handles.ts,'Value')==1 && get(handles.n,'Value')==1
                ope(handles);
            end
            if get(handles.n,'Value')==1 && get(handles.mp,'Value')==1
                opf(handles);
            end
            pause(5);
            escalon_Callback(1,eventdata,handles);
            set(handles.op2,'visible','on');
        otherwise
            % Hint: get(hObject,'Value') returns toggle state of op1
    end
    
    % --- Executes on button press in op2.
function op2_Callback(hObject, eventdata, handles)
    % hObject    handle to op2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of op2
    switch(get(hObject,'Value'))
        case 0
            set(handles.op1,'visible','on');
            
        case 1
            set(handles.op1,'visible','off');
            
            if get(handles.mp,'Value')==1 && get(handles.ts,'Value')==1
                op2c(handles);
            end
            if get(handles.ts,'Value')==1 && get(handles.z,'Value')==1
                op2d(handles);
            end
            if get(handles.ts,'Value')==1 && get(handles.n,'Value')==1
                op2e(handles);
            end
            if get(handles.n,'Value')==1 && get(handles.mp,'Value')==1
                op2f(handles);
            end
            pause(5);
            
            escalon_Callback(1,eventdata,handles);
            
            set(handles.op1,'visible','on');
        otherwise
    end
    
    % --- Executes on button press in radiobutton4.
    
    
function op2c(handles)
    global Gz Controlador G Periodo Polo Angulo
    rango=20;
    Mp1=str2double(get(handles.emp,'String'))/100;
    Ts1=str2double(get(handles.ets,'String'));
    planta=feedback(Gz*Controlador,1);
    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
    if(Angulo<0)
        opcion=1;
    else
        opcion=0;
    end
    while datos.Overshoot>Mp1*100 || datos.SettlingTime>Ts1
        if opcion==1
            Angulo=Angulo+0.5;
            if(Angulo>-180 && Angulo<-7)
                if Angulo<(Angulo+rango)
                    controladores(handles);
                    planta=feedback(Gz*Controlador,1);
                    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
                else
                    opcion=0;
                end
            else
                opcion=0;
            end
            
        else
            Angulo=Angulo-0.5;
            if(Angulo>7 && Angulo<180)
                if Angulo>(Angulo-rango)
                    controladores(handles);
                    planta=feedback(Gz*Controlador,1);
                    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
                else
                    break;
                end
            else
                break;
            end
        end
    end
    planta=feedback(Gz*Controlador,1);
    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
    if datos.Overshoot>Mp1 || datos.SettlingTime>Ts1
        disp(datos.SettlingTime);
        disp(datos.Overshoot);
        msgbox('No se puede cumplir los requerimientos')
    else
        msgbox('Rediseño exitoso');
        set(handles.angc,'String',Angulo);
    end
    
function op2d(handles)
    global Gz Controlador G Periodo Polo Angulo
    rango=40;
    planta=feedback(Gz*Controlador,1);
    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
    Ts=str2double(get(handles.ets,'String'));
    if(Angulo<0)
        opcion=1;
    else
        opcion=0;
    end
    while datos.SettlingTime>Ts
        if opcion==1
            Angulo=Angulo+0.5;
            if(Angulo>-180 && Angulo<-7)
                if Angulo<(Angulo+rango)
                    controladores(handles);
                    planta=feedback(Gz*Controlador,1);
                    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
                else
                    opcion=0;
                end
            else
                opcion=0;
            end
            
        else
            Angulo=Angulo-0.5;
            if(Angulo>7 && Angulo<180)
                if Angulo>(Angulo-rango)
                    controladores(handles);
                    planta=feedback(Gz*Controlador,1);
                    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
                else
                    break;
                end
            else
                break;
            end
        end
    end
    planta=feedback(Gz*Controlador,1);
    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
    if datos.SettlingTime>Ts
        msgbox('No se puede rediseñar');
    else
        msgbox('Rediseño exitoso');
        set(handles.angc,'String',Angulo);
    end
    
function op2e(handles)
    global Gz Controlador G Periodo
    
    planta=feedback(Gz*Controlador,1);
    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
    Ts=str2double(get(handles.ets,'String'));
    Periodo=0.001;
    
    while datos.SettlingTime>Ts
        Periodo=Periodo+0.01
        Gz=c2d(G,Periodo);
        controladores(handles);
        planta=feedback(Gz*Controlador,1);
        datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
        
    end
    
function op2f(handles)
    global Gz Controlador G Periodo Polo Angulo
    PeriodoOriginal=Periodo;
    rango=20;
    planta=feedback(Gz*Controlador,1);
    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
    Mp=str2double(get(handles.emp,'String'))/100;
    Periodo=PeriodoOriginal;
    if(Angulo<0)
        opcion=1;
    else
        opcion=0;
    end
    while datos.Overshoot>(Mp*100)
        if opcion==1
            Angulo=Angulo+0.5;
            if(Angulo>-180 && Angulo<-7)
                if Angulo<(Angulo+rango)
                    controladores(handles);
                    planta=feedback(Gz*Controlador,1);
                    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
                else
                    opcion=0;
                end
            else
                opcion=0;
            end
            
        else
            Angulo=Angulo-0.5;
            if(Angulo>7 && Angulo<180)
                if Angulo>(Angulo-rango)
                    controladores(handles);
                    planta=feedback(Gz*Controlador,1);
                    datos = stepinfo(planta,'RiseTimeLimits',[0.05 0.95]);
                else
                    break;
                end
            else
                break;
            end
        end
    end
    if datos.Overshoot>(Mp*100)
        msgbox('No se puede rediseñar');
    else
        msgbox('Rediseño exitoso');
        set(handles.angc,'String',Angulo);
    end
function radiobutton4_Callback(hObject, eventdata, handles)
    % hObject    handle to radiobutton4 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of radiobutton4
    
    
    % --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
    % hObject    handle to Untitled_1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --------------------------------------------------------------------
function uitoggletool3_ClickedCallback(hObject, eventdata, handles)
    % hObject    handle to uitoggletool3 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    
    % --- Executes on button press in p0.
function p0_Callback(hObject, eventdata, handles)
    global Periodo  Polo Angulo Gz Controlador controlador2
    ep=str2double(get(handles.tep,'String'));
    if ep==0
        msgbox('Ya tiene error de posicion igual a 0.')
        
    else
        
        [~,controlador2]=eestacionario(2,0,Controlador,Gz,Periodo,Polo,Angulo);
        [~,e]=errores(controlador2,Controlador*Gz,Periodo);
        set(handles.tep,'String',e(1));
        set(handles.tev,'String',e(2));
        set(handles.tea,'String',e(3));
    end
    % hObject    handle to p0 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of p0
    
    
    % --- Executes on button press in v0.
function v0_Callback(hObject, eventdata, handles)
    % hObject    handle to v0 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of v0
    
    global Periodo  Polo Angulo Gz Controlador controlador2
    
    [~,controlador2]=eestacionario(4,0,Controlador,Gz,Periodo,Polo,Angulo);
    [~,e]=errores(controlador2,Controlador*Gz,Periodo);
    set(handles.tep,'String',e(1));
    set(handles.tev,'String',e(2));
    set(handles.tea,'String',e(3));
    % --- Executes on button press in a0.
function a0_Callback(hObject, eventdata, handles)
    % hObject    handle to a0 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of a0
    
    global Periodo  Polo Angulo Gz Controlador controlador2
    
    [~,controlador2]=eestacionario(6,0,Controlador,Gz,Periodo,Polo,Angulo);
    [~,e]=errores(controlador2,Controlador*Gz,Periodo);
    set(handles.tep,'String',e(1));
    set(handles.tev,'String',e(2));
    set(handles.tea,'String',e(3));
