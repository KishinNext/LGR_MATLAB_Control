function G_tex = tfalatex(funcion, nombre)    
    var = evalin(symengine, funcion.Variable);
    Num = funcion.Numerator;
    Den = funcion.Denominator;            
    delay = funcion.OutputDelay;
    if funcion.Variable == 's'
        sys_syms = poly2sym(cell2mat(Num),var)/poly2sym(cell2mat(Den),var)*exp(-delay*var);
    elseif funcion.Variable == 'z'
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
    G_tex = ['\fontsize{' num2str(fontsize_0) '}{0}\selectfont $' nombre ' =$ \fontsize{' num2str(fontsize_1) '}{0}\selectfont $' G_tex '$'];
end