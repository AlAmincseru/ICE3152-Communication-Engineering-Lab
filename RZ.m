clc
clear
close all
%prompt = 'Enter the bit stream';
%bits = input('prompt');
bits = [0 1 0 0 1];
disp('bits');
disp(bits);
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));
for i=1:length(bits)
  if bits(i)==1
    x((i-1)*n+1:(i-1)*n+n/2) = 1;
  else x((i-1)*n+1:(i-1)*n+n/2) = -1;
  end
end
plot(t, x, 'r');
axis([0 t(end) -2 2]);
xlabel('Time')
ylabel('Voltage Level');
title('RZ line Encoding')
grid on;

for i=0 :length(bits)-1
    txt = num2str(bits(i+1));
    text(i+.5, 1.5, txt);
end

counter = 0;
for i = 1:length(t)
  if t(i)>counter
    counter = counter + 1;
    if x(i)>0
      result(counter) = x(i);
    else result(counter) = 0;
    end
  end
end
disp('RZ Decoding:');
disp(result);