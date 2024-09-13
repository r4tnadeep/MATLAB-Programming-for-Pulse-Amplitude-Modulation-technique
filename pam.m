clc;
clear all;
close all;
fc = 100;
fm = 10;
fs = 100*fc;
t= 0:1/fs:4/fm;
mt = cos(2*pi*fm*t);
ct = 0.5*square(2*pi*fc*t)+0.5;

st = mt.*ct;
up = [];

for i = 1:length(st);
    if st(i)==0
        up = [up,st(i)];
    else
        up = [up,st(i)+2];
    end
end

%demodulation 
dt = st.*ct;
filter = fir1(200,fm/fs,'low');
dm = conv(filter,dt);
t1 = 0:1/(length(dm)-1):1;

subplot(5,1,1);
plot(t,mt);
title('message signal');
xlabel('time period');
ylabel('amplitude');

subplot(5,1,2);
plot(t,ct);
title('carrier signal');
xlabel('time period');
ylabel('amplitude');

subplot(5,1,3);
plot(t,st);
title('bipolar modulated signal');
xlabel('time period');
ylabel('amplitude');

subplot(5,1,4);
plot(t,up);
title('unipolar modulated signal');
xlabel('time period');
ylabel('amplitude');

subplot(5,1,5);
plot(t1,dm);
title('demodulated signal');
xlabel('time period');
ylabel('amplitude');