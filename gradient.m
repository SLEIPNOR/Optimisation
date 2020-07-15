function grad = gradient(x)                                                  
syms X Y;

v = 100*(Y-X.^2).^2+(1-X).^2;  
X = x(1);  
Y = x(2);
grad = gradient(v);  
grad = eval(grad); 

end
