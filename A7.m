clear;
 %% Simplex Method
 x0=[-0.75;1];
 k=0;                                                                                                        
step = 0.3;
x1 = [x0(1)+step;x0(2)];
x2 = [x0(1)+step/2; x0(2)-sqrt(3)/2*step];
P = [x0 x1 x2];
I=1;
a = 1.9733 ;   
 Accuracy = 1e-25;
 Set(:,1) = x0; Set(:,2) = x1;  Set(:,3) = x2;
 while (1)
     jk = log((P(1,I)-1)^2 + (P(2,I)-1)^2);
     Jk(:,k+1) = jk;
     fA = (Banana(P(:,1))+Banana(P(:,2))+Banana(P(:,3)))/3;
     criterion = ((Banana(P(:,1))-fA)^2+(Banana(P(:,2))-fA)^2+(Banana(P(:,3))-fA)^2)/3;
     if criterion < Accuracy
        break;
      end
     Xc = (P(:,1)+P(:,2)+P(:,3))/3;  
     F = [Banana(P(:,1));Banana(P(:,2));Banana(P(:,3))];
     [M,I]=max(F);
     Xn = Xc+a*(Xc-P(:,I));
     P(:,I) = Xn;   
     k=k+1;
     Set(:,k+3) = P(:,I);        
 end
 %% Visualization
  X = -2.5: 0.05 :2.5;
  Y = -1.4: 0.05 : 6;
  [X, Y] = meshgrid(X, Y);
  v = 100*(Y-X.^2).^2 +(1-X).^2;  
  
  figure(1)
  L = [0,0.1,0.25,0.5,1,5,10,30,70,110,160,200,240,300,600];
  contour(X,Y,v,L,'LineWidth',1,'LineColor','#0072BD','ShowText','on');
  hold on; 
  plot(Set(1,:),Set(2,:),'r-.','LineWidth',1.5); 
  xlabel('x');  ylabel('y');  
  title('Simplex Method'); 
  legend('Level sets','Behavior of the Simplex Method');
figure(2)
Xaxis=(0:k);
plot(Xaxis(1,:),Jk(1,:));
xlabel('Iteration number: k');  ylabel('Jk');  title('Cost Function of of Simplex Method');
