clear;
 %% Gradient Method
 x0=[-0.75;1];
 xk=x0;
 k=0;
 sigma = 0.5;  gamma = 0.35;  a = 1 ;   
 Accuracy = 1e-5;

 while (1)
     
    Set(:,k+1) = xk;
    jk = log((xk(1)-1)^2 + (xk(2)-1)^2);
    Jk(:,k+1) = jk;
    g = gradient(xk);                                                      
    dk = -g;                                                               
    if norm(dk) < Accuracy
        break; 
    end
    
   alphak = armijo(a,sigma,xk,dk,gamma,g);                                 
    
    xk = xk+alphak*dk;
    k = k+1;                                                       
 end
 %% Visualization
  X = -2.5: 0.05 :2.5;
  Y = -1.4: 0.05 : 6;
  [X, Y] = meshgrid(X, Y);
  v = 100*(Y-X.^2).^2 +(1-X).^2;  
  
  figure(1)
  L = [0,0.1,0.25,0.5,1,5,10,30,70,110,160,200,300,600];
  contour(X,Y,v,L,'LineWidth',1,'LineColor','#0072BD','ShowText','on');
  hold on; 
  plot(Set(1,:),Set(2,:),'r-.','LineWidth',1.5); 
  xlabel('x');  ylabel('y');  
  title('The Gradient Algorithm with Armijo Line Search'); 
  legend('Level sets','Behavior of the gradient algorithm');
  figure(2)
  Xaxis=(0:k);
  plot(Xaxis(1,:),Jk(1,:));
  xlabel('Iteration number: k');  ylabel('Jk');  title('Cost Function of The Gradient Method with Armijo Line Search');
