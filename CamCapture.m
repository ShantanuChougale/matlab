adaptorInfo = imaqhwinfo;
disp('Installed Adaptors:');
disp(adaptorInfo.InstalledAdaptors);

devices = imaqhwinfo('winvideo');
disp('Devices:');
disp(devices);

deviceInfo1 = imaqhwinfo('winvideo', 1);
disp('Supported Formats for Device 1:');
disp(deviceInfo1.SupportedFormats);

%deviceInfo2 = imaqhwinfo('winvideo', 2);
%disp('Supported Formats for Device 2:');
%disp(deviceInfo2.SupportedFormats);

obj1 = videoinput('winvideo', 1, deviceInfo1.SupportedFormats{1});
%obj2 = videoinput('winvideo', 2, deviceInfo2.SupportedFormats{1});

% 
%preview(obj1);
%preview(obj2);
% 
pause(60);
% 
stoppreview(obj1);
stoppreview(obj2);
%for i = 1:30
while(1)
        %title(['Image ',num2str(i),'/',num2str(10)])
        %pause(5)
        %disp('capturing Cam #1');
        [im1,meta1] = getsnapshot(obj1); 
        %disp('capturing Cam #2')
        %[im2,meta2] = getsnapshot(obj2);
        % disp('done')
        % subplot(1,2,1)
        % imshow(im1{i})
        % subplot(1,2,2)
        % %imshow(im2{i})
        % imwrite(im1{i},['.\left\',num2str(i),'.jpg']);
        % %imwrite(im2{i},['c:\cam2_',num2str(i),'.jpg']);
        %%%%%%%%ADD DEPTH ESTIMATION OBJECT DETECTION CODE
end


