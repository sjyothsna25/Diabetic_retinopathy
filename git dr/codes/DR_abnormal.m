srcFile = dir('C:\Users\jyoth\Desktop\mini project\codes\A\*.png');
mkdir('Abnormal');
for i=1:length(srcFile)
    filename = strcat('C:\Users\jyoth\Desktop\mini project\codes\A\',srcFile(i).name);
    Test_Image = imread(filename);
    segIm = vesselSegPC(Test_Image);
    path = strcat('C:\Users\jyoth\Desktop\mini project\codes\final images\Abnormal\',srcFile(i).name);
    imwrite(segIm,path);
end

