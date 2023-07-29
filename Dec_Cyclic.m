function Msg_Matrix=Dec_Cyclic(Encoded_Msg,generator_Mat,n,k)

%newR is R after adding the missing bits newR is the missage now 
%newG is G after adding the missing bits 
[newR, newG]=getMissing(Encoded_Msg , n ,generator_Mat ,k);%this fun return G and R in the right shape for longDiv 

message=newR;%[x^5 x^4 ...]

[res,rem]=longDiv(poly2sym(fliplr(newR)),poly2sym(fliplr(newG)));%return result and reminder as a polynomials
rem=sym2poly(rem);

%if message has no error
if rem==0    
    %display message vector bits
    Msg_Matrix=num2str(message);
    
%if message has an errors     
else
    %flip reminder and message to access it in loop to change wrong bits
    %flip from [x^5 x^4 ...] to [1 x x^2 ... ]
%     message=flip(message);
    rem=flip(rem);
    
    for i=1:length(rem)
        if rem(i)==1
            
            %change the incorrect bit
            if message(i)==0 ; message(i)=1;else; message(i)=0; end
            
        end
    end
    %display message vector bits in form [1 x x^2 ...]
    Msg_Matrix=num2str(message);
    
end
end