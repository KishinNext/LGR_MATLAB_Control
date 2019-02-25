build_gui;

function build_gui
    f = figure('Visible','on','Position',[350,50,800,650],'Name',...
        'Auto-control','MenuBar','None','ToolBar','None');
    set(gcf,'NumberTitle','off')
    % Genera tabs
    tgroup = uitabgroup('Parent', f);
    tt(1) = uitab('Parent', tgroup, 'Title', 'Planta');
    tt(2) = uitab('Parent', tgroup, 'Title', 'Controlador por LGR');
    tt(3) = uitab('Parent', tgroup, 'Title', 'Controlador por frecuencia');            
    t_idx = 1;
    tgroup.SelectionChangedFcn = @tabChanged;
    % Genera el panel de visualización de gráficos
    plot_pan = uipanel('FontSize',12,'position',[.03 .06 .95 .42]);
    plot_axs = axes('Parent',plot_pan,'Units','normalized','position',[0.15 0.175 0.8 0.8]);        
    % Genera el selector de gráficos
    sel_graph1 = uicontrol('Style','text', 'String', 'Visualizar:','HorizontalAlignment',...
        'left', 'Position', [30 3 70 25]) ;
    sel_graph1.Units = 'normalized';
    plotpopup = uicontrol('Style','popupmenu','Value', 3,...
           'String',{'LGR','Bode','Respuesta al escalón','Respuesta a rampa','Respuesta a parábola'}...
           ,'Callback',@update_plot,'Position',[100,7,200,25]);
    plotpopup.Units = 'normalized';
    looppopup = uicontrol('Style','popupmenu','Value', 2,'String',{'Lazo abierto','Lazo cerrado'}...
           ,'Position',[310,7,125,25],'Callback',@update_loop_conf);
    looppopup.Units = 'normalized';
    % Genera el botón de diseño
    design = uicontrol('Style','pushbutton','String','Diseñar','BackgroundColor',...
        [0.2 0.2 0.9],'Position',[575 7 100 30],'ForegroundColor','white',...
        'Callback',@design_controller,'Enable','off');    
    design.Units = 'normalized';
    % Genera botón de zoom
    zoom_btn = uicontrol('Style','pushbutton','String','Zoom On','BackgroundColor',...
        [0.2 0.2 0.9],'Position',[440 7 90 30],'ForegroundColor','white', ...
        'Callback',@zoom_onoff);
    zoom_btn.Units = 'normalized';    
    % Genera el botón de navegación derecho
    next = uicontrol('Style','pushbutton','String','Siguiente','BackgroundColor',...
        [0.2 0.2 0.9],'Position',[678 7 100 30],'ForegroundColor','white', ...
        'Callback',@next_tab);   
    next.Units = 'normalized';
    % -------------------------- tt(1) (Planta) ----------------------------
    plant_in = uipanel('Parent',tt(1),'FontSize',12,'Position',[.03 .75 .95 .23]);
    tf_in_pan = uipanel('Parent',plant_in,'Title','Ingrese la función de transferencia',...
                        'FontSize',9,'Position',[.03 .55 .95 .45]);    
    % Ingresa función de transferencia
    edttf = uicontrol('Parent',tf_in_pan,'Style','edit','Position',...
        [10 10 300 30],'String','','CallBack',@edit_continuous_tf);
    edttf.Units = 'normalized';    
    % Visualización de la función de transferencia
    panvis1 = uicontrol('Parent',tf_in_pan, 'Style','text', 'String', 'Función:', ...
      'HorizontalAlignment', 'left', 'Position', [320 5 90 30]) ;
    panvis1.Units = 'normalized';
    axes('Parent',tf_in_pan,'units','normalized','position',[0 0 1 1],'visible','off');  
    G_tex1 = text(.59,.55,'','interpreter','latex');
    % Tabla de características de la planta continua en lazo abierto
    G_stats = uitable('Parent',plant_in,'RowName',{},'ColumnName',{'Mp';'t_s';'t_p';'t_r';'MF';'MG';'e_p';'e_v';'e_a'}...
        ,'Data',zeros([1,9]),'Position',[30 20 678 41],'ForegroundColor',[0.3 0.3 0.6]);
