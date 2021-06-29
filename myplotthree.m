function myplotthree(Data)        % total row of n; Data: Data of list
figure;
M = [1 21 41 61 81 2 22 42 62 82 3 23 43 63 83 4 24 44 64 84 5 25 45 65 85 6 26 46 66 86 7 27 47 67 87 8 28 48 68 88];

for i = 1:max(size(Data))
 
  Fx = Data(i,1);
  Fy = Data(i,2);
  Fz = Data(i,3);
  plot3(Fx,Fy,Fz,'k.');
  % text(Fx,Fy,Fz,num2str(M(i)));
  grid on
  hold on
end
% axis ([-5 5 -4 4 -4 2]);
 axis ([-40 40 -40 40 -40 40]);
% axis equal
xlabel('a');
ylabel('b');
zlabel('L');
end