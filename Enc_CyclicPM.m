function Encoded_Msg=Enc_CyclicPM(Msg_Matrix,generator_Mat)
%using message and generator matrix

syms x
gx=poly2sym(fliplr(generator_Mat));
ux=poly2sym(fliplr(Msg_Matrix));

Xdeg=x^feval(symengine,'degree',ux);

ux=ux * Xdeg;
[res ,rem]=longDiv(ux,gx);
Encoded_Msg=ux+rem;
Encoded_Msg=sym2poly(Encoded_Msg);
Encoded_Msg=num2str(fliplr(Encoded_Msg));
end