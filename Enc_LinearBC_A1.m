function Encoded_Msg=Enc_LinearBC_A1(Msg_Matrix,generator_Mat)
%using only generator matix and message
[k,n]=size(generator_Mat);
Encoded_Msg=encode(Msg_Matrix,n,k,'linear/binary',generator_Mat);
Encoded_Msg=num2str(Encoded_Msg);
end


