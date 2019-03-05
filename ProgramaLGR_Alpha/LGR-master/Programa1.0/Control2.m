
function varargout = Control2(varargin)
    
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
        'gui_Singleton',  gui_Singleton, ...
        'gui_OpeningFcn', @Control2_OpeningFcn, ...
        'gui_OutputFcn',  @Control2_OutputFcn, ...
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
    
function Control2_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;
    set(handles.edit2, 'enable', 'off');
    set(handles.axes3,'xgrid','on','ygrid','on')
    
    guidata(hObject, handles);
    
    
function varargout = Control2_OutputFcn(hObject, eventdata, handles)
    varargout{1} = handles.output;
    
    
function edit1_Callback(hObject, eventdata, handles)
    global texto G Retardo Periodo x ValorLista texto2 Gz  PeriodoManueal
    s=tf('s');
    try
        H=get(hObject,'String');
        G=eval(H);
        
        texto=tf_to_latex(G,'G(s)');
        assignin('base','texto',texto);
        
        G1=G/(1+G);
        datos = stepinfo(G1);
        
        set(handles.text22,'String',datos.SettlingTime)
        set(handles.text23,'String',datos.Overshoot)
        set(handles.text24,'String',datos.Undershoot)
        set(handles.text25,'String',datos.PeakTime)
        
    catch
        msgbox('Se ha encontrado un error, ingrese una F(s) válida')
        return;
    end
 
     %*************************************************************************
    ValorLista=get(handles.popupmenu2,'Value');
    
    switch ValorLista
        case 1
            [Retardo,Periodo]=periodos(G/(G+1));
            set(handles.edit2,'String', Periodo);
            set(handles.text15,'String',Retardo);
        case 2
            [Retardo,Periodo]=periodos(G);
            if isnan(Periodo)
                msgbox('No es posible determinar el periodo para la planta en lazo abierto')
            end
        otherwise
            set(handles.axes3,'xgrid','on','ygrid','on')
            msgbox('Error no se ha  determinado el sistema de control')
    end
    assignin('base', 'Periodo', Periodo);
    assignin('base', 'Retardo', Retardo);
    try
        
        Gz=c2d(G,Periodo,'zoh');
        texto2=tf_to_latex(Gz,'G(z)');
        assignin('base', 'Gz', Gz);
        axes(handles.axes1);
        cla 'reset'
        text('Interpreter','LaTex','string',texto,'FontSize',24);
        axis off
        axes(handles.axes2);
        cla 'reset'
        text('Interpreter','LaTex','string',texto2,'FontSize',24);
        axis off
    catch
        msgbox('Error,no es posible calcular G(z)')
    end
    
function edit1_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function text5_CreateFcn(hObject, eventdata, handles)
    
function text9_CreateFcn(hObject, eventdata, handles)
    
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
    fontsize_0 = 12 + floor(font_dcount * (font_dcount < 0));
    font_dcount = (50 - length(G_tex))/10;
    fontsize_1 = 20 + ceil(font_dcount * (font_dcount < 0));
    if fontsize_1 < 12
        fontsize_1 = 12;
    end
    G_tex = ['$ \fontsize{' num2str(fontsize_0) '}{0}\selectfont ' name ' = \fontsize{' num2str(fontsize_1) '}{0}\selectfont ' G_tex '$'];
    
function axes1_CreateFcn(hObject, eventdata, handles)
    axis off
    
    guidata(hObject, handles);
    
function axes1_ButtonDownFcn(hObject, eventdata, handles)
    
function axes3_CreateFcn(hObject, eventdata, handles)
    
    
    guidata(hObject, handles);
    
