layers = [
    imageInputLayer([448 336 1],"Name","imageinput")
    convolution2dLayer([9 9],10,"Name","conv","Padding","same")
    maxPooling2dLayer([2 2],"Name","maxpool","Padding","same")
    convolution2dLayer([6 6],10,"Name","conv_1","Padding","same")
    maxPooling2dLayer([3 3],"Name","maxpool_1","Padding","same")
    reluLayer("Name","relu")
    fullyConnectedLayer(2,"Name","fc")
    batchNormalizationLayer("Name","batchnorm")
    softmaxLayer("Name","softmax")
    classificationLayer("Name","classoutput")];

plot(layerGraph(layers));