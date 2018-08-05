function [bestParameter1,bestParameter2, bestParameter3] = ransac(data,num,iter,threshDist,inlierRatio)
 figure;plot(data(1,:),data(2,:),'o');hold on;
 number = size(data,2);
 bestInNum = 0;
 bestParameter1=0;bestParameter2=0; bestParameter3=0;
 for i=1:iter
 %% Randomly select 3 points
idx = randperm(number,num); sample = data(:,idx);   
 %% Compute the distances between all points with the fitting line 
re_arrange=[data(2,:); data(1,:)];
T = num2cell(re_arrange, 1);
SIZE=size(T,2);
for i = 1:SIZE
list_d = cellfun(@distance, T); 
end	 
%% Compute the inliers with distances smaller than the threshold    
	 inlierIdx = find(abs(list_d)<=threshDist);
     inlierNum = length(inlierIdx);
 %% Update the number of inliers    
     if inlierNum>=round(inlierRatio*number) && inlierNum>bestInNum
         bestInNum = inlierNum;
     end
 end
 