function pushbutton1_Callback(~, eventdata, handles)
    global G ValorLista Retardo ValorPlanta Gz Periodo
    ValorLista=get(handles.popupmenu2,'Value');
    ValorPlanta=get(handles.popupmenu3,'Value');
    
    
    %*****
    switch ValorPlanta
        case 1      %PLANTA CONTINUA
            switch ValorLista
                case 1
                    try
                        
                        if(Retardo~=0)
                            axes(handles.axes3)
                            y1=pade((G/(1+G)),3);
                            rlocus(y1)
                            
                            axis equal
                        else
                            axes(handles.axes3)
                            rlocus(G/(1+G))
                            
                            axis equal
                            set(handles.axes3,'xgrid','on','ygrid','on')
                        end
                    catch
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                case 2
                    %         handles.g1=plot(handles.axes3,y1)
                    
                    try
                        
                        if(Retardo~=0)
                            axes(handles.axes3)
                            y1=pade((G),3)
                            assignin('base','y1',y1)
                            rlocus(y1)
                            
                            axis equal
                        else
                            axes(handles.axes3)
                            rlocus(G)
                            
                            axis equal
                            set(handles.axes3,'xgrid','on','ygrid','on')
                        end
                    catch
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                otherwise
                    set(handles.axes3,'xgrid','on','ygrid','on')
            end
        case 2 %CASO 2 CON PLANTA DISCRETA
            switch ValorLista
                case 1
                    try
                        y1=(Gz/(1+Gz));
                        axes(handles.axes3)
                        rlocus(y1)
                        zgrid
                        %axis equal
                        set(handles.axes3,'xgrid','on','ygrid','on')
                        
                    catch
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                case 2
                    %         handles.g1=plot(handles.axes3,y1)
                    try
                        
                        y1=Gz
                        axes(handles.axes3)
                        rlocus(y1)
                        zgrid
                        %axis equal
                        set(handles.axes3,'xgrid','on','ygrid','on')
                        
                    catch
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                otherwise
                    set(handles.axes3,'xgrid','on','ygrid','on')
            end
        otherwise
    end
    
function popupmenu2_Callback(hObject, eventdata, handles)
        
    cerrado=get(handles.popupmenu2,'Value');
    if cerrado==1
            set(handles.pushbutton1,'visible','off');

    else
        set(handles.pushbutton1,'visible','on');

    end

    
    
function popupmenu2_CreateFcn(hObject, eventdata, handles)
    
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function popupmenu3_Callback(hObject, eventdata, handles)
    
function popupmenu3_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function text14_CreateFcn(hObject, eventdata, handles)
    
function text15_CreateFcn(hObject, eventdata, handles)
    
function checkbox1_Callback(hObject, eventdata, handles)
    global   G Periodo Retardo Gz texto2 PeriodoManual
    set(handles.axes3,'xgrid','on','ygrid','on')
    PeriodoManual=get(handles.checkbox1,'Value');
    
    if isempty(G)
        msgbox('Ingrese una función de trasnferencia.');
        return;
    end
    
    switch PeriodoManual
        case 0

            [Retardo,Periodo]=periodos(G/(G+1));
            set(handles.edit2,'String', Periodo);
            
            Gz=c2d(G,Periodo,'zoh');
            texto2=tf_to_latex(Gz,'G(z)');
            assignin('base', 'Gz', Gz);
            cla 'reset'
            axis off
            axes(handles.axes2);
            text('Interpreter','LaTex','string',texto2,'FontSize',24);
            axis off
            if isnan(Periodo)
                msgbox('No es posible determinar el periodo para la planta en lazo abierto')
            end
            %             otherwise
            %             msgbox('Error no se ha  determinado el sistema de control')
            % end
            set(handles.edit2, 'enable', 'off');
        case 1
            set(handles.edit2, 'enable', 'on');
            
            
    end
    assignin('base', 'Periodo', (Periodo));
    assignin('base', 'Retardo', Retardo);
    
    
    
function edit2_Callback(hObject, eventdata, handles)
    %MODIFICA EL PERIODO
    global Periodo G Retardo Gz texto2 PeriodoManueal PERIODOUSUARIO
    PeriodoManueal=get(handles.checkbox1,'Value');
    
    if isempty(G)
        msgbox('Ingrese una función de trasnferencia.');
        return;
    end
    
    switch PeriodoManueal
        case 0
            [Retardo,Periodo]=periodos(G);
            set(handles.edit2,'String',Periodo);
            set(handles.edit2, 'enable', 'off');
            
            
        case 1
            set(handles.edit2, 'enable', 'on');
            Periodo=str2double(get(handles.edit2,'String'));
            PERIODOUSUARIO=Periodo;
        otherwise
            set(handles.axes3,'xgrid','on','ygrid','on')
            return;
    end
    assignin('base', 'Periodo', Periodo);
    assignin('base', 'Retardo', Retardo);
    try
        
        Gz=c2d(G,(evalin('base','Periodo')),'zoh');
        texto2=tf_to_latex(Gz,'G(z)');
        assignin('base', 'Gz', Gz);
        cla 'reset'
        axis off
        axes(handles.axes2);
        text('Interpreter','LaTex','string',texto2,'FontSize',24);
        axis off
    catch
        msgbox('Error, porfavor ingrese un periodo válido.');
        
    end
    