%     G_stats.Units = 'normalized';
    % ---------------------------------------------------------------------
    plant_disc = uipanel('Parent',tt(1),'FontSize',12,'Position',[.03 .51 .95 .23]);        
    uicontrol('Parent',plant_disc,'Style','checkbox','String','Especificar', ...
                       'Value', 0, 'Units','normalized','Position',[.03 .8 .13 .2],...
                       'Callback',@ena_Tedit);
    axes('Parent',plant_disc,'Units','Normalized','position',[0 0 1 1],'visible','off');
    text(.16,.9,'\fontsize{9}{0}\selectfont $T$','interpreter','latex');    
    tf_in_disc = uipanel('Parent',plant_disc,'Title','Ingrese el periodo de muestreo',...
                        'FontSize',9,'Position',[.03 .39 .95 .45]);
    % Ingresa periodo de muestreo
    axes('Parent',tf_in_disc,'Units','Normalized','position',[0 0 1 1],'visible','off');
    text(.01,.5,'\fontsize{11}{0}\selectfont $T = $','interpreter','latex');    
    Tedit = uicontrol('Parent',tf_in_disc,'Style','edit','Position',...
        [40 10 100 30],'String','','CallBack',@edit_T,'Enable','off');
    Tedit.Units = 'normalized';    
    uicontrol('Parent',tf_in_disc, 'Style','text', 'String', ' [segundos]', ...
      'HorizontalAlignment', 'left', 'Units','normalized','Position', [.2 .05 .15 .7]);
    % Preview
    vislbl2 = uicontrol('Parent',tf_in_disc, 'Style','text', 'String', 'Función:', ...
      'HorizontalAlignment', 'left', 'Position', [320 5 90 30]) ;
    vislbl2.Units = 'normalized';
    axes('Parent',tf_in_disc,'units','normalized','position',[0 0 1 1],'visible','off');  
    G_tex2 = text(.59,.55,'','interpreter','latex');        
    % Tabla de características de la planta discreta en lazo abierto
    G_disc_stats = uitable('Parent',plant_disc,'RowName',{},'ColumnName',{'Mp';'t_s';'t_p';'t_r';'MF';'MG';'e_p';'e_v';'e_a'},...
        'Data',zeros([1,9]),'Position',[30 5 678 41],'ForegroundColor',[0.4 0.3 0.6]);
    % -------------------------- tt(2) (LGR) ------------------------------
    specs_in_pan = uipanel('Parent',tt(2),'FontSize',9,'Position',...
                    [.03 .85 .95 .13],'Title','Indique los criterios en estado transitorio');        
    axes('Parent',specs_in_pan,'Units','Normalized','position',[0 0 1 1],'visible','off');
    % Checkbox MP:                
    chkbox_lgr(1) = uicontrol('Parent',specs_in_pan,'Style','checkbox','String','', ...
    'Value', 0, 'Units','normalized','Position',[.01 .5 .02 .5],...
    'Callback',@lgr_opts_control);                                         
    text(.04,.71,'\fontsize{12}{0}\selectfont $M_p$ :','interpreter','latex');
    edt_lgr(1) = uicontrol('Parent',specs_in_pan,'Style','edit','Units','normalized',...
        'Position',[.1 .5 .1 .4],'String','');
    uicontrol('Parent',specs_in_pan,'Style','text', 'String', '[%]','HorizontalAlignment',...
        'left','Units','normalized','Position', [.205 .375 .04 .5]) ;    
    % Checkbox Zita:
    chkbox_lgr(2) = uicontrol('Parent',specs_in_pan,'Style','checkbox','String','', ...
    'Value', 0, 'Units','normalized','Position',[.01 .05 .02 .5],...
    'Callback',@lgr_opts_control);
    text(.04,.275,'\fontsize{12}{0}\selectfont $\zeta$ :','interpreter','latex');
    edt_lgr(2) = uicontrol('Parent',specs_in_pan,'Style','edit','Units','normalized',...
        'Position',[.1 .05 .1 .4],'String','');                
    % Checkbox t_s:
    chkbox_lgr(3) = uicontrol('Parent',specs_in_pan,'Style','checkbox','String','', ...
    'Value', 0, 'Units','normalized','Position',[.37 .5 .02 .5],'Fontsize',12,...
    'Callback',@lgr_opts_control);                                     
    text(.4,.71,'\fontsize{12}{0}\selectfont $t_s$ :','interpreter','latex');
    edt_lgr(3) = uicontrol('Parent',specs_in_pan,'Style','edit','Units','normalized',...
        'Position',[.46 .5 .1 .4],'String','');
    uicontrol('Parent',specs_in_pan,'Style','text', 'String', '[s]','HorizontalAlignment',...
        'left','Units','normalized','Position', [.565 .375 .04 .5]) ;
    % Checkbox w_n:
    chkbox_lgr(4) = uicontrol('Parent',specs_in_pan,'Style','checkbox','String','', ...
    'Value', 0, 'Units','normalized','Position',[.37 .05 .02 .5],'Fontsize',12,...
    'Callback',@lgr_opts_control);                                     
    text(.4,.275,'\fontsize{12}{0}\selectfont $\omega_n$ :','interpreter','latex');
    edt_lgr(4) = uicontrol('Parent',specs_in_pan,'Style','edit','Units','normalized',...
        'Position',[.46 .05 .1 .4],'String','');
    uicontrol('Parent',specs_in_pan,'Style','text', 'String', '[rad/s]','HorizontalAlignment',...
        'left','Units','normalized','Position', [.565 .0 .06 .4]) ;
    
    % Checkbox n:                             
    chkbox_lgr(5) = uicontrol('Parent',specs_in_pan,'Style','checkbox','String','', ...
    'Value', 0, 'Units','normalized','Position',[.75 .5 .02 .5],'Fontsize',12,...
    'Callback',@lgr_opts_control);                                         
    text(.78,.71,'\fontsize{12}{0}\selectfont $n$ :','interpreter','latex');

    edt_lgr(5) = uicontrol('Parent',specs_in_pan,'Style','edit','Units','normalized',...
        'Position',[.84 .5 .1 .4],'String','');
    % Criterios en estado estacionario    
    stspecs_in_pan = uipanel('Parent',tt(2),'FontSize',9,'Position',...
                    [.03 .7 .45 .13],'Title','Indique los criterios en estado estacionario');
    esslbl = uicontrol('Parent',stspecs_in_pan,'Style','text', 'String', 'Error en estado estacionario: ',...
        'HorizontalAlignment','left', 'Position', [5 35 200 25]) ;
    esslbl.Units = 'normalized';
    uicontrol('Parent',stspecs_in_pan,'Style','checkbox','String','', ...
    'Value', 0,'Position',[5 10 25 25],'Callback',@ena_lgr_ess);
    esspopup = uicontrol('Parent',stspecs_in_pan,'Style','popupmenu','Value', ...
        1,'String',{'e_p';'e_v';'e_a'},'Position',[30 5 50 30]);
    esspopup.Units = 'normalized';
    dotlbl2 = uicontrol('Parent',stspecs_in_pan,'Style','text', 'String', ': ','HorizontalAlignment',...
        'left', 'Position', [80 5 10 25]) ;
    dotlbl2.Units = 'normalized';
    edtess = uicontrol('Parent',stspecs_in_pan,'Style','edit','Position',...
        [100 8 150 30],'Enable','off');
    edtess.Units = 'normalized';
    % Función de transferencia del controlador
    c_z_pan = uipanel('Parent',tt(2),'FontSize',9,'Position',...
                    [.5 .7 .48 .13],'Title','Función de transferencia del controlador');    
    axes('Parent',c_z_pan,'units','normalized','position',[0 0 1 1],'visible','off');  
    C_tex1 = text(.1,.55,'','interpreter','latex');
    % Selección del controlador
    cont_sel = uipanel('Parent',tt(2),'FontSize',9,'Position',...
                    [.03 .5 .95 .2],'Title','Seleccione el tipo de controlador');
    ctl_lbl = uicontrol('Parent',cont_sel,'Style','text', 'String', 'Controlador: ','HorizontalAlignment',...
        'left', 'Position', [250 70 100 25]) ;
    ctl_lbl.Units = 'normalized';
    contpopup = uicontrol('Parent',cont_sel,'Style','popupmenu','Value', ...
        1,'String',{'PI','PD','PID','Compensador'},'Position',[250 70 220 30]);
    contpopup.Units = 'normalized';
%     force_chk = uicontrol('Parent',cont_sel,'Style','checkbox','String','Forzar características', ...
%     'Value', 0,'Position',[480 70 200 35]);
%     force_chk.Units = 'Normalized';
    G_o_stats = uitable('Parent',cont_sel,'RowName',{},'ColumnName',{'Mp';'t_s';'t_p';'t_r';'MF';'MG';'e_p';'e_v';'e_a'},...
        'Data',zeros([1,9]),'Position',[25 20 678 41],'ForegroundColor',[0.3 0.3 0.6]);    
    lbl_proc_state = uicontrol('Parent',cont_sel,'Style','text','FontSize',8,'ForegroundColor','red','String',...
        '','HorizontalAlignment','left','Units','Normalized','Position', [0.25 0.01 0.75 0.1]) ;    
    % -------------------------- tt(3) (Bode) -----------------------------    
    freq_specs = uipanel('Parent',tt(3),'FontSize',9,'Position',...
                    [.03 .85 .95 .11],'Title','Criterios en frecuencia');    
    % Margen de fase
    chkbox_f(1) = uicontrol('Parent',freq_specs,'Style','checkbox','String','', ...
    'Value',0,'Position',[5 10 25 25],'Callback',@f_opts_control);
    chkbox_f(1).Units = 'normalized';
    edt_f(1) = uicontrol('Parent',freq_specs,'Style','edit','Position',...
        [65 8 120 30],'String','');
    edt_f(1).Units = 'normalized';
    mf_ulabel = uicontrol('Parent',freq_specs,'Style','text', 'String', '[°]','HorizontalAlignment',...
        'left', 'Position', [200 5 75 25]) ;
    mf_ulabel.Units = 'normalized';
    % Margen de ganancia
    chkbox_f(2) = uicontrol('Parent',freq_specs,'Style','checkbox','String','', ...
    'Value',0,'Position',[255 10 25 25],'Callback',@f_opts_control);
    chkbox_f(2).Units = 'normalized';
    edt_f(2) = uicontrol('Parent',freq_specs,'Style','edit','Position',...
        [320 8 120 30],'Enable','off');
    edt_f(2).Units = 'normalized';
    mg_ulabel = uicontrol('Parent',freq_specs,'Style','text', 'String', '[dB]','HorizontalAlignment',...
        'left', 'Position', [460 5 75 25]) ;
    mg_ulabel.Units = 'normalized';
    % Frecuencia de cruce de ganancia con controlador
    chkbox_f(3) = uicontrol('Parent',freq_specs,'Style','checkbox','String','', ...
    'Value',0,'Position',[510 10 25 25],'Callback',@f_opts_control);
    chkbox_f(3).Units = 'normalized';
    axes('Parent',freq_specs,'Units','Normalized','position',[0 0 1 1],'visible','off');              
    text(.72,.4,'\fontsize{12}{0}\selectfont $\omega_g^{''}$ :'...
        ,'interpreter','latex');
    text(.37,.38,'\fontsize{9}{0}\selectfont $MG$ :'...
        ,'interpreter','latex');
    text(.04,.38,'\fontsize{9}{0}\selectfont $MF$ :'...
        ,'interpreter','latex');        
    edt_f(3) = uicontrol('Parent',freq_specs,'Style','edit','Position',...
        [580 8 120 30],'Enable','off');
    edt_f(3).Units = 'normalized';
    wg_ulabel = uicontrol('Parent',freq_specs,'Style','text', 'String', '[rad/s]','HorizontalAlignment',...
        'left', 'Position', [710 5 75 25]) ;    
    wg_ulabel.Units = 'normalized';
    % Criterios en estado estacionario    
    stspecs_in_pan = uipanel('Parent',tt(3),'FontSize',9,'Position',...
                    [.03 .7 .45 .13],'Title','Indique los criterios en estado estacionario');
    ess_label2 = uicontrol('Parent',stspecs_in_pan,'Style','text', 'String', 'Error en estado estacionario: ',...
        'HorizontalAlignment','left', 'Position', [5 35 200 25]) ;
    ess_label2.Units = 'normalized';
    chk_ess_f = uicontrol('Parent',stspecs_in_pan,'Style','checkbox','String','', ...
    'Value',0,'Position',[5 10 25 25],'Callback',@ena_frq_ess);
    chk_ess_f.Units = 'normalized';
    esspopup_f = uicontrol('Parent',stspecs_in_pan,'Style','popupmenu','Value', ...
        1,'String',{'e_p';'e_v';'e_a'},'Position',[30 5 50 30]);
    esspopup_f.Units = 'normalized';
    essdotf_lbl = uicontrol('Parent',stspecs_in_pan,'Style','text', 'String', ': ','HorizontalAlignment',...
        'left', 'Position', [80 5 10 25]) ;
    essdotf_lbl.Units = 'normalized';
    edtess_f = uicontrol('Parent',stspecs_in_pan,'Style','edit','Position',...
        [100 8 150 30],'Enable','off','String','');
    edtess_f.Units = 'normalized';
    % Función de transferencia del controlador
    c_z_pan = uipanel('Parent',tt(3),'FontSize',9,'Position',...
                    [.5 .7 .48 .13],'Title','Función de transferencia del controlador');    
    axes('Parent',c_z_pan,'units','normalized','position',[0 0 1 1],'visible','off');  
    C_tex2 = text(.1,.55,'','interpreter','latex');
    % Selección del controlador
    cont_sel = uipanel('Parent',tt(3),'FontSize',9,'Position',...
                    [.03 .5 .95 .2],'Title','Seleccione el tipo de controlador');
    contpopup_f = uicontrol('Parent',cont_sel,'Style','popupmenu','Value', ...
        1,'String',{'Compensador en atraso','Compensador en adelanto','Compensador Atraso-Adelanto'},...
        'Position',[240 70 220 30]);
    contpopup_f.Units = 'normalized';
