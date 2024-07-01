% Load the pre-trained YOLOv2 network for COCO dataset
net = yolov4ObjectDetector('tiny-yolov4-coco');

% Create a webcam object
videoFileLeft = 'LEFT2.mp4';
readerLeft = VideoReader(videoFileLeft);

% Create a video player to display the video and detection results
videoPlayer = vision.DeployableVideoPlayer('Name', 'YOLOv4 Object Detection');

% Set a loop to process the video frames
while true
    % Capture a frame from the webcam
    frame = readFrame(readerLeft);
    
    % Detect objects using YOLOv2
    [bboxes, scores, labels] = detect(net, frame);
    
    % Annotate the detections on the frame
    if ~isempty(bboxes)
        frame = insertObjectAnnotation(frame, 'rectangle', bboxes, cellstr(labels));
    end
    
    % Display the frame with annotations
    videoPlayer(frame);
    
    % Check if the video player is still open
    if ~isOpen(videoPlayer)
        break;
    end
    
    % Pause for a short while to reduce the processing speed
    pause(0.1);
end

% Clean up resources

release(videoPlayer);