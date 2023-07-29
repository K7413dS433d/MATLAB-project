%get R & G in shape "you can pass to it R and G in any shape you want (sym
%or victor) "
%--k7413d--%
%if R or G in a sympolyc form might found missing bits 

function [newR ,newG]=getMissing(R , n ,G ,k)%return newR and newG in victor of bits
newR=[];
newG=[];

    %to modify R
    if class(R)=="sym"
        
        if feval(symengine,'degree',R) ~= (n-1) %so there is missing bits
            
            %iR refers to the number of missing bits in R
            iR=(n-1)-feval(symengine,'degree',R);
        
            R=sym2poly(R);
        
            %flip R to add missing bits
            R=flip(R);
            
            posInR=length(R)+1;
            
            %adding missing bits
            while iR~=0
                R(posInR)=0;
                posInR=posInR+1;
                iR=iR-1;
            end
            %reverse again to into longDiv function [X^5 x^4 ...] but in
            %bits 
            R=flip(R);
            newR=R;
        else %else if polynomial and no missing 
            newR=sym2poly(R);
        end
    else
        %if R is vector so there is no room for missing bits 
        newR=R;
    end 
    
    
    %to modify G
    if class(G)=="sym"
        
        if feval(symengine,'degree',G) ~= (k-1) %so there is missing bits
            
            %iG refers to the number of missing bits in G
            iG=(k-1)-feval(symengine,'degree',G);
        
            G=sym2poly(G);
        
            %flip G to add missing bits
            G=flip(G);
            
            posInG=length(G)+1;
            
            %adding missing bits
            while iG~=0
                G(posInG)=0;
                posInG=posInG+1;
                iG=iG-1;
            end
            %reverse again to fit into longDiv function [X^5 x^4 ...] but in
            %bits 
            G=flip(G);
            newG=G;
            
        else %else if polynomial and no missing
            newG=sym2poly(G);
        end
    else
        %if G is vector so there is no room for missing bits 
        newG=G;
    end 
end
        
        
        