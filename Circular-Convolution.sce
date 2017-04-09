clc;
clf;

x = input("Enter the first sequence: ");
h = input("Enter the second sequence: ");

m = length(x);
n = length(h);
l = max(m,n);

k = m - n;
if k >= 0 then
    h = [h, zeros(1,k)];
else
    x = [x, zeros(1,-k)];
end


for i = 1:l
    conv_sum = 0;
    for j = 1:l
        k = i-j+1;
        if k <= 0 then
            k = l + k;
        end
        conv_sum = conv_sum + x(j)*h(k);
    end
    y(i) = conv_sum;
end

// plot the convoluted function
disp(y, "y = ")

// plot the graphs

// plot x
t = 1:m
subplot(3,1,1)
plot2d3(t,x)

// plot h
t = 1:n
subplot(3,1,2)
plot2d3(t, h)

// plot y
//t = 1:l
subplot(3,1,3)
plot2d3('gnn',y)
