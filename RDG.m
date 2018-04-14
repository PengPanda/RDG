clear
close all

%% For RDG: Algorithm that Mimics Human perceptual Grouping of Dot Patterns
% 2018

Data = load('C:\Users\pp\Desktop\clusteringDataset\Spiral.txt');
x = Data(:,1);
y = Data(:,2);

figure
plot(x, y, '.')
title('Unlabel Data')

%% bench mark
c = Data(:,3);
len_data = length(x);
len_class = length(unique(c));
% color_idx = ['r', 'g', 'b', 'c', 'm', 'y', 'k', 'w'];

figure
for i = 1:len_class
    idx = find(c == i);
    x_class_i = x(idx);
    y_class_i = y(idx);
    
    plot(x_class_i,y_class_i, '.')
    hold on
end
hold off
title('Labeled Data')

%%
TRI = delaunay(x,y);
len = length(TRI(:,1));


TRI_cat = [TRI(:,1:2); TRI(:,2:3); [TRI(:,3), TRI(:,1)]];
Uni_TRI =unique(sort(TRI_cat(:,1)));
% dis_line = zeros(length(TRI_cat(:,1)), 1);
all_dot_start =[];
all_dot_end = [];
all_ratio_idx = [];

dis_line = [];
ratio_line = [];
k0 = 1;

for i = 1:length(Uni_TRI)
    idx_i = find(TRI_cat(:,1) == i);
    dot_start_idx = TRI_cat(idx_i, 1);  % row index
    dot_end_idx = TRI_cat(idx_i, 2);

    dot_start = [x(dot_start_idx), y(dot_start_idx)];
    dot_end = [x(dot_end_idx), y(dot_end_idx)];
    
    for j = 1: length(idx_i)
        dis_line_temp = sqrt((dot_start(j, 1) - dot_end(j, 1))^2 +...
            (dot_start(j, 2) - dot_end(j, 2))^2);
        dis_line = [dis_line, dis_line_temp];
        dis_line_temp = [];
    end

    min_dis = min(dis_line( k0 : k0 + length(idx_i), 1));
    for k = k0 : k0 + length(idx_i) %% find
        ratio_line(k) = dis_line(k)/(min_dis + eps);
    end
    k0 = k0 + length(idx_i);

    all_ratio_idx = [all_ratio_idx; idx_i];
    all_dot_start = [all_dot_start; dot_start];
    all_dot_end = [all_dot_end, dot_end];
    dot_start = [];
    dot_end = [];
end

for id = 1:length(TRI_cat(:,1))
    find(TRI_cat(id,1) == i)
end