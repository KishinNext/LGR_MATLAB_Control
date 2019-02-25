function varargout = Frecuencias(varargin)
% FRECUENCIAS MATLAB code for Frecuencias.fig
%      FRECUENCIAS, by itself, creates a new FRECUENCIAS or raises the existing
%      singleton*.
%
%      H = FRECUENCIAS returns the handle to a new FRECUENCIAS or the handle to
%      the existing singleton*.
%
%      FRECUENCIAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FRECUENCIAS.M with the given input arguments.
%
%      FRECUENCIAS('Property','Value',...) creates a new FRECUENCIAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Frecuencias_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Frecuencias_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Frecuencias

% Last Modified by GUIDE v2.5 24-Feb-2019 20:39:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Frecuencias_OpeningFcn, ...
                   'gui_OutputFcn',  @Frecuencias_OutputFcn, ...
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


% --- Executes just before Frecuencias is made visible.
function Frecuencias_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Frecuencias (see VARARGIN)
set(handles.popupmenu1,'enable','off')
    %set(handles.edit6,'enable','off')
    axes(handles.axes2);
    axis off
    axes(handles.axes3);
    axis off
    axes(handles.axes1);
    grid on
% Choose default command line output for Frecuencias
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Frecuencias wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Frecuencias_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


   
function Mg_Callback(hObject, eventdata, handles)
    global ValorMg ValorMf ValorWg Vector
    ValorMf=get(handles.Mf,'Value');
    ValorMg=get(handles.Mg,'Value');
    ValorWg=get(handles.Wg,'Value');
    set(handles.popupmenu1,'enable','off')
    Vector=[num2str(ValorMf) num2str(ValorWg)];
    
    switch ValorMg
        case 0
            switch Vector
                case '00'
                    set(handles.Mg,'enable','on')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','on')
                    set(handles.selectMg,'enable','on')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','on')
                case '01'
                    set(handles.Mg,'enable','off')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','on')
                    %**
                    set(handles.selectMg,'String',0)
                    set(handles.selectMg,'enable','off')
                    
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','on')
                    
                case '10'
                    set(handles.Mg,'enable','on')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','on')
                    %*

                    set(handles.selectMg,'enable','on')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','on')
                case '11'
                    set(handles.Mg,'enable','off')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','on')
                    %***
                    set(handles.selectMg,'String',0)
                    
                    set(handles.selectMg,'enable','off')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','on')
            end
        case 1
            switch Vector
                case '00'
                     set(handles.Mg,'enable','on')
                    set(handles.Mf,'enable','on')

                    set(handles.Wg,'enable','off')
                    %**
                    set(handles.selectWg,'String',0)
                    set(handles.selectWg,'enable','off')
                    
                    set(handles.selectMg,'enable','on')
                    set(handles.selectMf,'enable','on')

                case '01'
                    msgbox('Conjunto no valido')
                case '10'
                     set(handles.Mg,'enable','on')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','off')
                    %**
                    set(handles.selectWg,'String',0)
                    
                    set(handles.selectMg,'enable','on')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','off')
                case '11'
                    msgbox('Conjunto no valido')
            end
        otherwise
            
    end
    
function Mf_Callback(hObject, eventdata, handles)
    global ValorMg ValorMf ValorWg Vector2
    ValorMf=get(handles.Mf,'Value');
    ValorMg=get(handles.Mg,'Value');
    ValorWg=get(handles.Wg,'Value');
    set(handles.popupmenu1,'enable','off')
    Vector2=[num2str(ValorMg) num2str(ValorWg)];
    
    switch ValorMf
        case 0
            switch Vector2
                case '00'
                    set(handles.Mg,'enable','on')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','on')
                    set(handles.selectMg,'enable','on')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','on')
                case '01'
                    set(handles.Mg,'enable','off')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','on')
                    
                    set(handles.selectMg,'String',0)
   
                    
                    set(handles.selectMg,'enable','off')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','on')
                case '10'
                    set(handles.Mg,'enable','on')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','off')
                    
                    set(handles.selectWg,'String',0)
                    
                    set(handles.selectMg,'enable','on')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','off')
                case '11'
                    msgbox('Conjunto no valido')
                otherwise
            end
        case 1
            switch Vector2
                case'00'
                    set(handles.Mg,'enable','on')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','on')
                    set(handles.selectMg,'enable','on')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','on')
                case'01'
                    set(handles.Mg,'enable','off')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','on')
                    
                    set(handles.selectMg,'String',0)
   
                    
                    set(handles.selectMg,'enable','off')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','on')
                case'10'
                    set(handles.Mg,'enable','on')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','off')
                    
                    set(handles.selectWg,'String',0)
                    
                    set(handles.selectMg,'enable','on')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','off')
                case'11'
                    msgbox('Conjunto no valido')
                otherwise
            end
        otherwise
            
    end
    
