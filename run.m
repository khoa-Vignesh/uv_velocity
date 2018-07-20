addpath(genpath('..'))
% addpath('..')
clear all;
% Load optical flow:
uv = readFlowFile('000000.flo');

u = abs(uv(:,:,1));
v = abs(uv(:,:,2));
low_v_E =floor(v(:,:));
high_v_E=ceil(v(:,:));

displayImg = imread('img1.png');
plotFlow(u, v, displayImg, 10, 25);
hold on
% img = imread('C:\Users\MAI\Dropbox\new code\Matlab\KITTI Test\000000_10.png');
% img = double(img)/255;
img = double(displayImg)./255;
global scale;
scale = 1;
[ux,vy]=create_voting_space(uv,scale);
% seg_r = plan_detection(img,vy,187,uv(:,:,2));
seg_r = parabolaabc(img,vy,187,uv(:,:,2));
figure(2)
subplot(1,2,1)
imshow(vy)
subplot(1,2,2)
imshow(ux)

rows = size(h_down,1);
columns = size(h_down,2);

x = [];
y = [];
for i = 1: rows
  for j = 1: columns
      if h_down(i, j) ~= 0
          x = [x; i];
          y = [y; j];
      end
  end
end

% [rows, columns] = size(h_down)
% [x, y] = meshgrid(1:columns, 1:rows)
% mask = h_down~=0
% x = x(mask)
% y = y(mask)

data =[x';y'];
 figure;plot(data(1,:),data(2,:),'o');

% ransac = ransac(data,num,iter,threshDist,inlierRatio)
%[bestParameter1,bestParameter2] = ransac(data,3,100,10,0.1);

