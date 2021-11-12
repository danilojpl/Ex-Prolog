:- discontiguous(mae/2).
:- discontiguous(pai/2).
:- discontiguous(conjuge/2).
:- discontiguous(irmao/2).


mae(maria, joana).
mae(joana, luis).
mae(cleia, otavio).
pai(joao, joana).
pai(orozimbo, otavio). 
pai(otavio, luis).
pai(serafim, orozimbo).
pai(manuel, leticia).
conjuge(otavio, joana).
conjuge(joana, otavio).
conjuge(maria, joao).
conjuge(joao, maria).
conjuge(cleia, orozimbo).
conjuge(orozimbo, cleia).
irmao(orozimbo, manuel).

% tio-avô (masculino)
avo_masculino(X,Y) :- (mae(W,Y) ; pai(W,Y)), pai(X,W).
tio_avo(X,Y) :- avo_masculino(W,Y), irmao(W,X);irmao(X,W). 
% sogro(a)
sogro_sogra(X,Y) :- conjuge(W,Y), (pai(X,W);mae(X,W)).
% cunhado(a)
cunhado_cunhada(X,Y) :- conjuge(W,Y), irmao(W,X).
% primos(as) diretos (primeiro grau)
tios(X, Y) :- (pai(W,Y); mae(W,Y)), irmao(W,X).
primos(X, Y) :- tios(Z, Y),pai(Z,X).
% (desafio) primos(as) indiretos (segundo/terceiro grau)