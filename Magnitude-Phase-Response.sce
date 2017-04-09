clear;
clc;
clf;

// define a polynomial variable z
z = poly(0,'z');

// take the numerator and denominator as input
n1 = input("enter numerator = ")
n_len = length(n1);
n = poly(n1,'z','c');

d1 = input("enter denominator = ")
d_len = length(d1);
d = poly(d1,'z','c');

// form transfer function and plot pole-zero diagram
h = syslin('c',n./d);
subplot(3,1,1);
plzr(h);

// take a complex number 'a' to be 'i' i.e. a=0+1i
a = complex(0,1);

// iterate over numerator and denominator to replace
// z by exp(j*w)
w = -%pi:%pi/8:%pi;

// since there are intervals of pi/8 from -pi to pi, there will be totally 8+1+8 = 17 values
for i=1:17
    sum1 = 0;
    for j = 1:n_len
        sum1 = sum1 + (n1(j)*exp(a*(j-1)*w(i)));
        
        x = 10*imag(sum1);
        x = round(x);
        x = x/10;
        
        y = 10*real(sum1);
        y = round(y);
        y = y/10;
        
        sum1 = complex(y,x);
    end
    
    sum2 = 0;
    for j = 1:d_len
        sum2 = sum2 + (d1(j)*exp(a*(j-1)*w(i)));
        
        x = 10*imag(sum2);
        x = round(x);
        x = x/10;
        
        y = 10*real(sum2);
        y = round(y);
        y = y/10;
        
        sum2 = complex(y,x);
    end
    
    // get the transfer function
    sumn(1,i) = sum1/sum2;
    b = real(sumn(1,i));
    c = imag(sumn(1,i));
    
    // get magnitude response
    u(1,i) = abs(sumn(1,i));
    
    // get phase response
    
    // first check that real part is not zero
    if b~= 0 then
        p(1,i) = atand(c/b); // caluclates tan inverse
    else
        if c > 0 then
            p(1,i) = %pi/2;
        else
            p(1,i) = 3*%pi/2;
        end
    end
end

// plot magnitude response
subplot(312);
ylabel("magnitude");
xlabel("w");
title("Magnitude response");
plot(w,u);

// plot phase response
subplot(313);
ylabel("phase");
xlabel("w");
title("Phase response");
plot(w,p);



