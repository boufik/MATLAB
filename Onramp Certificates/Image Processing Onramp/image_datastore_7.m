% 1. Create an imageDatastore ----> "testimages" is a PC folder directory
ds = imageDatastore("testimages")
dataFilenames = ds.Files
nFiles = numel(dataFilenames)

% 2. Show image
img = read(ds)
imshow(img)