%     force_chk_f = uicontrol('Parent',cont_sel,'Style','checkbox','String','Forzar características', ...
%     'Value', 0,'Position',[480 70 200 35]);
%     force_chk_f.Units = 'Normalized';
    G_o_stats_frq = uitable('Parent',cont_sel,'RowName',{},'ColumnName',{'Mp';'t_s';'t_p';'t_r';'MF';'MG';'e_p';'e_v';'e_a'},...
        'Data',zeros([1,9]),'Position',[25 20 678 41],'ForegroundColor',[0.3 0.3 0.6]);        
    lbl_proc_state_f = uicontrol('Parent',cont_sel,'Style','text','FontSize',8,'String',...
        '','HorizontalAlignment','left','Units','Normalized','Position', [0.25 0.01 0.75 0.1]) ;    
%     Inicializa variables globales
    zoom_on = 0;
%     Planta y caracterísitcas
    G = tf(1); 
    G_data = get(G);    
%     Etiquetas LaTeX
    G_tex1.String = tf_to_latex(G_data,'G(s)');
    G_open = G;
    G_plotted = G;
    T = 1;
    G_disc = tf(1);
    G_tex2.String = tf_to_latex(get(G_disc),'G(z)');
    C_lgr = tf(1);
    C_tex1.String = tf_to_latex(get(C_lgr),'C(z)');
    G_w = tf(1);
    C_frq = tf(1);
    C_tex2.String = tf_to_latex(get(C_frq),'C(z)');
%----------------------------------------------EMPIEZAN ASPECTOS FUNCIONALES----------------------------------------------
    
    function [] = edit_continuous_tf(H,~)                                   
        try
            % Obtiene la función de transferencia y actualiza las etiquetas
            % LaTeX continuas y discretas            
            s = tf('s');
            G = eval(get(H,'string'));
            G_data = get(G);                        
            G_tex1.String = tf_to_latex(G_data,'G(s)');
            % Obtiene el periodo de muestreo apropiado
            T = calc_Ts(G);
            Tedit.String = num2str(T);
            G_disc = minreal(c2d(G,T));
            G_tex2.String = tf_to_latex(get(G_disc),'G(z)');            
            % Actualiza el gráfico            
            update_focus();            
            % Obtiene tabla de características de la función continua
            G_stats.Data = get_response_data(G);
            % Obtiene tabla de características de la función discreta
            G_disc_stats.Data = get_response_data(G_disc);
            % Actualiza controladores
            if C_lgr.Ts ~= T
%                 design_lgr_cont();
                lbl_proc_state.String = '........... Controlador desactualizado, rediseñe ...........';                            
                lbl_proc_state.ForegroundColor = 'blue';
            end
            if C_frq.Ts ~= T
                lbl_proc_state_f.String = '........... Controlador desactualizado, rediseñe ...........';                            
                lbl_proc_state_f.ForegroundColor = 'blue';
%                 design_frq_cont();                
            end
        catch
            warn('Posible error con: \n  - Función de transferencia \n  - Periodo de Muestreo \nPor favor verificar')
        end        
    end   
    
    function [] = update_focus(~,~)
        switch t_idx
            case 1
                G_open = G;                
                update_loop_conf();                
                return
            case 2
                G_open = C_lgr*G_disc;                
                update_loop_conf();
                return
            case 3
                G_open = C_frq*G_disc;                
                update_loop_conf();
                return
        end
    end

    function [] = update_loop_conf(~,~)        
        if looppopup.Value == 2
            G_plotted = feedback(G_open,1);       
        else
            G_plotted = G_open;
        end        
        update_plot();
    end        

    function [] = update_plot(~,~)                
        axes(plot_axs);                
        t = calc_responses(G_plotted);
        delay = G_data.OutputDelay;
        switch plotpopup.Value            
            case 1
                if delay > 0                    
                    rlocus(pade(G_plotted,3));
                else
                    rlocus(G_plotted);
                end
                title('')
                grid off
            case 2                                
                if t_idx ~=1
                    margin(G);
                    hold on                                
                    margin(G_plotted);
                    hold off;
                    legend('Sin Control','Con Control','Location','best')
                else
                    margin(G_plotted);
                end                                                
                xlabel('Frecuencia')
                title('')                    
                grid on
            case 3
                p = timeoptions;
                p.RiseTimeLimits = [0 0.99];
                p.SettleTimeThreshold = 0.02;
                step(G_plotted,p);                
                xlabel('Tiempo')
                ylabel('Amplitud')
                title('')
                grid on                
