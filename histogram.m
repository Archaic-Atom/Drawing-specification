clc;  
clear;  
  
% file path
save_file_name = 'histogram'
file_path = "./example/data/data_4.txt";  

% setting for color
linecolor = {[254  67 101] / 255; [252 157 154] / 255; ...
             [249 205 173] / 255; [131 175 155] / 255; ...
             [0   249   0] / 255};
% init figure 
figure;  
hold on;  
  
% Assume dimension is one
num_datasets = 1; % the column number
data = load(file_path);

% Check dimensionality
if size(data, 2) ~= num_datasets
    error('Loaded data does not match expected dimensions.');  
end  
  
% Draw the picture
for i = 1:num_datasets
    % Get the one column
    offset = 1;
    X = 0:(size(data, 1) - offset);
    Y = data(:, i);
    b = area(X, Y); % draw the picture
    set(b, ...
        'FaceColor', linecolor{i}, ...
        'EdgeColor', 'none', ...
        'FaceAlpha', 0.5);  
end  
  
% box and grid
grid on;  
box on;  

% Set coordinate axis labels
xlabel('X label', 'FontName', 'Times New Roman', 'FontSize', 12);
ylabel('y label', 'FontName', 'Times New Roman', 'FontSize', 12);
set(gca, 'xlim', [0, (size(data, 1) - offset)], 'xtick', 0:50:(size(data, 1) - offset));
set(gca, 'FontSize', 12);  

% Set image size
set(gca,'color','none');
set(gcf,'color','none');
set(gcf, 'Units', 'centimeter', 'Position', [5 5 10 10]);
  
% Save as eps
print('-depsc', '-tiff', '-r600', '-loose', save_file_name);