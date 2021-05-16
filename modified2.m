syms x y

disp("Enter eqns in x, y and constant.\n");

fxy = input("Enter the eq1 {eq1(x,y) = 0}: ");
gxy = input("Enter the eq2 {eq2(x,y) = 0}: ");

x_val = [];
y_val = [];
f_val = [];
g_val = [];
fx_fxy = [];
fy_fxy = [];
gx_gxy = [];
gy_gxy = [];

x_val(end+1) = input("value of x0 = ");
y_val(end+1) = input("value of y0 = ");

loop = input("No. of iterations needed : ");

for i = 1:loop
    fprintf("\nIteration - %d \n",i)
    
    f_val(end+1) = subs(subs(fxy,x,x_val(i)),y,y_val(i));
    g_val(end+1) = subs(subs(gxy,x,x_val(i)),y,y_val(i));
    
    fprintf("fx(x,y) = ");
    disp(diff(fxy,x));
    fprintf("fy(x,y) = ");
    disp(diff(fxy,y));

    
    fprintf("gx(x,y) = ");
    disp(diff(gxy,x));
    fprintf("gy(x,y) = ");
    disp(diff(gxy,y));
    
    fprintf("f(x(%d),y(%d)) = %f\t\t", i-1, i-1, f_val(i))
    fprintf("g(x(%d),y(%d)) = %f\n\n", i-1, i-1, g_val(i))

    fx_fxy(end+1) = subs(subs(diff(fxy,x),x,x_val(i)),y,y_val(i));
    fy_fxy(end+1) = subs(subs(diff(fxy,y),x,x_val(i)),y,y_val(i));
    gx_gxy(end+1) = subs(subs(diff(gxy,x),x,x_val(i)),y,y_val(i));
    gy_gxy(end+1) = subs(subs(diff(gxy,y),x,x_val(i)),y,y_val(i));

    fprintf("fx(x(%d),y(%d)) = %f\t", i-1, i-1, fx_fxy(i));
    fprintf("fy(x(%d),y(%d)) = %f\n\n", i-1, i-1, fy_fxy(i));
    fprintf("gx(x(%d),y(%d)) = %f\t", i-1, i-1, gx_gxy(i));
    fprintf("gy(x(%d),y(%d)) = %f\n\n", i-1, i-1, gy_gxy(i));

%    fprintf("x%d = x%d + h \t y%d = y%d + k\n", i, i-1, i, i-1);
%    fprintf("h = -Dx/D \t k = -Dy/D\n\n")
    dx = [f_val(i), fy_fxy(i); g_val(i), gy_gxy(i)];
%    fprintf("Dx = \n");
%    disp(dx);
 %   fprintf("Dx = %f\n\n", det(dx));
    
    dy = [fx_fxy(i), f_val(i); gx_gxy(i), g_val(i)];
%    fprintf("Dy = \n");
%    disp(dy);
%    fprintf("Dy = %f\n\n", det(dy));
%    
    d = [fx_fxy(i), fy_fxy(i); gx_gxy(i), gy_gxy(i)];
%    fprintf("D = \n");
%    disp(d);
%    fprintf("D = %f\n\n", det(d));
    fprintf("%f = h(%f) + k(%f)\t\t\t", f_val(i), fx_fxy(i), fy_fxy(i))
    fprintf("%f = h(%f) + k(%f)\n\n", g_val(i), gx_gxy(i), gy_gxy(i))
    fprintf("h = %f \t k = %f\n\n", -det(dx)/det(d), -det(dy)/det(d));
    
    x_val(end+1) = x_val(i) - det(dx)/det(d);
    y_val(end+1) = y_val(i) - det(dy)/det(d);
    
    fprintf("Therefore, x%d = %f and y%d = %f\n\n\n", i, x_val(i+1), i, y_val(i+1));
    
end
