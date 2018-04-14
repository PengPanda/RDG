function ppDualplot(TRI,x,y,w,h)

% input: tri is a vector, size is n*3
% x,y is the coordinates of points
% this function is used for replacing 'dualplot' in system
% by pp 2017.10.13


% clear 
% close all
% TRI = importdata ('sTRI.mat');
% x = importdata ('sxd.mat');
% y = importdata ('syd.mat');
% 
% 
% figure




% xmin = min(x(:)); xmax = max(x(:));
% ymin = min(y(:)); ymax = max(y(:));
% xl = xmax - xmin; yl = ymax - ymin;

%  axis([0, h,...
%     0, w]);
%  hold on

for i = 1:length(TRI(:,1))
    a = TRI(i,1); % current start piont.
    b = TRI(i,2);
    c = TRI(i,3);

    if b ~= 0
        xt = [x(a) x(b)];
        yt = [y(a) y(b)];  
        plot(xt, yt);
%         set(gca,'ydir','reverse')
        hold on
    end
    if c ~= 0
        xt = [x(a) x(c)];
        yt = [y(a) y(c)];  
        plot(xt, yt);
%         set(gca,'ydir','reverse')
        hold on
    end
    plot(x, y,'.r');
 end
hold off