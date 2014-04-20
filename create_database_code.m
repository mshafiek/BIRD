v=videoinput('winvideo',1,'yuy2_160x120');
 preview(v);
 pause(5);
 snap_gray=getsnapshot(v);
 stoppreview(v);
 delete(v);
 snap_rgb=ycbcr2rgb(snap_gray);
 I_rsize=imresize(snap_rgb,[200,200]);
 imwrite(I_rsize,'G:\object_detection(GEC-S)\database1\img3.jpg');%save in the folder database
 beep;