%                 setoptions(plt,plt_opts)
            case 4
                lsim(G_plotted,t,t);
                xlabel('Tiempo')
                ylabel('Amplitud')
                title('')
                grid on
            case 5
                lsim(G_plotted,t.^2,t);
                xlabel('Tiempo')
                ylabel('Amplitud')
                title('')
                grid on
        end        
    end

    function [] = ena_Tedit(H,~)
        if H.Value == 1
            Tedit.Enable = 'on';
        else
            Tedit.Enable = 'off';
        end
    end

    function [] = design_controller(~,~)
        switch t_idx
            case 2
                design_lgr_cont();
            case 3
                design_frq_cont();
        end
    end

    function [] = ena_lgr_ess(H,~)
        if H.Value == 1
            edtess.Enable = 'on';            
        else
            edtess.Enable = 'off';
        end
    end

    function [] = ena_frq_ess(H,~)
        if H.Value == 1
            edtess_f.Enable = 'on';            
        else
            edtess_f.Enable = 'off';
        end
    end

    function [] = lgr_opts_control(~,~)
        % Mp, zita, ts, wn, n
        chk_state = [chkbox_lgr(1).Value, chkbox_lgr(2).Value, chkbox_lgr(3).Value,...
                     chkbox_lgr(4).Value chkbox_lgr(5).Value];
        switch sum(chk_state)                            
            case 0
                chkbox_lgr(1).Enable = 'on';
                chkbox_lgr(2).Enable = 'on';
                chkbox_lgr(3).Enable = 'on';
                chkbox_lgr(4).Enable = 'on';
                chkbox_lgr(5).Enable = 'on';
                edt_lgr(1).Enable = 'on';
                edt_lgr(2).Enable = 'on';
                edt_lgr(3).Enable = 'on';
                edt_lgr(4).Enable = 'on';
                edt_lgr(5).Enable = 'on';
            case 1
                [~,idx] = find(chk_state);
                switch idx
                    case 1
                        chkbox_lgr(2).Enable = 'off';
                        edt_lgr(2).Enable = 'off';                        
                        chkbox_lgr(1).Enable = 'on';                        
                        chkbox_lgr(3).Enable = 'on';
                        chkbox_lgr(4).Enable = 'on';
                        chkbox_lgr(5).Enable = 'on';
                        edt_lgr(1).Enable = 'on';                        
                        edt_lgr(3).Enable = 'on';
                        edt_lgr(4).Enable = 'on';
                        edt_lgr(5).Enable = 'on';
                    case 2
                        chkbox_lgr(1).Enable = 'off';
                        edt_lgr(1).Enable = 'off';                                                
                        chkbox_lgr(2).Enable = 'on';
                        chkbox_lgr(3).Enable = 'on';
                        chkbox_lgr(4).Enable = 'on';
                        chkbox_lgr(5).Enable = 'on';                        
                        edt_lgr(2).Enable = 'on';
                        edt_lgr(3).Enable = 'on';
                        edt_lgr(4).Enable = 'on';
                        edt_lgr(5).Enable = 'on';
                    otherwise
                        chkbox_lgr(1).Enable = 'on';
                        chkbox_lgr(2).Enable = 'on';
                        chkbox_lgr(3).Enable = 'on';
                        chkbox_lgr(4).Enable = 'on';
                        chkbox_lgr(5).Enable = 'on';
                        edt_lgr(1).Enable = 'on';
                        edt_lgr(2).Enable = 'on';
                        edt_lgr(3).Enable = 'on';
                        edt_lgr(4).Enable = 'on';
                        edt_lgr(5).Enable = 'on';
                end
            case 2
                [~,idx] = find(chk_state);                
                for i=1:length(chkbox_lgr)
                    if i ~= idx(1) && i ~= idx(2)
                        chkbox_lgr(i).Enable = 'off';
                        edt_lgr(i).Enable = 'off';
                    end
                end
        end
    end

    function [] = f_opts_control(~,~)
        % Mf, Mg, w_gp
        chk_state = [chkbox_f(1).Value, chkbox_f(2).Value, chkbox_f(3).Value];
        switch sum(chk_state)                            
            case 0
                chkbox_f(1).Enable = 'on';
                chkbox_f(2).Enable = 'on';
                chkbox_f(3).Enable = 'on';                
                edt_f(1).Enable = 'on';
                edt_f(2).Enable = 'on';
                edt_f(3).Enable = 'on';                
            case 1
                [~,idx] = find(chk_state);
                switch idx
                    case 1
                        chkbox_f(1).Enable = 'on';
                        chkbox_f(2).Enable = 'on';
                        chkbox_f(3).Enable = 'off';
                        edt_f(1).Enable = 'on';
                        edt_f(2).Enable = 'on';
                        edt_f(3).Enable = 'off';                                                                    
                    case 2
                        chkbox_f(1).Enable = 'on';
                        chkbox_f(2).Enable = 'on';
                        chkbox_f(3).Enable = 'on';                
                        edt_f(1).Enable = 'on';
                        edt_f(2).Enable = 'on';
                        edt_f(3).Enable = 'on';
                    case 3
                        chkbox_f(1).Enable = 'off';
                        chkbox_f(2).Enable = 'on';
                        chkbox_f(3).Enable = 'on';
                        edt_f(1).Enable = 'off';
                        edt_f(2).Enable = 'on';
                        edt_f(3).Enable = 'on';
                end
            case 2                
                [~,idx] = find(chk_state);           
                for i=1:length(chkbox_f)
                    if i ~= idx(1) && i ~= idx(2)
                        chkbox_f(i).Enable = 'off';
                        edt_f(i).Enable = 'off';
                    end
                end
        end
    end    
    
    function [] = edit_T(H,~)
        try
            T = eval(get(H,'string'));
            G_disc = c2d(G,T);            
            G_tex2.String = tf_to_latex(get(G_disc),'G(z)');
            % Obtiene tabla de características de la función discreta
            G_disc_stats.Data = get_response_data(G_disc);
            if C_lgr.Ts ~= T
%                 design_lgr_cont();
                lbl_proc_state.String = '........... Controlador desactualizado, rediseñe ...........';                            
                lbl_proc_state.ForegroundColor = 'blue';
            end
            if C_frq.Ts ~= T
                lbl_proc_state_f.String = '........... Controlador desactualizado, rediseñe ...........';                            
                lbl_proc_state_f.ForegroundColor = 'blue';
%                 design_frq_cont();                
            end
        catch
            warn('Error con: \n  - Periodo de muestreo \n Por favor verificar')
        end
    end

    function [] = next_tab(~,~)
        if t_idx == 3
            t_idx = 1;            
            design.Enable = 'off';
        else
            t_idx = t_idx + 1;
            design.Enable = 'on';
        end
        tgroup.SelectedTab = tt(t_idx);
        update_focus();
    end

    function [] = tabChanged(~,edata)
        tabName = edata.NewValue.Title;
        switch tabName
            case 'Planta'
                t_idx = 3;
                next_tab();
            case 'Controlador por LGR'
                t_idx = 1;
                next_tab();
            case 'Controlador por frecuencia'
                t_idx = 2;
                next_tab();
        end
    end    

    function [] = zoom_onoff(~,~)
        zoom_on = ~zoom_on;
        if zoom_on
            zoom on;
            zoom_btn.String = 'Zoom Off';
        else
            zoom off;
            zoom_btn.String = 'Zoom On';
        end
    end    
    
    function design_lgr_cont()
        try                                                
            lbl_proc_state.String = '........... DISEÑANDO ...........';
            lbl_proc_state.ForegroundColor = 'blue';
            drawnow
            sel_params = [num2str(chkbox_lgr(1).Value) num2str(chkbox_lgr(2).Value) num2str(chkbox_lgr(3).Value) ...
                num2str(chkbox_lgr(4).Value) num2str(chkbox_lgr(5).Value)];                        
            switch sel_params
                case '10100'                    
                    args = {'Mp',str2double(edt_lgr(1).String),...
                            't_s',str2double(edt_lgr(3).String)};                   
                case '01100'
                    args = {'zita',str2double(edt_lgr(2).String),...
                            't_s',str2double(edt_lgr(3).String)};                  
                case '10010'
                    args = {'Mp',str2double(edt_lgr(1).String),...
                            'w_n',str2double(edt_lgr(4).String)};                   
                case '01010'
                    args = {'zita',str2double(edt_lgr(2).String),...
                            'w_n',str2double(edt_lgr(4).String)};
                case '10001'
                    args = {'Mp',str2double(edt_lgr(1).String),...
                            'n',str2double(edt_lgr(5).String)};
                case '01001'
                    args = {'zita',str2double(edt_lgr(2).String),...
                            'n',str2double(edt_lgr(5).String)};
                case '00110'
                    args = {'t_s',str2double(edt_lgr(3).String),...
                            'w_n',str2double(edt_lgr(4).String)};
                case '00101'
                    args = {'t_s',str2double(edt_lgr(3).String),...
                            'n',str2double(edt_lgr(5).String)};
                otherwise
                    lbl_proc_state.String = '*** Condiciones insuficientes o erróneas para diseño ***';
                    lbl_proc_state.ForegroundColor = 'red';
                    C_lgr = tf(1);                    
                    stats_ol = get_response_data(C_lgr*G_disc);
                    stats_cl = get_response_data(feedback(C_lgr*G_disc,1));
                    G_o_stats.Data = stats_cl;
                    G_o_stats.Data(5:9) = stats_ol(5:9);
                    C_tex1.String = tf_to_latex(get(C_lgr),'C(z)');            
                    return
            end            
            switch contpopup.Value
                case 1
                    [C_lgr, ok, msg] = PI(G_disc,sel_params,args,T);
                case 2
                    [C_lgr, ok, msg] = PD(G_disc,sel_params,args,T);
                case 3
                    [C_lgr, ok, msg] = PID(G_disc,sel_params,args,T);
                case 4
                    [C_lgr, ok, msg] = compensator(G_disc,sel_params,args,T);                
            end
            if isequal(edtess.Enable,'on')
                switch esspopup.Value
                    case 1
                        ess_type = 'ep';                             
                    case 2                    
                        ess_type = 'ev';                                        
                    case 3                    
                        ess_type = 'ea';                                                            
                end
                ess_wntd = str2double(edtess.String);
                [C_ess, ok_ess] = ess_compensator(G_disc*C_lgr,T,ess_type,ess_wntd);
                ok = ok & ok_ess;
                C_lgr = C_ess*C_lgr;
            end
            if ~ok
                if ~isequal(msg,'')
                    lbl_proc_state.String = ['*** ' msg ' ***'];
                else
                    lbl_proc_state.String = '*** No fue posible cumplir con las especificaciones ***'; 
                end                
                lbl_proc_state.ForegroundColor = 'red';
            else
                lbl_proc_state.String = '¡DISEÑO TERMINADO!';
                lbl_proc_state.ForegroundColor = [0.2 0.9 0.1];
            end
            stats_ol = get_response_data(C_lgr*G_disc);
            stats_cl = get_response_data(feedback(C_lgr*G_disc,1));
            G_o_stats.Data = stats_cl;
            G_o_stats.Data(5:9) = stats_ol(5:9);
            C_tex1.String = tf_to_latex(get(C_lgr),'C(z)');            
            update_focus();
        catch
            warn('Error con: \n  - Especificaciones \n Por favor verificar')
        end
    end                

    function design_frq_cont()
        try                            
            lbl_proc_state_f.String = '........... DISEÑANDO ...........';
            lbl_proc_state_f.ForegroundColor = 'blue';
            drawnow
            sel_params = [num2str(chkbox_f(1).Value) num2str(chkbox_f(2).Value) num2str(chkbox_f(3).Value)];                        
            switch sel_params
                case '001'
                    args = {'w_gp',str2double(edt_f(3).String)};                    
