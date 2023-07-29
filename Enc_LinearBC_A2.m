function Encoded_Msg=Enc_LinearBC_A2(Msg_Matrix,k,n,parity_check_mat)
%using message and parrity check matrix and n and k
generator_Mat=[parity_check_mat eye(k)];
Encoded_Msg=mod(Msg_Matrix*generator_Mat,2);
Encoded_Msg=num2str(Encoded_Msg);
end