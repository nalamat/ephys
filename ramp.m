t = 0:1/1e5:1;
x = sin(2*pi*400*t)+sin(2*pi*200*t);


tr = 0:1/1e5:50e-3;
r = sin(2*pi*1/50e-3/4*tr).^2;
x(1:length(r)) = x(1:length(r)).*r;
x(end-length(r)+1:end) = x(end-length(r)+1:end).*flip(r);



plot(t(t<10e-3), x(t<10e-3));
ylim([-2, 2]);

% return;
a = audioplayer(x, 1e5);
play(a)
