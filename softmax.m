function res = softmax(z)
	for i = 1:size(z,1)
		total = exp(z(i,1)) + exp(z(i,2));
		for j = 1:size(z,2)
			res(i,j) = exp(z(i,j))/total;
		end
	end
end