%                 case '010'
%                     args = {'MG',str2double(edt_f(2).String)};                    
                case '011'
                    args = {'MG',str2double(edt_f(2).String),...
                            'w_gp',str2double(edt_f(3).String)};
                case '100'
                    args = {'MF',str2double(edt_f(1).String)};                    
                case '110'
                    args = {'MF',str2double(edt_f(1).String),...
                            'MG',str2double(edt_f(2).String)};                                                  
                otherwise
                    lbl_proc_state_f.String = '*** Condiciones insuficientes o erróneas para diseño ***';
                    lbl_proc_state_f.ForegroundColor = 'red';
                    C_frq = tf(1);                    
                    stats_ol = get_response_data(C_frq*G_disc);
                    stats_cl = get_response_data(feedback(C_frq*G_disc,1));
                    G_o_stats_frq.Data = stats_cl;
                    G_o_stats_frq.Data(5:9) = stats_ol(5:9);
                    C_tex2.String = tf_to_latex(get(C_frq),'C(z)');            
                    return
            end            
            if isequal(edtess_f.Enable,'on')
                switch esspopup_f.Value
                    case 1
                        args{length(args)+1} = 'ep';                             
                    case 2                    
                        args{length(args)+1} = 'ev';                             
                    case 3                    
                        args{length(args)+1} = 'ea';                             
                end
                args{length(args)+1} = str2double(edtess_f.String);
            end            
            G_w = d2c(G_disc,'tustin');
            switch contpopup_f.Value
                case 1                                
                    [C_w, ok, msg] = frq_lag_compensator(G_w,sel_params,args);          
                case 2
                    [C_w, ok, msg] = frq_lead_compensator(G_w,sel_params,args);          
                case 3
                    [C_w, ok, msg] = frq_laglead_compensator(G_w,sel_params,args);          
            end
            if ~ok
                if ~isequal(msg,'')
                    lbl_proc_state_f.String = ['*** ' msg ' ***'];
                else
                    lbl_proc_state_f.String = '*** No fue posible cumplir con las especificaciones ***'; 
                end                
                lbl_proc_state_f.ForegroundColor = 'red';
            else
                lbl_proc_state_f.String = '¡DISEÑO TERMINADO!';
                lbl_proc_state_f.ForegroundColor = [0.2 0.9 0.1];
            end            
            C_frq = c2d(C_w,T,'tustin');
%             stats_ol_w = get_response_data(C_w*G_w);
            stats_ol = get_response_data(C_frq*G_disc);       
            stats_cl = get_response_data(feedback(C_frq*G_disc,1));       
            G_o_stats_frq.Data = stats_cl;
            G_o_stats_frq.Data(5:6) = stats_ol(5:6);
            G_o_stats_frq.Data(5:9) = stats_ol(5:9);
            C_tex2.String = tf_to_latex(get(C_frq),'C(z)');   
            update_focus();            
        catch
            warn('Error con: \n  - Especificaciones \n Por favor verificar')
        end
    end
end

function [t,y_p] = calc_responses(G)       
    [~,t] = step(G);
    if G.Ts == 0
        t = linspace(0,t(end),1000); 
    else        
        t = 0:G.Ts:t(end);
    end    
    y_p = step(G,t);    
end

function [T] = calc_Ts(sys)
    sys_data = get(sys);
    sys_cl = feedback(sys,1);
    poles_cl = pole(pade(sys_cl,3));
    delay = sys_data.OutputDelay;
    if sum((real(poles_cl) > 0) & (imag(poles_cl) == 0)) >= 1
        T_ideal = 1e-4;
    elseif sum((real(poles_cl) >= 0) & (imag(poles_cl) ~= 0)) >= 1
        unstable_poles = poles_cl(real(poles_cl) >= 0);
        max_w_d = max(imag(unstable_poles));
        T_d = 2*pi/max_w_d;
%         T_ideal = (T_d/12) + ((T_d/8) - (T_d/12))/2;
        T_ideal = T_d/12;
    else
        step_data = stepinfo(sys_cl,'RiseTimeLimits',[0 0.99]);
        if step_data.RiseTime ~= 0
            t_r = step_data.RiseTime;
        else
            t_r = step_data.PeakTime;
        end        
        t_r = t_r - delay;
%         T_ideal = (t_r/12) + ((t_r/8) - (t_r/12))/2;    
        T_ideal = t_r/12;
    end    
    if delay > 0        
        if T_ideal < 1
            delta_t = 1/round(1/T_ideal);
            t = 1:delay*delta_t:delay;
        else
            t = 1:delay;
        end
        dividers = t(mod(delay,t) == 0);
        x = abs(dividers-T_ideal);        
        T = dividers(x==min(x));
    else        
        T = T_ideal;
    end
end

% 0.38/(80*s+1)

function response_data = get_response_data(G)    
    [t,y_p] = calc_responses(G);    
    step_data = stepinfo(y_p,t,'RiseTimeLimits',[0 0.99],'SettlingTimeThreshold',0.02);
    Mp = step_data.Overshoot;
    t_s = step_data.SettlingTime;
    t_p = step_data.PeakTime;
    t_r = step_data.RiseTime;
    if G.Ts > 0
        T = G.Ts;
        z = tf('z',T);
        k_p = evalfr(minreal(G),1);
        k_v = evalfr(minreal((z-1)*G/(z*T)),1);
        k_a = evalfr(minreal((z-1)^2*G/(z*T)^2),1);
        e_p = 1/(1+k_p);
        e_v = 1/k_v;
        e_a = 1/k_a;
        [Mg,Mf] = margin(d2c(G,'tustin'));
    else
        s = tf('s');
        k_p = evalfr(minreal(G),0);
        k_v = evalfr(minreal(s*G),0);
        k_a = evalfr(minreal(s^2*G),0);
        e_p = 1/(1+k_p);
        e_v = 1/k_v;
        e_a = 1/k_a;
        [Mg,Mf] = margin(G);
    end    
    response_data = [Mp t_s t_p t_r Mf Mg e_p e_v e_a];    
    response_data = fix(response_data*10000)/10000;
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
    fontsize_0 = 12 + floor(font_dcount * (font_dcount < 0));
    font_dcount = (50 - length(G_tex))/10;    
    fontsize_1 = 20 + ceil(font_dcount * (font_dcount < 0));
    if fontsize_1 < 12
        fontsize_1 = 12;
    end
    G_tex = ['\fontsize{' num2str(fontsize_0) '}{0}\selectfont $' name ' =$ \fontsize{' num2str(fontsize_1) '}{0}\selectfont $' G_tex '$'];
