clc

mask_detection('Face-Mask1.jpg')
mask_detection('Face-Mask2.jpg')
mask_detection('Face-Mask3.jpg')
mask_detection('Face-Mask4.jpg')
mask_detection('Face-Mask5.jpg')
mask_detection('Face-Mask6.jpg')
mask_detection('Face-Mask7.jpg')


function mask_detection(img_name)
data = imread(img_name);

% crop image to fit face
[M,N]=size(rgb2gray(data));
fh = figure;
imshow( data, 'border', 'tight' ); %//show your image
hold on;
rectangle('Position',[1, 1, int16(N-1), int16(M-1)],'EdgeColor','black',...
    'LineWidth',M/3.5); %// draw rectangle on image
frm = getframe( fh ); %// get the image+rectangle
face =frm.cdata

% extract to HSV and RGB dimension
hsv = rgb2hsv(face);
red=face(:,:,1);
green=face(:,:,2);
blue=face(:,:,3);

% convert picture into gray
gray=rgb2gray(face);

% subtract blue to green frame
diff_im=imsubtract(green,red);

% convert image into binary
diff_im=im2bw(diff_im,0.000001);

% use blob statistics analysis on this image 
diff_im=bwareaopen(diff_im,2000);

% use bounding box to show remaining objects
bw=bwlabel(diff_im,8);
stats=regionprops(bw,'BoundingBox','Centroid');

image(data);
hold on

% identify no of objects in image

for(object=1:length(stats))

bb=stats(object).BoundingBox;
bc=stats(object).Centroid;

rectangle('Position',bb,'EdgeColor','g','LineWidth',2)
plot(bc(1),bc(2),'-m+')
a=text(bc(1)+15,bc(2),strcat('X: ',num2str(round(bc(1))),' Y: ',num2str(round(bc(2)))));
set(a,'FontName','Arial','FontWeight','bold','FontSize',12,'Color','black');

end

hold off

end


       
