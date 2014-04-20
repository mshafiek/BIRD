%%-----------------------------Object Detection---------------------------
%------------------------------------------------------------------------------------------
clc;% clears cammand window
clear all;% clears work space
	
n=0;
s2=serial('COM93'); % set serial port for h/w communication
s2.Terminator='';
s2.InputBufferSize=1;
s2.Timeout=1;   
fopen(s2);


 v=videoinput('winvideo',1,'yuy2_160x120');

while(n==0) 
  distance=fread(s2,1) % get indication from hw
  
% count=0;
% data=0;
if (distance>0)
%     disp('aa');
 preview(v);
 pause(5);
 snap_gray=getsnapshot(v);
 stoppreview(v);
%  delete(v);
 snap_rgb=ycbcr2rgb(snap_gray);
 snap_rgb=imresize(snap_rgb,[200 200]);
 bw_crop=im2bw(snap_rgb,graythresh(snap_rgb));% give any fraction value b/w 0 & 1
 imwrite(snap_rgb,'image.jpg');
 pause(.2);
%------------------------------------------------
  % detectobject
%---------------------------------------------------
    if (distance<=20)
%     disp('bb');
% check with database
srcFiles = dir('C:\vinu\program\matlab\database1\*.jpg') ; % give path of folder in which ur images exist.

corr=zeros(1,length(srcFiles));
for i = 1 : length(srcFiles)
    filename = strcat('C:\vinu\program\matlab\database1\',srcFiles(i).name);
    I = imread(filename);
%     I=imresize(I,[200,200]);
    %figure, imshow(I);
    bw_db=im2bw(I,graythresh(I));
    corr(i)=corr2(bw_db,bw_crop)

end
    if max(corr)>.2% set threshold for recognition.
    position=find(corr==max(corr))
    filename = strcat('C:\vinu\program\matlab\database1\',srcFiles(position).name)

    figure,imshow(filename);
    pause(2);
    switch position
        case 1
            
            fwrite(s2,'1');
            pause(2);
            
        case 2
            
            fwrite(s2,'2');
            pause(2);
            
        case 3
            
            fwrite(s2,'3');
            pause(2);
            
        case 4
            
            fwrite(s2,'4');
            pause(2);
            
    end
            
    end

    elseif ((distance>20)&&(distance<=30))
%     disp('cc')
% check with database
srcFiles = dir('C:\vinu\program\matlab\database2\*.jpg') ; % give path of folder in which ur images exist.

corr=zeros(1,length(srcFiles));
for i = 1 : length(srcFiles)
    filename = strcat('C:\vinu\program\matlab\database2\',srcFiles(i).name);
    I = imread(filename);

    bw_db=im2bw(I,graythresh(I));
    corr(i)=corr2(bw_db,bw_crop)

end
    if max(corr)>.2% set threshold for recognition.
    position=find(corr==max(corr))
    filename = strcat('C:\vinu\program\matlab\database2\',srcFiles(position).name)

    figure,imshow(filename);
    pause(2);
    switch position
        case 1
            
            fwrite(s2,'1');
            pause(2);
            
        case 2
            
            fwrite(s2,'2');
            pause(2);
            
        case 3
            
            fwrite(s2,'3');
            pause(2);
            
        case 4
            
            fwrite(s2,'4');
            pause(2);
            
    end
    end
elseif (distance>30)
%     disp('dd')
% check with database
srcFiles = dir('C:\vinu\program\matlab\database3\*.jpg')  % give path of folder in which ur images exist.

corr=zeros(1,length(srcFiles))
for i = 1 : length(srcFiles)
    filename = strcat('C:\vinu\program\matlab\database3\',srcFiles(i).name)
    I = imread(filename);

    bw_db=im2bw(I,graythresh(I));
    corr(i)=corr2(bw_db,bw_crop)

end
maxm=max(corr)
    if max(corr)>.2 % set threshold for recognition.
    position=find(corr==max(corr))
    filename = strcat('C:\vinu\program\matlab\database3\',srcFiles(position).name)

    figure,imshow(filename);
    pause(2);
    switch position
        case 1
            
            fwrite(s2,'1');
            pause(2);
            
        case 2
            
            fwrite(s2,'2');
            pause(2);
            
        case 3
            
            fwrite(s2,'3');
            pause(2);
            
        case 4
            
            fwrite(s2,'4');
            pause(2);
            
    end
    end

%-----------------------------------------------------------------



    
    end
 end
 pause(5);  
end

    