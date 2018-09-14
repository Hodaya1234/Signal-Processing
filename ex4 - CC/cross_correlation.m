function [ result ] = cross_correlation( vector_a, vector_b)
len_a = length(vector_a);
len_b = length(vector_b);
result_size = len_a + len_b - 1;
vector_a_zeros = [zeros(1,len_b - 1), vector_a, zeros(1,len_b - 1)];
result = zeros(1,result_size);

for i = 1:result_size 
    result(i) = sum(vector_a_zeros(i:i+len_b - 1).*vector_b);
end

