clc;
clf;

// take inputs
xn = input("Enter the sequence x(n): ")
N = length(xn);
xk = zeros(1,N);
ixk = zeros(1,N);

// DFT
for k=0:N-1
    for n=0:N-1
        xk(k+1) = xk(k+1) + (xn(n+1)*exp((-%i)*2*%pi*n*k/N));
    end
end
mprintf("The DFT is: \n")
disp(xk)

// IDFT
for k=0:N-1
    for n=0:N-1
        ixk(k+1) = ixk(k+1) + (xk(n+1)*exp((%i)*2*%pi*n*k/N));
    end
end
mprintf("The IDFT is: \n")
disp(ixk)

// plot the graphs

// plot input sequence
t = 0:N-1;
subplot(2,2,1);
plot2d3(t,xn);
ylabel('Amplitude');
xlabel('Time');
title('Input Sequence');

// plot magnitude response of DFT
t = 0:N-1;
subplot(2,2,2);
plot2d3(t,xk);
ylabel('Amplitude');
xlabel('Frequency');
title('Magnitude response of DFT');

// plot magnitude response of IDFT
t = 0:N-1;
subplot(2,2,3);
plot2d3(t,ixk);
ylabel('Amplitude');
xlabel('Frequency');
title('Magnitude response of IDFT');
