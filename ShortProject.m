clc
close all
clear
fprintf('3D Fibonacci Color Quantization started \n');
%% --------------------Set the Codebook size--------------------------------
n = 512;

coefficient =1.2;
%coefficient = 1.05;
%% --------------------Read Color image-----------------------------------
rgb_img = imread('kodim10.png');
%figure;
%imshow(rgb_img);

%% From RGB space into Lab space
lab_img = rgb2lab(rgb_img);
lab_img = double(lab_img);
t = rgb2gray(rgb_img);
%% Plot the 3D Spherical Fibonacci 
tic % 計時
N = linspace(1,n,n); 
for i = 1:n
  SX = SF(N(i));
  Total(i,:) = SX;
  SFx = SX(1,1);
  SFy = SX(1,2);
  SFz = SX(1,3);
  % D(i) = (SFx^2 + SFy^2 + SFz^2)^0.5; % Radius
end
FLL = max(Total(:,1));
FAA = max(Total(:,2));
FBB = max(Total(:,3));
%% Find the centroid of the image
[rows, columns, numberOfColorBands] = size(lab_img);
listOfLab_img = reshape(lab_img, rows*columns, numberOfColorBands);% List of image
centroid = [mean(listOfLab_img(:,1)) mean(listOfLab_img(:,2)) mean(listOfLab_img(:,3))];
%myplotthree(listOfLab_img); % Plot the orignal image distribution
%% PCA which coeff = eigenvector, E = eigenvalue
[coeff,SCORE,E] = pca(listOfLab_img);
%% Reshape the 3D_fibonacci lattice
T=[1 0 0 centroid(1);0 1 0 centroid(2);0 0 1 centroid(3);0 0 0 1];
r1 = coefficient*2.5*sqrt(E(1)); % radius of distribution of a
r2 = coefficient*2.5*sqrt(E(2)); % radius of distribution of b
r3 = coefficient*2.5*sqrt(E(3)); % radius of distribution of L
S = [r1/FLL 0 0;0 r2/FAA 0;0 0 r3/FBB];
Rot=coeff;
A=Rot*S; % Rotate * Scale
  for nn= 1:n
     Aa(nn)=A(1,:)*Total(nn,:)';
     Ab(nn)=A(2,:)*Total(nn,:)';
     AL(nn)=A(3,:)*Total(nn,:)';
  end
  % 平移(Translate)
  for nn1= 1:n
     Oa(nn1)=T(1,:)*[Aa(nn1) Ab(nn1) AL(nn1) 1]';
     Ob(nn1)=T(2,:)*[Aa(nn1) Ab(nn1) AL(nn1) 1]';
     OL(nn1)=T(3,:)*[Aa(nn1) Ab(nn1) AL(nn1) 1]';
  end
  for nn2= 1:n
    y1(nn2,1)=Oa(nn2);
    y1(nn2,2)=Ob(nn2);
    y1(nn2,3)=OL(nn2);
end
%------------------------------------------------our method
% S = [E(1)^(1/4) 0 0 0;0 E(2)^(1/4) 0 0;0 0 E(3)^(1/4) 0;0 0 0 1];% Scaling
%v1 = coeff(:,1);
%v2 = coeff(:,2);
%v3 = coeff(:,3);
%anglex=acos(sum(v1.*[1;0;0]));
%angley=acos(sum(v2.*[0;1;0])); 
%anglez=acos(sum(v3.*[0;0;1]));
%Rx = [1 0 0 0;0 cos(anglex) -sin(anglex) 0;0 sin(anglex) cos(anglex) 0;0 0 0 1];% Rotation_x
%Ry = [cos(angley) 0 sin(angley) 0;0 1 0 0;-sin(angley) 0 cos(angley) 0;0 0 0 1];% Rotation_y
%Rz = [cos(anglez) -sin(anglez) 0 0;sin(anglez) cos(anglez) 0 0;0 0 1 0;0 0 0 1];% Rotation_z
% tform_o = affine3d(Rz.*Ry.*Rx.*S);
% PCA_Fibo = transformPointsForward(tform_o,Total);
%PCA_Fibo = transformPointsForward(tform,Total);
%A = [PCA_Fibo(:,1)+centroid(1) PCA_Fibo(:,2)+centroid(2) PCA_Fibo(:,3)+centroid(3)];
% myplotthree(A);   % Print the Codebook Distrubution
%% Color-quantized Image
%ColorQuan_img = CalQuanImg(listOfLab_img,y1);
[ColorQuan_img,min_distance1,match_index1] = cal_min_distance2(listOfLab_img,y1(1:n,:));  % Using cube
toc
disp(['Color quantize 執行時間：',num2str(toc)]);
fprintf('Quantized-Image use %d colors\n',max(size(unique(ColorQuan_img(:,3))))); 
O_l = reshape(ColorQuan_img(:,1),rows,columns);
O_a = reshape(ColorQuan_img(:,2),rows,columns);
O_b = reshape(ColorQuan_img(:,3),rows,columns); 
Quantized_img(:,:,1) = O_l;
Quantized_img(:,:,2) = O_a;
Quantized_img(:,:,3) = O_b;
%% Print Quantized-Image
figure;
quan_rgb = lab2rgb(Quantized_img);
imshow(quan_rgb,[]);
title('Quantized-Image');
%cw=256;
%cl=256;
%CroppingRate = 1/16;
%r22 = [(cw/2)-round(cw*sqrt(CroppingRate)/2) (cl/2)-round(cl*sqrt(CroppingRate)/2) round(cl*sqrt(CroppingRate))-1 round(cw*sqrt(CroppingRate))-1];
%QueryImage_crop = imcrop(rgb_img,r22);
%figure;
%imshow(QueryImage_crop);
%% Caculate PSNR, SSIM, FSIM
quan_img = quan_rgb;
orignal_img = im2double(rgb_img);
Ro = orignal_img(:,:,1);
Go = orignal_img(:,:,2);
Bo = orignal_img(:,:,3);
Rq = quan_img(:,:,1);
Gq = quan_img(:,:,2);
Bq = quan_img(:,:,3);
[PSNR,MSE] = PSNR3c(Ro,Go,Bo,Rq,Gq,Bq);
fprintf(' PSNR = %0.4f dB\n', PSNR);
%[peaksnr, snr] = psnr(quan_img, orignal_img); %內建PSNR
%fprintf(' PSNR = %0.4f dB\n', peaksnr);
q1 = rgb2gray(quan_img);
q2 = rgb2gray(orignal_img);
SSIM = ssim(q1,q2);
fprintf(' SSIM = %0.4f \n', SSIM);
[FSIM,FSIMc] = FeatureSIM(orignal_img, quan_img);
fprintf(' FSIM = %0.4f \n', FSIMc);
%color_d = imcolordiff(orignal_img,quan_img);
color_d = C_D(orignal_img,quan_img);
fprintf(' Color Difference = %0.4f \n',color_d);
fprintf('Color Quantize Processing Finished\n');
%% Figure_5
%figure;
%for index = 1:n
%xlabel('index n');
%ylabel('Distributed Radius');
%hold on
%axis([0 100 0 10]);
%plot(index,D(index),'b.');
%end
%% Figure_6
%figure;
%for V = 1:40;
%four = 10^4;
%R(V) =(V*four*(3/4)*(1/pi))^(2/3);
%xlabel('volume');
%ylabel('Total number of lattices');
%hold on
%axis([0 4*10^5 0 2000]);
%plot(V*four,R(V),'b.');
%end
%--------------------------------------------------------------------------



