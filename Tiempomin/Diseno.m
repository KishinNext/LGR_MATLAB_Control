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
    global Periodo G
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to Diseno (see VARARGIN)
    Gzzpk=c2d(G,Periodo,'zoh');
    
    axes(handles.axes2);
    axis off
    axes(handles.axes3);
    axis off
    axes(handles.axes1);
    grid on
    texto2=tf_to_latex(Gzzpk,'G(z)');
    assignin('base', 'Gzzpk', Gzzpk);
    axes(handles.axes3);
    cla 'reset'
    text('Interpreter','LaTex','string',texto2,'FontSize',24);
    axis off
    % Choose default command line output for Diseno
    handles.output = hObject;
    
    guidata(hObject, handles);
    
function varargout = Diseno_OutputFcn(hObject, eventdata, handles)
    varargout{1} = handles.output;
    
function rampa_Callback(hObject, eventdata, handles)
    global a
    if get(hObject,'Value')
        a=2;
        estado='off';
        
        set(handles.eescalon,'enable',estado);
        
        set(handles.parabola,'enable',estado);
        set(handles.eram,'enable',estado);
    else
        a=0;
        estado='on';
        set(handles.eescalon,'enable',estado);
        
        set(handles.parabola,'enable',estado);
        set(handles.eram,'enable',estado);
    end
    
    
function parabola_Callback(hObject, eventdata, handles)
    global a
    if get(hObject,'Value')
        a=3;
        estado='off';
        
        set(handles.eescalon,'enable',estado);
        set(handles.ee,'enable',estado);
        
        set(handles.eparabola,'enable',estado);
        
        set(handles.rampa,'enable',estado);
        set(handles.eram,'enable',estado);
    else
        a=0;
        estado='on';
        set(handles.eescalon,'enable',estado);
        set(handles.ee,'enable',estado);
        
        set(handles.eparabola,'enable',estado);
        
        set(handles.rampa,'enable',estado);
        set(handles.eram,'enable',estado);
    end
    
    
    
function eu_Callback(hObject, eventdata, handles)
    
function eu_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function eram_Callback(hObject, eventdata, handles)
    
function eram_CreateFcn(hObject, eventdata, handles)
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
    
function eparabola_Callback(hObject, eventdata, handles)
    
function eparabola_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function confirmar_Callback(hObject, eventdata, handles)
    global Gz a Periodo fz Dz vector1 retardo
    error=0;
    be=0;
    if(get(handles.ee,'Value'))
        be=1;
        switch a
            case 1
                error=str2double(get(handles.eram,'String'));
                %error=(get(handles.eu,'String'));
            case 2
                error=str2double(get(handles.eparabola,'String'));
                %error=(get(handles.eram,'String'));
                
            otherwise
        end
        
    end
    [matriz1,matriz2,retardo,Dz,K]=caltmin(Gz,a,be,error,Periodo);
   
    vector1=double(conver(matriz1));
    [num,den] = zp2tf(cell2mat(Dz.Z),cell2mat(Dz.P),Dz.K);
    Dztf=tf(num,den,Periodo)
    set(handles.kv,'String',K(1));
    set(handles.ka,'String',K(2));

    texto2=tf_to_latex(Dztf,'D(z)');
    axes(handles.axes2);
    cla 'reset'
    text('Interpreter','LaTex','string',texto2,'FontSize',24);
    axis off
    assignin('base', 'Dz', Dz);
    
    assignin('base', 'vector1', vector1);
    
    %assignin('base', 'vector2', vector2);
    
    
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
    if get(handles.eescalon,'Value')==1 && get(handles.ts,'Value')==1
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
    if get(handles.parabola,'Value')==1 && get(handles.ts,'Value')==1
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
    if get(handles.parabola,'Value')==1 && get(handles.mp,'Value')==1
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
    if get(handles.parabola,'Value')==1 && get(handles.mp,'Value')==1
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
    
function eescalon_Callback(hObject, eventdata, handles)
    global a
    if get(hObject,'Value')
        a=1;
        estado='off';
        
        set(handles.rampa,'enable',estado);
        
        set(handles.parabola,'enable',estado);
        set(handles.eparabola,'enable',estado);
    else
        a=0;
        estado='on';
        set(handles.rampa,'enable',estado);
        
        set(handles.parabola,'enable',estado);
        set(handles.eparabola,'enable',estado);
    end
    
function pushbutton4_Callback(hObject, eventdata, handles)
    global Periodo vector1 retardo Gz Dz
    
    den=zeros(1,length(vector1)+retardo) 
    den(1)=1;
    intd = zpk([0],[1],Periodo,Periodo);
    axes(handles.axes1);
    %F = tf(vector1,den,Periodo)
    F=feedback(Gz*Dz,1);
    [~,t] = step(F);
    t = 0:F.Ts:t(end);
    axes(handles.axes1);
    lsim(F,t,t);
    set(handles.axes1,'xgrid','on','ygrid','on')
    
    
function pushbutton5_Callback(hObject, eventdata, handles)
    global Periodo vector1 retardo Gz Dz
    
    den=zeros(1,length(vector1+retardo))
    den(1)=1;
    axes(handles.axes1);
    %F = tf(vector1,den,Periodo)
    F=feedback(Gz*Dz,1);

    step(F);
    [~,t] = step(F);
    t = 0:F.Ts:t(end);
    axes(handles.axes1);
    lsim(F,t.^2,t);
    set(handles.axes1,'xgrid','on','ygrid','on')
    
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
    
    % Hint: place code in OpeningFcn to populate axes
    % --- Executes during object creation, after setting all properties.
    
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
    
    
    % --- Executes on button press in ee.
function ee_Callback(hObject, eventdata, handles)
    % hObject    handle to ee (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of ee
    
    
    % --- Executes on button press in v0.
    % --- Executes on button press in a0.
    
    
    
    % --- Executes on button press in er.
function er_Callback(hObject, eventdata, handles)
    % hObject    handle to er (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of er
    
    
    % --- Executes on button press in ep.
function ep_Callback(hObject, eventdata, handles)
    % hObject    handle to ep (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hint: get(hObject,'Value') returns toggle state of ep
    
    
    % --- Executes on button press in gesc.
function gesc_Callback(hObject, eventdata, handles)
    global Periodo vector1 retardo Gz Dz
    % hObject    handle to gesc (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    den=zeros(1,length(vector1)+retardo)
    den(1)=1;
    axes(handles.axes1);
    F = tf(vector1,den,Periodo)
    %step(F);
    step(feedback(Gz*Dz,1))
    set(handles.axes1,'xgrid','on','ygrid','on')
    
    
    % --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton11 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