end

function [] = warn(str)
    d = dialog('units','normalized','Position',[0.4 0.4 0.3 0.2],'Name','Error');
    uicontrol('Parent',d,...
               'Style','text',...
               'Units','normalized',...
               'Position',[0.25 0.25 0.5 0.5],...
               'String',sprintf(str));

    uicontrol('Parent',d,...
               'Units','normalized',...
               'Position',[0.425 0.1 0.15 0.2],...
               'String','Ok',...
               'Callback','delete(gcf)');
end

function [C, ok,msg] = PI(G,sel_params,args,T)
    ok = false;        
    perf = [false false];    
    n_iter = 0;
    args_original = args;
    controllers = [];
    costo = [];
    msg = '';
    while ~ok
        if n_iter == 50
            [~,idx] = min(costo);
            C = controllers(idx);
            break;
        end
        z_d = get_z_poles(sel_params,args,T);        
        C_angle = calc_C_angle(G,z_d);
        if C_angle >= 0
            C = tf(1);            
            msg = 'Controlador no disponible para estas características';
            return
        end
        z = tf('z',T);
        pole = z - 1;
        pole_angle = rad2deg(angle(evalfr(pole,z_d)));
        zero_angle = C_angle + pole_angle;
        a = real(z_d) - imag(z_d)/tan(deg2rad(zero_angle));
        CG = (((z-a)/(z-1)) * G);
        K = 1/abs(evalfr(CG,z_d));
        C = K*(z-a)/(z-1);
        [args, perf, error] = eval_criterions(C*G,args,args_original,perf);        
        ok = perf(1) & perf(2);
        costo = [costo, error];
        controllers = [controllers, C];
        n_iter = n_iter + 1;        
    end
end

function [C, ok, msg] = PID(G,sel_params,args,T)
    ok = false;        
    perf = [false false];    
    n_iter = 0;
    args_original = args;
    controllers = [];
    costo = [];
    msg = '';
    while ~ok
        if n_iter == 50           
            [~,idx] = min(costo);
            C = controllers(idx);
            break;
        end
        z_d = get_z_poles(sel_params,args,T);
        C_angle = calc_C_angle(G,z_d);   
        z = tf('z',T);
        pid_pole = z - 1;
        pole_angle = rad2deg(angle(evalfr(pid_pole,z_d)));
        zeros_ang = C_angle + pole_angle + rad2deg(angle(z_d));    
        a_weight = 0.98;
        b_weight = 0.02;                
        for i=1:12
            a_ang = zeros_ang*a_weight;
            b_ang = zeros_ang*b_weight;        
            a = real(z_d) - imag(z_d)/tan(deg2rad(a_ang));
            b = real(z_d) - imag(z_d)/tan(deg2rad(b_ang));
            CG = (((z-a)*(z-b)/(z*(z-1))) * G);
            K = 1/abs(evalfr(CG,z_d));        
            C = K*(z-a)*(z-b)/(z*(z-1));
            poles = pole(feedback(C*G,1));
            a_weight = 0.98 - 0.04*i;
            b_weight = 0.02 + 0.04*i;
            if sum(abs(poles) > 1) == 0                 
                break
            end
        end
        [args, perf, error] = eval_criterions(C*G,args,args_original,perf);        
        ok = perf(1) & perf(2);
        costo = [costo, error];
        controllers = [controllers, C];
    end
end

function [C, ok, msg] = PD(G,sel_params,args,T)
    ok = false;        
    perf = [false false];    
    n_iter = 0;
    args_original = args;
    controllers = [];
    costo = [];
    msg = '';
    while ~ok
        if n_iter == 50     
            [~,idx] = min(costo);
            C = controllers(idx);
            break;            
        end
        z_d = get_z_poles(sel_params,args,T);                
        C_angle = calc_C_angle(G,z_d);
        if C_angle <= 0
            C = tf(1);            
            msg = 'Controlador no disponible para estas características';
            return
        end
        z = tf('z',T);    
        pole_angle = rad2deg(angle(z_d));
        zero_ang = C_angle + pole_angle;            
        a = real(z_d) - imag(z_d)/tan(deg2rad(zero_ang));    
        CG = (((z-a)/z) * G);
        K = 1/abs(evalfr(CG,z_d));
        C = K*((z-a)/z);
        [args, perf, error] = eval_criterions(C*G,args,args_original,perf);        
        ok = perf(1) & perf(2);
        costo = [costo, error];
        controllers = [controllers, C];
        n_iter = n_iter + 1;        
    end
end

function C_angle = calc_C_angle(G, z_d)    
    % Cálculo del ángulo de la planta en z_d
    G_z_d = evalfr(G,z_d);
    G_angle = rad2deg(angle(G_z_d));
    if abs(G_angle) > 180
        G_angle = -sign(G_angle)*180 + G_angle;    
    end
    % Cálculo del ángulo que debe aportar el controlador
    C_angle = sign(G_angle)*180 - G_angle;
end

function K = calc_k_ess(G,type,ess_wntd)    
    s = tf('s');
    poles = pole(G);
    order = sum(abs(poles)<1e-12);
    K = 1;
    switch type
        case 'ep'                                                
            k_wntd = 1/ess_wntd - 1;
            k_curr = evalfr(G,0);            
            if k_curr >= k_wntd     
                K = 1;
                return
            else
                if k_wntd ~= Inf
                    K = k_wntd/k_curr;     
                else                    
                    K = 1/s;
                end
            end               
        case 'ev'
            if order == 0
                K = 1/s;
            end
            k_wntd = 1/ess_wntd;
            k_curr = evalfr(minreal(s*K*G),0);
            if k_curr >= k_wntd                
                return
            else                
                if k_wntd ~= Inf                                                                            
                    K = K*k_wntd/k_curr;
                else                    
                    K = K*1/s;
                end
            end                
        case 'ea'   
            if order == 0
                K = 1/s^2;
            elseif order == 1
                K = 1/s;
            end
            k_wntd = 1/ess_wntd;
            k_curr = evalfr(minreal(s^2*K*G),0);            
            if k_curr >= k_wntd                
                return
            else
                if k_wntd ~= Inf
                    K = K*k_wntd/k_curr;
                else
                    K = K*1/s;
                end
            end                                
    end    
end

function [C, ok, msg] = compensator(G,sel_params,args,T)
    ok = false;        
    perf = [false false];    
    n_iter = 0;
    args_original = args;
    controllers = [];
    costo = [];
    msg = '';
    while ~ok
        if n_iter == 50     
            [~,idx] = min(costo);
            C = controllers(idx);
            break;
        end
        z_d = get_z_poles(sel_params,args,T);
        C_angle = calc_C_angle(G,z_d);   
        z = tf('z',T);
        a_angle = 20;
        pole_angle = a_angle - C_angle;
        a = -imag(z_d)/tan(deg2rad(20)) + real(z_d);
        b = -imag(z_d)/tan(deg2rad(pole_angle)) + real(z_d);
        CG = ((z-a)/(z-b))*G;
        K = 1/abs(evalfr(CG,z_d));
        C = K * (z-a)/(z-b);
        [args, perf, error] = eval_criterions(C*G,args,args_original,perf);        
        ok = perf(1) & perf(2);
        costo = [costo, error];
        controllers = [controllers, C];
        n_iter = n_iter + 1;        
    end
end

