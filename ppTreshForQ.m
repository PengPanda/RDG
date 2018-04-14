function T = ppTreshForQ(Q)
%------------------------------------------------------------
% Evaluate the threshhold for Q 
% Input: Q
% Output: T = threshhold;
% Coded by Peng Peng. Contact me at peng_panda@163.com.
% Date: 2018.3.21
%------------------------------------------------------------
Q = sort(Q);
N = length(Q);
t_exp = 0.1; % experical
G = [];
temp_D2_Q = 0;
temp_D1_Q = 0;
D1_Q = [];
D2_Q = [];
D = [];

for i = 1:N
    % u = Q(i);
    % Q1 = Q(Q <  Q(i));
    % Q2 = Q(Q >=  Q(i));

    % if isempty(Q1)
    %     Q1 = 1;
    % end
    % if isempty(Q2)
    %     Q2 = 1;
    % end
    
    % u1 = mean(Q1);
    % n1 = length(Q1)/N;

    % u2 = mean(Q2);
    % n2 = length(Q2)/N;

    % g = (u*n1-u1)*(u*n1-u1)/(n1*n2+eps);
    % G = [G,g];

%-----------the 1st and 2nd order derivative.------------------
    if i>1 && i < N 
        temp_D1_Q = (Q(i+1) - Q(i-1))/2;
        % temp_D2_Q = Q(i+1) + Q(i-1) -2*Q(i);
         
    end
    
    D1_Q = [D1_Q, temp_D1_Q];
    % D2_Q = [D2_Q, temp_D2_Q];
    

%-----------------------------------------------------  
end
%  t = Q(G == min(G));
%  t = t(1);

% % T = t - 1/(1+exp(t-2)) + 0.5;
%  w = 0;
%  T = t - w*(t - 2.2)^3;

%  D = D1_Q.*D2_Q;
D = Q'.*Q'.*D1_Q;
 
%  figure
%  plot(D1_Q,'r')
% hold on

% % plot(D2_Q,'k')
% % hold on

% plot(D,'G')
% hold on

% plot(Q)
% grid on
% hold off

Qm = [];
for i = 1:N
    m = mean(Q(1:i));
    Qm = [Qm,D(i)./m];
end



 figure
 plot(Qm,'r','LineWidth',2)
set(get(gca, 'Title'), 'String', 'Qm');
hold on
plot(Q,'LineWidth',2)
grid on
hold off

indx = min(find(Qm > t_exp));
if indx == N
    T = Q(indx);
else
    T = Q(indx+1);
end

if ~isempty(T)
    T = T(1);
    else
    T = Q(end); % if T dosen't exsit, T = max(Q).
end
