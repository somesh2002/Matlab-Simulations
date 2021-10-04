function [x] = gausssidel(A,B)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[R,C]=size(A);%helps to calculate the Rows and column ninsdie a matrix
if R~=C %if rows not equal to column, dont move forward
    disp('It should be a square matrix.Terminating the Process here.');
    return;
end
%setting the error value, initialize the number of iterations, and two
%initial vector x and initial
eps=10^(-8);
max_iteration=40;
x=zeros(R,1);
initial=ones(R,1);
dominant=1;
%% Checking Matrix is digonally Dominant
for i=1:R
    if(2*abs(A(i,i)) <= sum(abs(A(i,:)))) %for every row , |a(i,i)| should be >= |a(i,1:i-1)| + |a(i,i+1:C)| This has been written by manipulating some variable 
    disp('matrix is not digonally dominant.reducing the value of iterations to prevent the problem');
    max_iteration=10;
    dominant=0;
    break
    end
end

if dominant==1
    disp('matrix is digonally Dominant');
end
%% Process begin
step=1;
while step < max_iteration
    for i=1:R
    x(i)=(-A(i,1:i-1)*x(1:i-1,1) - A(i,i+1:C)*x(i+1:C,1) + B(i,1))/A(i,i);
    end

    if norm(x-initial,"inf") < eps%calculating the infinity norm 
        break;
    end
    initial=x;
    step=step+1;
    
end

if step> max_iteration
    disp('max number of iterations reached');
end
end