function [C, ok] = ess_compensator(G,T,type,ess_wntd)
    ok = true;
    z = tf('z',T);
    G_type = sum(abs(pole(G)) == 1);
    switch type
        case 'ep'
            k_wntd = 1/ess_wntd - 1;
            k_curr = evalfr(G,1);
            if k_curr >= k_wntd
                C = tf(1);
                return
            else
                if k_wntd ~= Inf
                    a = -(k_curr*0.01)/k_wntd + 1;
                else
                    ok = false;
                    C = tf(1);
                    return                    
                end
            end
        case 'ev'
            if G_type <1                                
                C = ess_compensator(G,T,'ep',ess_wntd);                
                ok = false;
                return
            end
            k_wntd = 1/ess_wntd;
            k_curr = evalfr(minreal((z-1)*G/(z*T)),1);
            if k_curr >= k_wntd
                C = tf(1);
                return
            else
                if k_wntd ~= Inf
                    a = -(k_curr*0.01)/k_wntd + 1;
                else
                    ok = false;
                    C = tf(1);
                    return                    
                end
            end
        case 'ea'
            if G_type < 2                
                if G_type == 1
                    C = ess_compensator(G,T,'ev',ess_wntd);
                elseif G_type == 0
                    C = ess_compensator(G,T,'ep',ess_wntd);
                end
                ok = false;
                return
            end
            k_wntd = 1/ess_wntd;
            k_curr = evalfr(minreal((z-1)^2*G/(z*T)^2),1);
            if k_curr >= k_wntd
                C = tf(1);
                return
            else
                if k_wntd ~= Inf
                    a = -(k_curr*0.01)/k_wntd + 1;
                else
                    ok = false;
                    C = tf(1);
                    return                    
                end
            end
    end
    C = (z-0.99)/(z-a);
end

function [args, ok, error] = eval_criterions(H,args,args_original,perf)  
    [y, t] = step(feedback(H,1));
    step_data = stepinfo(y,t,'SettlingTimeThreshold',0.02);
    peak_error = 0;
    time_error = 0;
    time_ok = true;
    peak_ok = true;
    if isequal(args{1},'Mp')
        if step_data.Overshoot > args_original{2}        
            peak_ok = false;
            args{2} = args{2} - 0.4*args{2};
            if perf(2) && isequal(args{2},'t_s')
                args{4} = args{4} + 0.2*args{4};
            end
        end
        peak_error = abs((args_original{2} - step_data.Overshoot))/args_original{2};
    end
    if isequal(args{3},'t_s')
        if step_data.SettlingTime > args_original{4}        
            time_ok = false;
            args{4} = args{4} - 0.004*args{4};
        end
        time_error = abs((args_original{4} - step_data.SettlingTime))/args_original{4};
    end
    error = peak_error + time_error;
    ok = [peak_ok time_ok];        
end

function [C, ok, msg] = frq_lag_compensator(G,sel_params,args)     
    s = tf('s');
    K = 1;
    msg = '';
    ok = false;        
    if args{end-1}(1) == 'e'
        K = calc_k_ess(minreal(G),args{end-1},args{end});
        G = G*K;        
    end        
    
    switch sel_params
        case '001'    
            w_c = args{2};
            C = K*set_wg(G,w_c);
        case '010'            
            C = K*set_MG(G,args{2});
        case '011'
            w_c = args{4};
            C_att = set_wg(G,w_c);            
            C_mg = set_MG(C_att*G,args{2});
            C = K*C_att*C_mg;
        case '100'
            C = K*set_MF(G,args{2});
        case '110'
            C_mf = set_MF(G,args{2});
            C_mg = set_MG(C_mf*G,args{4});
            C = K*C_mf*C_mg;
    end
    
    function C_mf = set_MF(sys,MF)
        ok = false;
        [~,Pm,~,~] = margin(sys);
        if Pm >= MF
            C_mf = tf(1);
            ok = true;
            return
        end
        % Para forzar        
        n_iter = 0;        
        controllers = [];
        costo = [];
        % Cálculo
        [mag,phase,w] = bode(sys);    
        mag = 20*log10(squeeze(mag));
        phase = squeeze(phase);        
        Pm_wtd = MF;    
        while ~ok
            if n_iter == 50
                [~,idx] = min(costo);
                C_mf = controllers(idx);
                break;            
            end
            if min(phase) > 0
                phase_pt = Pm_wtd + 180 + 6;
                x = abs(phase-phase_pt);
            else
                phase_pt = Pm_wtd - 180 + 6;
                x = abs(phase-phase_pt);
            end
            if phase_pt < min(phase) || phase_pt > max(phase)
                C_mf = tf(1);
                msg = 'No fue posible cumplir la condición de MF';
                return
            end
            w_gp = w(x == min(x));
            if length(w_gp) > 1
                w_gp = w_gp(1);        
            end                 
            a = 10^(-mag(w == w_gp)/20);
            T1 = 10/(a*w_gp);
            C_mf = (a*T1*s + 1)/(T1*s + 1);
            [~,Pm,~,~] = margin(C_mf*sys);
            if Pm < Pm_wtd
                Pm_wtd = Pm_wtd + 0.01*MF;
                error = abs(Pm_wtd - Pm)/Pm_wtd;
                costo = [costo, error];
                controllers = [controllers, C_mf];
                n_iter = n_iter + 1;
            else
                ok = true;
            end
        end
    end
    
    function C_wgp = set_wg(sys,w_c)   
        ok = false;
        [~,~,w_g,~] = margin(sys);
        if w_g >= w_c
            C_wgp = tf(1);
            ok = true;
            return
        end
        % Cálculo
        [mag,~,w] = bode(sys);    
        mag = 20*log10(squeeze(mag));        
        x = abs(w-w_c);
        w_c = w(x == min(x));
        a = 10^(-mag(w == w_c)/20);
        T1 = 10/(a*w_c);
        C_wgp = (a*T1*s + 1)/(T1*s + 1);
    end

    function C_mg = set_MG(sys,MG)        
        ok = false;
        [Gm,~,~,~] = margin(sys);
        if Gm >= MG
            C_mg = tf(1);
            ok = true;
            return
        end
        [mag,phase,w] = bode(sys);
        mag = 20*log10(squeeze(mag));
        phase = squeeze(phase);
        Gm_wtd = MG;        
        if -Gm_wtd < min(mag) || -Gm_wtd > max(mag)
            C_mg = tf(1);
            msg = 'No fue posible cumplir la condición de MG';
            return
        end                
        x = abs(mag-(-Gm_wtd));
        w_phip = w(x == min(x));
        if length(w_phip) > 1
            w_phip = w_phip(1);        
        end
        
        if min(phase) > 0
            phi_min = phase(w == w_phip) - 180;                  
        else
            phi_min = phase(w == w_phip) + 180;
        end
        
        if phi_min < 0
            C_mg = tf(1);
            msg = 'No fue posible cumplir la condición de MG';
            return
        end        
        a = (1 - sin(deg2rad(phi_min)))/(1 + sin(deg2rad(phi_min)));
        x = abs(mag-(-Gm_wtd+10*log10(a)));        
        w_phip = w(x == min(x));
        T1 = 1/(w_phip * sqrt(a));
        C_mg = (a*T1*s + 1)/(T1*s + 1);        
    end   
end

function [C, ok, msg] = frq_laglead_compensator(G,sel_params,args)    
    s = tf('s');
    K = 1;
    msg = '';
    ok = false;        
    if args{end-1}(1) == 'e'
        K = calc_k_ess(minreal(G),args{end-1},args{end});
        G = G*K;        
    end        
    
    switch sel_params
        case '001'    
            w_c = args{2};
            C_lag = set_wg_lag(G,w_c);
            C_lead = set_wg_lead(w_c);
            C = K*C_lag*C_lead;
            [~,~,wg_f,~] = margin(C*G/K);            
            if wg_f >= w_c
                ok = true;
            else
                ok = false;
            end