function Wg_Callback(hObject, eventdata, handles)
    global ValorMg ValorMf ValorWg Vector3
    ValorMf=get(handles.Mf,'Value');
    ValorMg=get(handles.Mg,'Value');
    ValorWg=get(handles.Wg,'Value');
    set(handles.popupmenu1,'enable','off')
    Vector3=[num2str(ValorMg) num2str(ValorMf)];
    
    switch ValorWg
        case 0
            switch Vector3
                case '00'
                    set(handles.Mg,'enable','on')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','on')
                    set(handles.selectMg,'enable','on')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','on')
                case '01'
                    set(handles.Mg,'enable','on')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','on')
                    set(handles.selectMg,'enable','on')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','on')
                case '10'
                    set(handles.Mg,'enable','off')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','on')
                    
                    set(handles.selectMg,'String',0)
                    
                    set(handles.selectMg,'enable','off')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','on')
                case '11'
                    set(handles.Mg,'enable','on')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','off')
                    

                    set(handles.selectWg,'String',0)
                    
                    set(handles.selectMg,'enable','on')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','off')               
                otherwise
            end
        case 1
            switch Vector3
                case'00'
                    set(handles.Mg,'enable','off')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','on')
                    
                    set(handles.selectMg,'String',0)
                    
                    
                    set(handles.selectMg,'enable','off')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','on')
                case'01'
                    set(handles.Mg,'enable','off')
                    set(handles.Mf,'enable','on')
                    set(handles.Wg,'enable','on')
                    
                    set(handles.selectMg,'String',0)

                                      
                    set(handles.selectMg,'enable','off')
                    set(handles.selectMf,'enable','on')
                    set(handles.selectWg,'enable','on')
                case'10'
                    msgbox('Conjunto no validos')
                case'11'
                    msgbox('Conjunto no validoss')
                otherwise
            end
        otherwise
    end

    
function selectMg_Callback(hObject, eventdata, handles)
    
function selectMg_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function selectMf_Callback(hObject, eventdata, handles)
    
function selectMf_CreateFcn(hObject, eventdata, handles)
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
    
function selectWg_Callback(hObject, eventdata, handles)
    
function selectWg_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function confirmar_Callback(hObject, eventdata, handles)
    global ValorMg ValorMf ValorWg Periodo G Gz PeriodoManueal Mg Mf Wg control Manual opp opv opa

    opp=0;
    opv=0;
    opa=0;
    ValorMg=get(handles.Mg,'Value');
    ValorMf=get(handles.Mf,'Value');
    ValorWg=get(handles.Wg,'Value');
        set(handles.tep,'String','-');
        set(handles.tev,'String','-');
        set(handles.tea,'String','-');
    set(handles.tea,'enable','on')
    
    if ValorMg~=0 && ValorMf~=0
        try
            Mg=str2num(get(handles.selectMg,'String'));
            Mf=str2num(get(handles.selectMf,'String'));
            Wg=0;
            control=1;
         
%         set(handles.selectMg,'String',Mg);
%         set(handles.selectMf,'String',Mf);
%         set(handles.selectWg,'String','-');
%         
        
        if PeriodoManueal==0
                Periodo=Periodo;
        else
                Periodo=Manual;     
        end
        
    
        set(handles.popupmenu1,'enable','on')
        set(handles.T,'String',Periodo);
             
        catch
            msgbox('Error, posiblemente ingreso un valor erroneo')
        end
        
    elseif ValorMf~=0 && ValorWg~=0
        try
           Mf=str2num(get(handles.selectMf,'String'));
           Wg=str2num(get(handles.selectWg,'String'));
           Mg=0;
        control=2;
