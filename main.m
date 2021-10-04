%% NAME and ROLL Number
%name= SOMESH AGRAWAl Roll Number: -2003326 , Branch: MnC

%% for diagonally dominant matrix
A=[4 1 -1;2 7 1;1 -3 12];
B=[3; 19; 31];
X=gausssidel(A,B);
X
A
disp(A*X);%to check whether we are getting the Matrix B back or not
%% for digonally non-dominant matrix
A=[4 6 2;1 4 8;1 3 2];
B=[6; -4; 8];
X=gausssidel(A,B);
X
A
A*X %to check whether we are getting the Matrix B back or not
%% for hilbert matrix
dim=5;
H=hilb(dim);
x=ones(dim,1);
b=H*x;
X=gausssidel(A,b);
H
x
X
%clearly x vector is not matching to X vec