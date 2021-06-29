function [new2,min_distance2,match_index2] = cal_min_distance2(origin,codebook)
%clear all
%X=[1 2 3;2 0 9;4 3 1];% Original image
%Y=[0 2 5;2 1 3;4 4 2;7 3 4];% Codebook
X=origin; % x1 3D-points
Y=codebook; % y2 3D-points
[Xps x2]=size(X);
[Yps y2]=size(Y);

% First find the cube (da,db,dL) for narrowing the search region
[da,db,dL]=find_cube(Y); 

% Second compare the distance between image and cube
for i=1:Xps
 ps=0;   
 for j=1:Yps
     % narrow the search region
     if((Y(j,1)<=X(i,1)+da) && (Y(j,1)>=X(i,1)-da) && (Y(j,2)<=X(i,2)+db) && (Y(j,2)>=X(i,2)-db) && (Y(j,3)<=X(i,3)+dL) && (Y(j,3)>=X(i,3)-dL))
       D2(j)=dist(X(i,:),Y(j,:)');
       ps=ps+1;
     else
       D2(j)=Inf; 
     end
 end
 if ps>0
    min_distance2(i,1) = min(D2);
    match_index2(i,1) = find(D2 == min_distance2(i,1)); 
 else  
    for j=1:Yps
        D2(j)=dist(X(i,:),Y(j,:)');
    end
    min_distance2(i,1) = min(D2);
    match_index2(i,1) = find(D2 == min_distance2(i,1)); 
 end 
 %min_distance2(i,1) = min(D2);
 %match_index2(i,1) = find(D2 == min_distance2(i,1));
 new2(i,:)=Y(match_index2(i,1),:);% use codeword instead of original image
end
%min_distance2
%match_index2
%new2