%         set(handles.selectMg,'String','-');
%         set(handles.selectMf,'String',Mf);
%         set(handles.selectWg,'String',Wg);
        
         if PeriodoManueal==0
                Periodo=Periodo;
        else
                Periodo=Manual;     
        end
        
        set(handles.popupmenu1,'enable','on')
        set(handles.T,'String',Periodo);
            
        catch
            msgbox('Error, posiblemente ingreso un valor erroneo')
        end
           
    else
        msgbox('Seleccione almenos dos opciones.')
    end
  
%PeriodoOriginal=Periodo;
%      if (PeriodoManueal)
%          disp("AJIACO")
%          Periodo=PERIODOUSUARIO;
%          set(handles.T,'String',Periodo);
%      end
%          
%     PoloOri=Polo;
%     AnguloOri=Angulo;
    Gz=c2d(G,Periodo);
    texto4=tf_to_latex(Gz,'C(z)');
    axes(handles.axes3);
    cla 'reset'
    text('Interpreter','LaTex','string',texto4,'FontSize',18);
    axis off
    
function controladores (handles)
    global listacontrol  Controlador Periodo G texto4 Gz Mg Mf Wg opcion Kp Kv Ka control Cw opp opv opa Gw
    listacontrol=get(handles.popupmenu1,'Value');
    opp=get(handles.p0,'Value');
    opv=get(handles.v0,'Value');
    opa=get(handles.a0,'Value');
    format long
    try
    if opp~=0
        opcion=1;
        Kp=str2num(get(handles.eep,'String'));
    elseif opv~=0
        opcion=2;
        Kv=str2num(get(handles.eev,'String'));
    elseif opa~=0
        opcion=3;
        Ka=str2num(get(handles.eea,'String'));
    else
        opcion=0;
        
    end
    catch
                msgbox('seleccione error de estado estacionario')
    end   
    switch listacontrol
        case 2


Gw=d2c(Gz,'tustin');
s=tf('s');
P=pole(Gw);

O=5;
integrador=0;
contador=1;
if opcion==1
    for k=1:length(P)
        if P(k)==0
            integrador=0;
            contador=contador+1;
        end
    end
    if contador>=2
        K=1;
    else
        if integrador~=1
            y=1-integrador;
            int=1/(s^(y+integrador));
            lim=evalfr(minreal(int*s^(1)*Gw),0);
            K=Kp/lim;   
        else
            int=1/(s^(1));
            lim=evalfr(minreal(int*s^1*Gw),0);
            K=Kp/lim; 
        end 
    end
elseif opcion==2
   
    for k=1:length(P)
        if P(k)==0
            integrador=0;
            contador=contador+1;
        end
    end
    if contador>=2
        K=1;
    else
        if integrador~=2
            y=2-integrador;
            int=1/(s^(y));
            lim=evalfr(minreal(int*s^(2)*Gw),0);
            K=Kv/lim;   
        else
            int=1/(s^(2));
            lim=evalfr(minreal(int*s^2*Gw),0);
            K=Kv/lim; 
            
        end
    end
elseif opcion==3
    for k=1:length(P)
        if P(k)==0
            integrador=integrador+1;
            contador=contador+1;
        end
    end
    if contador>=3
        K=1;
    else
        if integrador~=3
            y=3-integrador;
            int=1/(s^(y));
            lim=evalfr(minreal(int*s^(3)*Gw),0);
            K=Ka/lim;   
        else
            int=1/(s^(3));
            lim=evalfr(minreal(int*s^3*Gw),0);
            K=Ka/lim; 
        end
    end
else
    K=1;
end

if K==0
   K=1;
   Gw=Gw*K;
else
    Gw=Gw*K;
end


int
[~,Pm,~,~]=margin(Gw*int)
%disp("Diseño de controlador en adelando.")
for k=1:90
    MFr=Pm;
    
    phi=Mf-MFr+O;
    b=(1+sind(phi))/(1-sind(phi));
    cal=-10*log10(b);
        if b>0 && (0<phi) && (phi<90)
            disp("Diseñando...")
            w=1:0.0001:100;
