
clc
clear 
close all

% bits = input('prompt');
bits = [0 1 1 1 0 1];
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));
lastbit = -1;
for i=1:length(bits)
  if bits(i)==1
    x((i-1)*n+1:i*n) = -lastbit;
    lastbit = -lastbit;
  else x((i-1)*n+1:i*n) = lastbit;
  end
end
plot(t, x, 'r');
axis([0 t(end) -2 2]);
grid on;
xlabel('Time')
ylabel('Voltage Level');
title('NRZ-I line Encoding')


for i=0 :length(bits)-1
    txt = num2str(bits(i+1));
    text(i+.5, 1.3, txt);
end

counter = 0;
lastbit = 1;
for i = 1:length(t)
  if t(i)>counter
    counter = counter + 1;
    if x(i)~=lastbit
      result(counter) = 1;
      lastbit = -lastbit;
    else
        result(counter) = 0;
    end
  end
end
disp('NRZ-I Decoding:');
disp(result);