% 1. Image Datastore
ds = imageDatastore("testimages");
nFiles = numel(ds.Files);
isReceipt = false(1, nFiles);

% 2. Classify images
for i = 1 : nFiles
	I = readimage(ds, i);
	isReceipt(i) = classifyImage(I);
end

% 3. Receipt and non-receipt images
receiptFiles = ds.Files(isReceipt)
montage(receiptFiles)
nonreceiptFiles = ds.Files(~isReceipt)
montage(nonreceiptFiles)





function isReceipt = classifyImage(I)
    
    gs = im2gray(I);
    gs = imadjust(gs);
    
    mask = fspecial("average",3);
    gsSmooth = imfilter(gs,mask,"replicate");
    
    SE = strel("disk",8);  
    Ibg = imclose(gsSmooth, SE);
    Ibgsub =  Ibg - gsSmooth;
 
    Ibw = ~imbinarize(Ibgsub);
    
    SE = strel("rectangle",[3 25]);
    stripes = imopen(Ibw, SE);
    signal = sum(stripes,2);  
 
    % Classification
    minIndices = islocalmin(signal,"MinProminence",70,"ProminenceWindow",25); 
    Nmin = nnz(minIndices);
    isReceipt = Nmin >= 9;
    
end