function edit2_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function edit2_KeyPressFcn(hObject, eventdata, handles)
    global tecla Periodo
    set(handles.axes3,'xgrid','on','ygrid','on')
    tecla=get(gcf,'currentkey');
    if (strcmp(tecla,'return'))
        
        if isnan(Periodo)
            msgbox('No es posible determinar el periodo para la planta en lazo abierto')
        else
            return;
        end
        
        
        
    end
    
function axes2_CreateFcn(hObject, eventdata, handles)
    axis off
    guidata(hObject, handles);
    
function pushbutton2_Callback(hObject, eventdata, handles)
    global G ValorLista Retardo ValorPlanta Gz Periodo
    ValorLista=get(handles.popupmenu2,'Value');
    ValorPlanta=get(handles.popupmenu3,'Value');
    
    
    %*****
    switch ValorPlanta
        case 1      %PLANTA CONTINUA
            switch ValorLista
                case 1
                    try
                        axes(handles.axes3);
                        s=tf('s');
                        step((G/(1+G)));
                        set(handles.axes3,'xgrid','on','ygrid','on')
                    catch
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                case 2
                    %         handles.g1=plot(handles.axes3,y1)
                    try
                        axes(handles.axes3);
                        step(G);
                        set(handles.axes3,'xgrid','on','ygrid','on')
                    catch
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                otherwise
                    set(handles.axes3,'xgrid','on','ygrid','on')
            end
        case 2 %CASO 2 CON PLANTA DISCRETA
            switch ValorLista
                case 1
                    try
                        axes(handles.axes3);
                        step((Gz/(1+Gz)));
                        set(handles.axes3,'xgrid','on','ygrid','on')
                        
                    catch
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                case 2
                    %         handles.g1=plot(handles.axes3,y1)
                    try
                        
                        axes(handles.axes3);
                        step((Gz));
                        set(handles.axes3,'xgrid','on','ygrid','on')
                        %axis equal
                        set(handles.axes3,'xgrid','on','ygrid','on')
                        
                    catch
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                otherwise
                    set(handles.axes3,'xgrid','on','ygrid','on')
            end
        otherwise
    end
    
function pushbutton3_Callback(hObject, eventdata, handles)
    global G ValorLista Retardo ValorPlanta Gz Periodo
    ValorLista=get(handles.popupmenu2,'Value');
    ValorPlanta=get(handles.popupmenu3,'Value');
    s=tf('s');
    
    %*****
    switch ValorPlanta
        case 1      %PLANTA CONTINUA
            switch ValorLista
                case 1
                    try
                        axes(handles.axes3);
                        step((G/s*(1+G)));
                        set(handles.axes3,'xgrid','on','ygrid','on')
                    catch
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                case 2
                    %         handles.g1=plot(handles.axes3,y1)
                    try
                        axes(handles.axes3);
                        step(G/s);
                        set(handles.axes3,'xgrid','on','ygrid','on')
                    catch
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                otherwise
                    set(handles.axes3,'xgrid','on','ygrid','on')
            end
        case 2 %CASO 2 CON PLANTA DISCRETA
            switch ValorLista
                case 1
                    try
                        
                        Rampa=c2d(1/s,Periodo,'zho')
                        (Gz/(1+Gz)*Rampa)
                        axes(handles.axes3);
                        step((Gz/(1+Gz)*Rampa));
                        set(handles.axes3,'xgrid','on','ygrid','on')
                        axis([0 10 0 10])
                    catch
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                case 2
                    %         handles.g1=plot(handles.axes3,y1)
                    try
                        Rampa=c2d(1/s,Periodo,'zho')
                        axes(handles.axes3);
                        step((Gz)*Rampa);
                        set(handles.axes3,'xgrid','on','ygrid','on')
                        %axis equal
                        set(handles.axes3,'xgrid','on','ygrid','on')
                        axis([0 10 0 10])
                    catch
                        
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                otherwise
                    set(handles.axes3,'xgrid','on','ygrid','on')
            end
        otherwise
    end
    
