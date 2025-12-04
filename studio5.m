%% 3.
p=[1,54,-4705,-24750];
z_list=[];
unique_tolerance=1e-2;
for zi=-200:1:200
    current_root=myroots(p,zi);
    is_unique=true;
    for k=1:length(z_list)
         if abs(current_root-z_list(k)) < unique_tolerance
             is_unique=false;
             break;
         end
    end
     if is_unique
         z_list=[z_list,current_root];
     end
     if length(z_list)==3
         break;
     end
end
disp(z_list')
disp(roots(p))
%% 1.
A=mytranspose([1,2,3;4,5,6;7,8,9;10,11,12])
function B=mytranspose(A)
[rowsA,colsA]=size(A)
B=zeros(colsA,rowsA)
for i=1:rowsA
    for j=1:colsA
        B(j,i)=A(i,j)
    end
end
end
%% 2.
myroots([1,54,-4705,-24750],0)
function z=myroots(p,zi)
epsilon=1e-10;
z=zi
p_prime=polyder(p);
while abs(polyval(p,z)) >= epsilon
    f_z=polyval(p,z);
    fp_z=polyval(p_prime,z);
    if fp_z==0
        error('Derivative is zero; no solution found.');
    end
    z=z-(f_z/fp_z);
end
end
