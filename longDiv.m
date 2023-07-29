%Modified long division
%--k7413d--%

function [res , rem]=longDiv(rx , gx)%return res and rem in a victor of bits [x^5 x^4 ..]
syms x
%initialize res & rem as a symbolic 
res = sym(0);
rem = sym(0);

%convert r & g to symbolic
% gx=poly2sym(g);
% rx=poly2sym(r);

while feval(symengine,'degree',rx) >= feval(symengine,'degree',gx) %if digree of rx >= digree of gx 
    %note "degree function not working in  my version of matlab"

    %to get the x^digree Of rx / x^digree Of gx
    tmp = x^feval(symengine,'degree',rx)/x^feval(symengine,'degree',gx);
    
    %division result
    res = res+tmp;
    
    tmp2 = tmp*gx;
    
    %substract to get new rx
    rx = rx-tmp2;
    
    %take abs for result negative value might appears
    rx = sym2poly(rx);
    rx = abs(rx);
    rx = poly2sym(rx);% at the last iteration rx became the reminder 

end 
rem=rx;
res=res;
end 