function pushbutton4_Callback(hObject, eventdata, handles)
    global G ValorLista Retardo ValorPlanta Gz Periodo
    ValorLista=get(handles.popupmenu2,'Value');
    ValorPlanta=get(handles.popupmenu3,'Value');
    s=tf('s');
    
    %*****
    switch ValorPlanta
        case 1      %PLANTA CONTINUA
            switch ValorLista
                case 1
                    try
                        axes(handles.axes3);
                        
                        step((G/(s^2*(1+G))));
                        set(handles.axes3,'xgrid','on','ygrid','on')
                    catch
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                case 2
                    %         handles.g1=plot(handles.axes3,y1)
                    try
                        axes(handles.axes3);
                        step(G/s^2);
                        set(handles.axes3,'xgrid','on','ygrid','on')
                    catch
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                otherwise
                    set(handles.axes3,'xgrid','on','ygrid','on')
            end
        case 2 %CASO 2 CON PLANTA DISCRETA
            switch ValorLista
                case 1
                    try
                        
                        Rampa=c2d(1/s^2,Periodo,'zho')
                        (Gz/(1+Gz)*Rampa)
                        axes(handles.axes3);
                        step((Gz/(1+Gz)*Rampa));
                        set(handles.axes3,'xgrid','on','ygrid','on')
                        axis([0 10 0 10])
                    catch
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                case 2
                    %         handles.g1=plot(handles.axes3,y1)
                    try
                        Rampa=c2d(1/s^2,Periodo,'zho')
                        axes(handles.axes3);
                        step((Gz)*Rampa);
                        set(handles.axes3,'xgrid','on','ygrid','on')
                        %axis equal
                        set(handles.axes3,'xgrid','on','ygrid','on')
                        axis([0 10 0 10])
                    catch
                        
                        msgbox('Error,No ha ingresado función de transferencia.')
                    end
                otherwise
                    set(handles.axes3,'xgrid','on','ygrid','on')
            end
        otherwise
    end
    
function popupmenu4_Callback(hObject, eventdata, handles)
    
function popupmenu4_CreateFcn(hObject, eventdata, handles)
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
function checkbox2_Callback(hObject, eventdata, handles)
    Opcion=get(handles.checkbox2,'Value')
    switch Opcion
        case 0
            axes(handles.axes3)
            datacursormode on
        case 1
            axes(handles.axes3)
            datacursormode off
        otherwise
            axes(handles.axes3)
            datacursormode on
    end
    
function checkbox3_Callback(hObject, eventdata, handles)
    Opcion2=get(handles.checkbox3,'Value')
    switch Opcion2
        case 0
            axes(handles.axes3)
            grid on
        case 1
            axes(handles.axes3)
            grid off
        otherwise
            axes(handles.axes3)
            grid on
    end
    
function pushbutton5_Callback(hObject, eventdata, handles)
    global PeriodoManueal Periodo Manual
    if get(handles.checkbox1,'Value')==0
        PeriodoManueal=0;
    else
        PeriodoManueal=1;
        Periodo=str2double(get(handles.edit2,'String'));
        Manual=str2double(get(handles.edit2,'String'));
   end
    Diseno


% --------------------------------------------------------------------
function Acerca_Callback(hObject, eventdata, handles)
Refer


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
global PeriodoManueal Periodo Manual G
    if get(handles.checkbox1,'Value')==0
        PeriodoManueal=0;
    else
        PeriodoManueal=1;
        Periodo=str2double(get(handles.edit2,'String'));
        Manual=str2double(get(handles.edit2,'String'));
   end
    Frecuencias
