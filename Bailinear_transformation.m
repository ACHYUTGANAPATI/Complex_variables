syms u v
syms z w
%bailinear Points z1,z2,z3 map to w1,w2,w3
z_piont = input("Enter '[z1,z2,z3]'= ");
w_piont = input("Enter '[w1,w2,w3]'= ");
z1 = z_piont(1);
z2 = z_piont(2);
z3 = z_piont(3);
w1 = w_piont(1);
w2 = w_piont(2);
w3 = w_piont(3);
for k=1:3
    if z_piont(k)== inf
        z_inf = k;
    else
        z_inf = 0;
    end
end
if z_inf ==1
    z_bailinear_num = (1-(z2/z1))*(z3-z);
    z_bailinear_den = (z2-z3)*((z/z1)-1);
elseif z_inf ==2
    z_bailinear_num = ((z1/z2)-1)*(z3-z);
    z_bailinear_den = (1-(z3/z2))*(z-z1);
elseif z_inf ==3
    z_bailinear_num = (z1-z2)*(1-(z/z3));
    z_bailinear_den = ((z2/z3)-1)*(z-z1);
else
    z_bailinear_num = (z1-z2)*(z3-z);
    z_bailinear_den = (z2-z3)*(z-z1);
end    
for j=1:3
    if w_piont(j)== inf
        w_inf = j;
    else
        w_inf = 0;
    end
end
if w_inf ==1
    w_bailinear_num = (1-(w2/w1))*(w3-w);
    w_bailinear_den =(w2-w3)*((w/w1)-1);
elseif w_inf ==2
    w_bailinear_num = ((w1/w2)-1)*(w3-w);
    w_bailinear_den =(1-(w3/w2))*(w-w1);
elseif w_inf ==3
    w_bailinear_num = (w1-w2)*(1-(w/w3));
    w_bailinear_den = ((w2/w3)-1)*(w-w1);
else
    w_bailinear_num = (w1-w2)*(w3-w);
    w_bailinear_den = (w2-w3)*(w-w1);
end
z_bailinear =z_bailinear_num/z_bailinear_den; 
w_bailinear = w_bailinear_num/w_bailinear_den;
result = z_bailinear ==w_bailinear;
z_final = solve(result, z);
w=u+v*1i;
z_f = subs(z_final,w);
x = real(z_f);
y =imag(z_f);
f1 = input("What you want to find x and y terms (under which expression you want to find bailinear transformation = ");
rhs_equal = input("equal to = ");
f = f1==rhs_equal;
F = simplify(f);
disp('Z fuction in terms of w =');
disp(z_final);
disp('Z fuction in terms of u and v');
disp(z_f);
disp('bailinear Transformation');
disp(F);