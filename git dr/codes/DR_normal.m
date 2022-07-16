srcFile = dir('C:\Users\jyoth\Desktop\mini project\codes\N\*.png');
mkdir('Normal_re');
for i=1:length(srcFile)
    filename = strcat('C:\Users\jyoth\Desktop\mini project\codes\N\',srcFile(i).name);
    Test_Image = imread(filename);
    segIm = vesselSegPC(Test_Image);
    path = strcat('C:\Users\jyoth\Desktop\mini project\codes\final images\Normal\',srcFile(i).name);
    imwrite(segIm,path);
end

