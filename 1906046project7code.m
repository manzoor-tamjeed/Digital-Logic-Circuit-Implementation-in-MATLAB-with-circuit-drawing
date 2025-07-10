clc
clear all;
n=input('Enter the number of variables:');
N=2^n;
Tab = zeros(N,n);
for i=1:n
   y = [zeros(N/2^i,1); ones(N/2^i,1)];
   Tab(:,i) = repmat(y,2^(i-1),1);
end
Tab(:,n+1)=input('Enter the output of truth table:');
table=Tab;
disp('Truth Table');
disp(table);
i=0;
j=1;
m=1;
u=0;
v=0;
l=0;
temp=1;
s=char(zeros(1,N));
for j=1:N
    if(table(j,n+1)==1)
        u=u+1;
        l=j;
    else
        v=v+1;
    end
end
if(u<=v)                         
  for j=1:N
    if(table(j,n+1)==1)
        for k=1:n
            if(table(j,m)==1)
                s(temp)=char('A'+i);
                temp=temp+1;
            else
                s(temp)=char('A'+i);
                temp=temp+1;
                s(temp)=char('′');
                temp=temp+1;
            end
              i=i+1;
              m=m+1;
        end
        if(j==l)
            s(temp)=char('.');
            temp=temp+1;
        else
            s(temp)=char('+');
            temp=temp+1;
        end
    end
    i=0;
    m=1;
  end
end
if(v<u)               
   for j=1:N
    if(table(j,n+1)==0)
        s(temp)=char('(');
        temp=temp+1;
        for k=1:n
            if(table(j,m)==1)
                s(temp)=char('A'+i);
                temp=temp+1;
                s(temp)=char('′');
                temp=temp+1;
            else
                s(temp)=char('A'+i);
                temp=temp+1;
            end
            if(k==n)
                s(temp)=char(')');
                temp=temp+1;
            else
                s(temp)=char('+');
                temp=temp+1;
              i=i+1;
              m=m+1;
            end
        end
    end
    i=0;
    m=1;
  end
end
if sum(Tab(:,n+1))== (2^n) 
    fprintf("The Boolean Function is: 1");
elseif sum(Tab(:,n+1))==0
    fprintf("The Boolean Function is: 1");
else
fprintf('The Boolean Function is: %s \n',s);
end