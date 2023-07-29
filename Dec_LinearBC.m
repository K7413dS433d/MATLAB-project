function Msg_Matrix=Dec_LinearBC(Encoded_Msg,generator_Mat)
[k,n]=size(generator_Mat);
x=n-k;
ht=transpose(gen2par(generator_Mat));
syndrome_victor=mod(Encoded_Msg*ht,2);
if sum(syndrome_victor)==0
    for i=1:length(Encoded_Msg)
        Msg_Matrix=Encoded_Msg(x+1:n);
        break;
    end
else
    for i=1:length(ht)
        if ht(i,:)==syndrome_victor
            Encoded_Msg(i)=1-Encoded_Msg(i);
            break;
        end
    end
end
for i=1:length(Encoded_Msg)
    Msg_Matrix=Encoded_Msg(x+1:n);
    Msg_Matrix=num2str(Msg_Matrix);
    break;
end
 
end