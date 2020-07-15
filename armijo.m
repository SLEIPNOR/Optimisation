function alphak = armijo(a,sigma,xk,dk,gamma,g)                          
j=0;

while(1)
    alpha = a*sigma^j;  
    x = xk+alpha*dk;
    phi=Banana(x)-Banana(xk);
    if phi <=gamma*alpha*g'*dk
        alphak = alpha;  
        break;
    end
    j=j+1;
end

end