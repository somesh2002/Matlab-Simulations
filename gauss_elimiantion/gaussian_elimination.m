
%% Start Of the Program
Rows=3;
Columns=3;
A=[0 5 4 ; -9 8 5 ; -5 7 9];
B=[8;6;9];
%To check what answer will come if i calculate with inbuilt function
C=A\B;

%% Creation of Augmented Matrix

determinant=det(A);
if determinant==0
    return;
end

%forming a augmented matrix
Augmented=[A,B];

%% Gauss elimination Process
for i =1:1:Rows
    
    column=Augmented(i:end,i);
    
    [max_element,index]=max(abs(column));
    new_index=index+i-1;
    temp=Augmented(new_index,:);
    Augmented(new_index,:)=Augmented(i,:);
    Augmented(i,:)=temp;
    
    for j=i+1:1:Rows
        alpha=Augmented(j,i)/Augmented(i,i);
        Augmented(j,:)=Augmented(j,:)-alpha*Augmented(i,:);
    end
    
end

%% Back Subsitution
x=zeros(Rows,1);
for i=Rows:-1:1
    x(i)=(Augmented(i,end)-Augmented(i,i+1:Columns)*x(i+1:Rows))/Augmented(i,i);
end