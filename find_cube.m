function [da,db,dL] = find_cube(Yc) 
% Find the distance between neighbors  for creating the cube
%close all
%clear all
%Y=[0 2 5;2 1 3;4 4 2;7 3 4];% Codebook

[m n]=size(Yc);
for i=1:m
 for j=1:m
     if (j~=i)
        D(j)=dist(Yc(i,:),Yc(j,:)');
     else
        D(j)=Inf;
     end
 end
 min_distance(i,1) = min(D);
 match_index(i,1) = find(D == min_distance(i,1));
 %match_index(i,3) = min(D);
 %new(i,:)=Y(match_index(i,1),:);
 dd(i,:)=abs(Yc(i,:)-Yc(match_index(i,1),:));
end
%min_distance
%match_index
%dd
da=max(dd(:,1));
db=max(dd(:,2));
dL=max(dd(:,3));