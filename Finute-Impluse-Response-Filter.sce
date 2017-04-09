clear;
clc;
clf;

// enter cut-off frequencies and input length
wc1 = input("Enter the starting cut-off frequency")
wc2 = input("Enter the ending cut-off frequency")
M = input("Enter the input length")

Tuo = (M-1)/2 // center value

// if the cut off frequencies are equal
if wc1 == wc2 then
    wc = wc1*%pi
    for n = 1:M
        if n == Tuo +1 then
            hd(n) = wc/%pi;
        else
            hd(n) = sin(wc*((n-1)-Tuo))/(((n-1)-Tuo)/%pi);
        end
    end
end

// if cut-off frequencies are not equal
if wc1 ~= wc2 then
    for n = 1:M
        if n ~= (M+1)/2 then
            hd(n) = sin(wc2*(n-(M+1)/2)/((n-(M+1)/2)*%pi) - sin(wc1*(n-(M+1)/2)/((n-(M+1)/2)*%pi)
        end
    end
    hd((M+1)/2) = (wc2-wc1)/%pi
end

// if the value is too small, ignore it
for kk = 1:M
    if hd(kk)>-0.000001 & hd(kk)<0.000001 then
        hd(kk) = 0;
    end
end


// display hd(n)
disp(hd)

// FOR WINDOW FUNCTION

z = input("Do you want to use window? 1. YES 2.NO ")
if z == 1 then
    wi = input("Which window? 1.rectangular  2.hamming  3.hanning")
    
    select wi
        
    case 1 then
        [hzm,fr] = frmag(hd,200);
        subplot(2,1,1);
        plot(fr,hzm);
        subplot(2,1,2);
        plot(2,1,2);
        k = 1:M
        plot2d3(k-(M+1)/2,hd(k))
    end
end