%         case '010'            
        case '011'
            w_c = args{4};
            C_lag = set_wg_lag(G,w_c);
            C_lead = set_wg_lead(w_c);
            C = K*C_lag*C_lead;
            [Gm,~,wg_f,~] = margin(C*G/K);            
            if wg_f >= w_c && Gm >= args{2}
                ok = true;
            else
                ok = false;
            end
        case '100'
            C = K*set_MF(G,args{2},NaN);
            [~,Phim,~,~] = margin(C*G/K);            
            if Phim >= args{2}
                ok = true;
            else
                ok = false;
            end
        case '110'
            C_mf = set_MF(G,args{2},args{4});
            C = K*C_mf;
            [Gm,Phim,~,~] = margin(C*G/K);            
            if Phim >= args{2} && Gm >= args{4}
                ok = true;
            else
                ok = false;
            end
    end        
    
    function C_wgp = set_wg_lead(w_c)        
        b = (1 + sin(deg2rad(5)))/(1 - sin(deg2rad(5)));
        T2 = 1/(w_c * sqrt(b));
        C_wgp = (b*T2*s + 1)/(T2*s + 1);        
    end

    function C_wgp = set_wg_lag(sys,w_c)           
        % Cálculo
        [mag,~,w] = bode(sys);    
        mag = 20*log10(squeeze(mag));        
        x = abs(w-w_c);
        w_c = w(x == min(x));
        a = 10^(-mag(w == w_c)/20);
        T1 = 10/(a*w_c);
        C_wgp = (a*T1*s + 1)/(T1*s + 1);
    end    

    function C_mf = set_MF(sys,MF,MG)             
        [~,Pm,~,~] = margin(sys);
        if Pm >= MF
            C_mf = tf(1);
            ok = true;
            return
        end
        % Para forzar        
        n_iter = 0;        
        controllers = [];
        costo = [];
        Pm_wtd = MF;
        lag_weight = 0.4;
        while ~ok
            if n_iter == 20
                [~,idx] = min(costo);
                C_mf = controllers(idx);
                break;            
            end
            sub_args = {'w_gp',MF*lag_weight};            
            C_mf_lag = frq_lag_compensator(sys,'100',sub_args);
%             if MF*2 < 120
%                 sub_args = {'MF',MF*2};
%             elseif MF*1.5 < 120
%                 sub_args = {'MF',MF*1.5};
%             elseif MF*1.25 < 120
%                 sub_args = {'MF',MF*1.25};
%             elseif MF*1.1 < 120
%                 sub_args = {'MF',MF*1.1};
%             else
            sub_args = {'MF',MF};
%             end            
            C_mf_lead = frq_lead_compensator(C_mf_lag*sys,'100',sub_args);
            C_mf = C_mf_lag*C_mf_lead;
            [Mg,Pm,~,~] = margin(C_mf*sys);
            if ~isnan(MG)
                if Pm < Pm_wtd || Mg < MG
                    lag_weight = lag_weight + 0.015;
                    error = abs(Pm_wtd - Pm)/Pm_wtd + 0.5*abs(MG - Mg)/MG;
                    costo = [costo, error];
                    controllers = [controllers, C_mf];
                    n_iter = n_iter + 1;
                else
                    ok = true;
                end
            else
                if Pm < Pm_wtd
                    lag_weight = lag_weight + 0.015;
                    error = abs(Pm_wtd - Pm)/Pm_wtd;
                    costo = [costo, error];
                    controllers = [controllers, C_mf];
                    n_iter = n_iter + 1;
                else
                    ok = true;
                end
            end
        end
    end
end

function [C, ok, msg] = frq_lead_compensator(G,sel_params,args)    
    s = tf('s');
    K = 1;
    msg = '';
    ok = false;    
    if args{end-1}(1) == 'e'        
        K = calc_k_ess(G,args{end-1},args{end});
        G = G*K;
    end
    
    switch sel_params
        case '001'    
            w_c = args{2};
            C = K*set_wg(G,w_c);
        case '010'            
            C = K*set_MG(G,args{2});
        case '011'
            w_c = args{4};
            C_att = set_wg(G,w_c);            
            C_mg = set_MG(C_att*G,args{2});
            C = K*C_att*C_mg;
        case '100'
            C = K*set_MF(G,args{2});
        case '110'
            C_mf = set_MF(G,args{2});
            C_mg = set_MG(C_mf*G,args{4});
            C = K*C_mf*C_mg;
    end
    
    function C_mf = set_MF(sys,MF)
        ok = false;        
        [~,Pm,~,~] = margin(sys);
        if Pm >= MF
            C_mf = tf(1);
            ok = true;
            return
        end
        % Para forzar        
        n_iter = 0;        
        controllers = [];
        costo = [];
        % Cálculo
        [mag,phase,w] = bode(sys);    
        mag = 20*log10(squeeze(mag));
        phase = squeeze(phase);        
        Pm_wtd = MF; 
        while ~ok
            if n_iter == 50     
                [~,idx] = min(costo);
                C_mf = controllers(idx);
                break;            
            end
            theta = 0;
            phi2 = theta+1;        
            while phi2 > theta            
                theta = theta + 10;            
                phi_max = Pm_wtd - Pm + theta;
                if theta == 45 || phi_max >= 88
                    msg = 'No es posible satisfacer las condiciones, diseñando para máximo MF';
                    b = (1 + sin(deg2rad(75)))/(1 - sin(deg2rad(75)));
                    x = abs(mag-(-10*log10(b)));
                    w_gp = w(x == min(x));
                    break
                else
                    msg = '';
                end
                b = (1 + sin(deg2rad(phi_max)))/(1 - sin(deg2rad(phi_max)));
                x = abs(mag-(-10*log10(b)));
                w_gp = w(x == min(x));              
                phi2 = 180 - phase(w == w_gp);
            end        
            T2 = 1/(w_gp * sqrt(b));
            C_mf = (b*T2*s + 1)/(T2*s + 1);            
            [~,Pm,~,~] = margin(C_mf*sys);
            if Pm < Pm_wtd
                Pm_wtd = Pm_wtd + 0.01*MF;
                error = abs(Pm_wtd - Pm)/Pm_wtd;
                costo = [costo, error];
                controllers = [controllers, C_mf];
                n_iter = n_iter + 1;
            else
                ok = true;
            end            
        end
    end

    function C_wgp = set_wg(~,w_c)
%         ok = false;
%         [~,~,w_g,~] = margin(sys);
%         if w_g >= w_c
%             C_wgp = tf(1);
%             ok = true;
%             return
%         end               
        b = (1 + sin(deg2rad(5)))/(1 - sin(deg2rad(5)));
        T2 = 1/(w_c * sqrt(b));
        C_wgp = (b*T2*s + 1)/(T2*s + 1);
    end

    function C_mg = set_MG(sys,MG)        
        ok = false;
        [Gm,~,~,~] = margin(sys);
        if Gm >= MG
            C_mg = tf(1);
            ok = true;
            return
        else
            C_mg = tf(1);
            msg = 'No fue posible cumplir la condición de MG';            
            return
        end
    end
end

function pole = get_z_poles(sel_params,args,T)
    switch sel_params
        case '10100'
            Mp = args{2};
            if Mp == 0
                zita = 1;
            else
                zita = -log(Mp/100)/sqrt(pi^2 + (log(Mp/100))^2);
            end
            t_s = args{4};
            w_n = 4 / (zita*t_s);
        case '01100'
            zita = args{2};
            t_s = args{4};
            w_n = 4 / (zita*t_s);
        case '10010'
            Mp = args{2};
            if Mp == 0
                zita = 1;
            else
                zita = -log(Mp/100)/sqrt(pi^2 + (log(Mp/100))^2);
            end
            w_n = args{4};
        case '01010'
            zita = args{2};
            w_n = args{4};
        case '10001'
            Mp = args{2};            
            if Mp == 0
                zita = 1;
            else
                zita = -log(Mp/100)/sqrt(pi^2 + (log(Mp/100))^2);
            end
            w_s = 2*pi/T;
            n = args{4};
            w_n = w_s/(n*sqrt(1 - zita^2));            
        case '01001'
            zita = args{2};
            w_s = 2*pi/T;
            n = args{4};
            w_n = w_s/(n*sqrt(1 - zita^2));
        case '00110'
            t_s = args{2};
            w_n = args{4};
            zita = 4/(t_s*w_n);
        case '00101'
            t_s = args{2};
            n = args{4};
            w_s = 2*pi/T;
            zita = sqrt(16*n^2/(t_s^2*w_s^2 + 16*n^2));
            w_n = w_s/(n*sqrt(1 - zita^2));
    end
    w_d = w_n * sqrt(1 - zita^2);
    sT = (-zita * w_n + 1j * w_d)*T;
    pole = exp(sT);
end