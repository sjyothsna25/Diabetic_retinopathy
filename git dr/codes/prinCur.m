function lamda2=prinCur(Image)

%Image : Input Image
%Here we obtain parameters for Hessian metrx in every pixel and find eigen
%values of the hessian matrix using lamdafind function

% Obtain parameters for hessian matrix
% gx corresponds to ?g/?x,  gy corresponds to ?g/?y, which are the differences in the x (horizontal) direction.

[gx, gy] = gradient(double(Image));
[gxx, gxy] = gradient(gx);
[gxy, gyy] = gradient(gy);



[row,col]=size(Image);
lamdaplus = zeros(row,col);
lamdaminus = zeros(row,col);

%finding eigen values of hessian matrix [gxx gxy;gxy gyy]

for r = 1:row
    for c = 1:col
            [lamdaplus(r,c),lamdaminus(r,c)]=lamdafind(gxx(r,c),gyy(r,c),gxy(r,c));
    end
end

lamda2 = lamdaplus;
end