%             figure
%             bode(Gw,w);
            [MAG,PHASE,X]=bode(Gw,w);
            Magnitud=reshape(MAG,[],1);
            MagnitudDB=20*log10(Magnitud);
            Phase=reshape(PHASE,[],1);
            frecuencia=reshape(X,[],1);
            [fi,~]=find(MagnitudDB>(cal-0.05) & MagnitudDB<(cal+0.05));
            try
                phi2=MFr-Phase(fi(1)); %PREGUNTAR
            catch
                disp("Los rasgos del sistema no cumplen")    
            end
            if (phi2)<O 
                
                T2=1/(frecuencia(fi(1))*sqrt(b));
                Cw=tf([b*T2 1],[T2 1]);
                [~,Pm,~,~]=margin(Gw*Cw);
                if Pm<Mf 
                    O=O+1;
                else
                    msgbox("Diseño Finalizado.")
%                     figure
%                     margin(Gw*Cw)
                    break;
                end
            else
                disp("Se necesita modificar theta, se diseña nuevamente...")
                O = O+1;
            end
        else
           msgbox("Diseño fallido, no es posible cumplir los requerimientos")
           return;
        end
end   
                    Controlador=c2d(Cw,Periodo,'tustin');
                    [a,b,c,d]=margin(Cw*Gw);
                    [num,den]=tfdata(Controlador,'v');  
                    %[Controlador]=Adelanto(G,Mf,Mg,Wg,Periodo,opcion,Kv,Kp,Ka);                   
                    
                     %[num,den]=tfdata(Controlador)
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
                
            
        case 3
            try
             
                    [num,den,Gw,Cw]=Atraso(G,Mf,Mg,Wg,Periodo,opcion,Kv,Kp,Ka)
                    %[num,den]=tfdata(Controlador);
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
                
            catch
                msgbox('Controlador no disponible')
            end
        case 4
            try
                disp("HOLA")
                if control==1   
                    Controlador=combinacion1(G,Mf,Mg,Wg,Periodo,opcion,Kv,Kp,Ka);
                elseif control==2
                    Controlador=combinacion2(G,Mf,Mg,Wg,Periodo,opcion,Kv,Kp,Ka);
                end 
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
        otherwise
    end
    
function popupmenu1_Callback(hObject, eventdata, handles)
    global Zita Periodo G Gz Controlador PeriodoOriginal 
    
    
    Gz=c2d(G,Periodo);
    controladores(handles);
        [~,e]=errores(Controlador,Gz,Periodo);
        set(handles.tep,'String',e(1));
        set(handles.tev,'String',e(2));
        set(handles.tea,'String',e(3));
    if get(handles.Mg,'Value')==1 && get(handles.Mf,'Value')==1
        
        planta2=feedback(Gz*Controlador,1);
        datos = stepinfo(planta2,'RiseTimeLimits',[0.05 0.95]);
        set(handles.tz,'String','-');
        set(handles.twn,'String','-');
        set(handles.tmp,'String',datos.Overshoot);
        set(handles.tn,'String','-');
        set(handles.tts,'String',datos.SettlingTime);
    end
    if get(handles.Mf,'Value')==1 && get(handles.Wg,'Value')==1

        planta2=feedback(Gz*Controlador,1);
        datos = stepinfo(planta2,'RiseTimeLimits',[0.05 0.95]);
        set(handles.tz,'String',Zita);
        set(handles.twn,'String','-');
        set(handles.tmp,'String','-');
        set(handles.tn,'String','-');
        set(handles.tts,'String',datos.SettlingTime);

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
    
    
    % --- Executes on button press in pushbutton10.
function pushbutton6_Callback(hObject, eventdata, handles)
global Gz Controlador ValorLista4 Periodo G 
    ValorLista4=get(handles.popupmenu3,'Value');
    switch ValorLista4
        case 1
            try
                Gz=c2d(G,Periodo)
                axes(handles.axes1)
                y1=feedback(Gz*Controlador,1);
                axes(handles.axes1)
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
                
                hold on
                rlocus(Gz*Controlador)
                hold off
                axis equal
                set(handles.axes1,'xgrid','on','ygrid','on')
                
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
        case 3
