clc;
clf;

x = input("enter the first sequence: ");
h = input("enter the second sequence: ");

m = length(x);
n = length(h);
l = m + n - 1;


for i = 1:l
    conv_sum = 0;
    for j = 1:i
        if (((i-j+1 <=n ) & (j <= m))) then
            conv_sum = conv_sum + x(j)*h(i-j+1);
        end
        y(i) = conv_sum;
    end
end

// plot the convoluted function
disp("y = ", y)

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
t = 1:l
subplot(3,1,3)
plot2d3(t,y)
