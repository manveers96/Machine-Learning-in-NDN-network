clear all; %initialize
close all;

data = dlmread('TrainingSet.csv'); % load CSV file data m x 13
X = data(:, 2:11); %input matrix (m X n)
Y = data(:, 12:13); %output matrix (m X o)
m = size(X, 1); %m = no. of training examples
n = size(X, 2); %n = no. of features also n = no. of input nodes
o = size(Y, 2); %o = no. of output units

h = 20; %h = no. of nodes in hidden layers
Theta1 = zeros(h, n+1); %maps hidden layer to input layer
Theta2 = zeros(o, h+1); %maps output layer to hidden layer

INIT_EPSILON = 0.10;
Theta1 = rand(h,n+1) * (2 * INIT_EPSILON) - INIT_EPSILON; %randomize 
Theta2 = rand(o,h+1) * (2 * INIT_EPSILON) - INIT_EPSILON;

options = optimset('MaxIter', 5000);

initial_nn_params = [Theta1(:) ; Theta2(:)];

%  You should also try different values of lambda
lambda = 2;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   n, ...
                                   h, ...
                                   o, X, Y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:h * (n + 1)), ...
                 h, (n + 1));

Theta2 = reshape(nn_params((1 + (h * (n + 1))):end), ...
                 o, (h + 1));
				 

testData = dlmread('TestSample.csv'); % load CSV file data m x 13
testX = testData(:, 2:11); %input matrix (m X n)
testY = testData(:, 12:13); %output matrix (m X o)

res = forwardPropagation(testX, Theta1, Theta2);
count = 0;

for i = 1:size(testY,1)
	if (testY(i) == res(i))
		count = count + 1;
	endif;
end;

fprintf('\nTraining Set Accuracy: %f\n', (count/size(testY,1)) * 100);