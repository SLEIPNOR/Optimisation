 clear;
 %% Banana function
  X = -2.5: 0.05 :2.5;
  Y = -1.4: 0.05 : 6;
  [X, Y] = meshgrid(X, Y);
  v = 100*(Y-X.^2).^2 +(1-X).^2;  
  figure(1)
  surf(X, Y, v );
  colormap = jet;
  axis([-2.5, 2.5, -1.4, 6, 0, 6000]);
  xlabel('X', 'fontsize', 18);
  ylabel('Y', 'fontsize', 18);
  zlabel('v', 'fontsize', 18);
  title('Plot of Banana Function');
 %% Level sets
 figure(2)
 L = [0,0.1,0.25,0.5,1,5,10,30,70,110,160,200,300,600];
 contour(X,Y,v,L,'LineWidth',1,'LineColor','#0072BD','ShowText','on');
 xlabel('x'); 
 ylabel('y');  
 title('Level Sets of Banana Function');