%             try
%                 Gz=c2d(G,Periodo)
%                 axes(handles.axes1)
%                 plot(real(Polo),imag(Polo),'*k', 'MarkerSize',10)
%                 hold on
%                 rlocus(Gz*Controlador*controlador2)
%                 hold off
%                 axis equal
%                 set(handles.axes1,'xgrid','on','ygrid','on')
%                 
%             catch
%                 msgbox('Error,No ha ingresado función de transferencia.')
%             end
%             
        otherwise
            set(handles.axes1,'xgrid','on','ygrid','on')
            
    end
    
    
    
function edit6_Callback(hObject, eventdata, handles)
    % hObject    handle to tea (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of tea as text
    %        str2double(get(hObject,'String')) returns contents of tea as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to tea (see GCBO)
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
    global Periodo  Polo Angulo Gz Controlador controlador2 Kp
    
     Kp=str2double(get(handles.eep,'String'));
%     if ep==0
%         msgbox('Error,No se puede modificar.')
%         
%     else
%         error=str2double(get(handles.eep,'String'));
%         [a,controlador2]=eestacionario(1,error,Controlador,Gz,Periodo,Polo,Angulo);
%         [~,e]=errores(controlador2,Controlador*Gz,Periodo);
%         set(handles.tep,'String',e(1));
%         set(handles.tev,'String',e(2));
%         set(handles.tea,'String',e(3));
%     end
     
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
    % hObject    handle to tev (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of tev as text
    %        str2double(get(hObject,'String')) returns contents of tev as a double
    
    global Periodo  Polo Angulo Gz Controlador controlador2 Kv
     Kv=str2num(get(handles.eev,'String'));
%     ep=str2double(get(handles.tep,'String'));
%     ev=str2double(get(handles.tev,'String'));
%     
%     if ev==0
%         msgbox('Error,No se puede modificar.')
%         
%     else
%         if ep~=0
%             aux=PI(0.9999,0.00001,Periodo,Controlador*Gz,2);
%             control=Controlador*aux;
%             [~,e]=errores(controlador2,control*Gz,Periodo);
%             
%             error=str2double(get(handles.tev,'String'));
%             [~,controlador2]=eestacionario(3,error,control,Gz,Periodo,Polo,Angulo);
%             
%             [~,e]=errores(controlador2,control*Gz,Periodo);
%             set(handles.tep,'String',e(1));
%             set(handles.tev,'String',e(2));
%             set(handles.tea,'String',e(3));
%         else
%             error=str2double(get(handles.tev,'String'));
%             [~,controlador2]=eestacionario(3,error,Controlador,Gz,Periodo,Polo,Angulo);
%             
%             [~,e]=errores(controlador2,Controlador*Gz,Periodo);
%             set(handles.tep,'String',e(1));
%             set(handles.tev,'String',e(2));
%             set(handles.tea,'String',e(3));
%         end
%         
%     end
    % --- Executes during object creation, after setting all properties.
function tev_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to tev (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
function eea_Callback(hObject, eventdata, handles)
    % hObject    handle to tea (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of tea as text
    %        str2double(get(hObject,'String')) returns contents of tea as a double
    
     global Periodo  Polo Angulo Gz Controlador controlador2 Ka
     Ka=str2num(get(handles.eea,'String'));
%     ev=str2double(get(handles.tev,'String'));
%     ea=str2double(get(handles.tea,'String'));
%     if ea==0
%         msgbox('Error,No se puede modificar.')
%         
%     else
%         if ev~=0
%             aux=PI(0.9999,0.00001,Periodo,Controlador*Gz,2);
%             control=Controlador*aux*aux;
%             [~,e]=errores(controlador2,control*Gz,Periodo);
%             error=str2double(get(handles.tea,'String'));
%             [~,controlador2]=eestacionario(5,error,control,Gz,Periodo,Polo,Angulo);
%             [~,e]=errores(controlador2,control*Gz,Periodo);
%             set(handles.tep,'String',e(1));
%             set(handles.tev,'String',e(2));
%             set(handles.tea,'String',e(3));
%         else
%             error=str2double(get(handles.tea,'String'));
%             [~,controlador2]=eestacionario(5,error,Controlador,Gz,Periodo,Polo,Angulo);
%             [~,e]=errores(controlador2,Controlador*Gz,Periodo);
%             set(handles.tep,'String',e(1));
%             set(handles.tev,'String',e(2));
%             set(handles.tea,'String',e(3));
%         end
%     end
    % --- Executes during object creation, after setting all properties.
function tea_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to tea (see GCBO)
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
    zita=str2double(get(handles.selectMg,'String'));
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
    n=str2double(get(handles.selectWg,'String'));
    
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
        % [Polo,Angulo]=opcionf(G,Mp,Wg,Periodo);
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
            if get(handles.ts,'Value')==1 && get(handles.Mg,'Value')==1
                opd(handles);
            end
            if get(handles.ts,'Value')==1 && get(handles.Wg,'Value')==1
                ope(handles);
            end
            if get(handles.Wg,'Value')==1 && get(handles.mp,'Value')==1
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
            if get(handles.ts,'Value')==1 && get(handles.Mg,'Value')==1
                op2d(handles);
            end
            if get(handles.ts,'Value')==1 && get(handles.Wg,'Value')==1
                op2e(handles);
            end
            if get(handles.Wg,'Value')==1 && get(handles.mp,'Value')==1
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
    global Periodo  Polo Angulo Gz Controlador controlador2 opp
    %ep=str2double(get(handles.tep,'String'));
    opp=get(handles.p0,'Value');
%     if ep==0
%         msgbox('Ya tiene error de posicion igual a 0.')
%         
%     else
%         
%         

%     end
    % hObject    handle to p0 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of p0
    
    
    % --- Executes on button press in v0.
function v0_Callback(hObject, eventdata, handles)
    global opv
     opv=get(handles.v0,'Value');
    % hObject    handle to v0 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of v0
    
  
    % --- Executes on button press in a0.
function a0_Callback(hObject, eventdata, handles)
    global opa
    opa=get(handles.a0,'Value');
    % hObject    handle to a0 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of a0
    
    global Periodo  Polo Angulo Gz Controlador controlador2
    




function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to tea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tea as text
%        str2double(get(hObject,'String')) returns contents of tea as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to eep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eep as text
%        str2double(get(hObject,'String')) returns contents of eep as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to tev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tev as text
%        str2double(get(hObject,'String')) returns contents of tev as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tev (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in p0.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to p0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of p0


% --- Executes on button press in v0.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to v0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of v0


% --- Executes on button press in a0.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of a0


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3


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
function pushbutton6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
global Gz Controlador ValorLista4 Periodo G Polo controlador2 Gw Cw
    
    ValorLista4=get(handles.popupmenu3,'Value');
    switch ValorLista4
        case 1
            try
                cla(handles.axes1,'reset');
                axes(handles.axes1)
                y1=feedback(Gw*Cw,1);
                
                hold on
                axes(handles.axes1)
                margin(Gw)
                margin(y1)
                hold off;
                axis equal
                set(handles.axes1,'xgrid','on','ygrid','on')
                
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
        case 2
            %         handles.g1=plot(handles.axes3,y1)
            
            try
                cla(handles.axes1,'reset');
                axes(handles.axes1)
                hold on
                margin(Gw)
                margin(Gw*Cw)
                
                
                axis equal
                set(handles.axes1,'xgrid','on','ygrid','on')
                
            catch
                msgbox('Error,No ha ingresado función de transferencia.')
            end
        case 3
%             try
%                 Gz=c2d(G,Periodo)
%                 axes(handles.axes1)
%                 plot(real(Polo),imag(Polo),'*k', 'MarkerSize',10)
%                 hold on
%                 rlocus(Gz*Controlador*controlador2)
%                 hold off
%                 axis equal
%                 set(handles.axes1,'xgrid','on','ygrid','on')
%                 
%             catch
%                 msgbox('Error,No ha ingresado función de transferencia.')
%             end
            
        otherwise
            set(handles.axes1,'xgrid','on','ygrid','on')
            
    end
