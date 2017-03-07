function res = forwardPropagation(X, Theta1, Theta2);
m = size(X, 1);
X = [ones(m,1) X]; % X = (m x n+1)
tmp = sigmoid(X * Theta1'); %tmp = m x h
tmp = [ones(m,1) tmp];

res = sigmoid(tmp * Theta2'); %res = (m X o) matrix

for i = 1:m
	if (res(i,1) >= res(i,2))
		res(i,1) = 1;
		res(i,2) = 0;
	else
		res(i,1) = 0;
		res(i,2) = 1;
	endif;
end;
end;