clc;
clear;

% File path
save_file_name = 'draw_line'
file_path_cell = {};
file_path_cell{1} = "./example/data/data_1.txt";
file_path_cell{2} = "./example/data/data_2.txt";
file_path_cell{3} = "./example/data/data_3.txt";

% Read file
data_y_cell = {};
for i = 1:length(file_path_cell)
    file = fopen(file_path_cell{i}, 'rt');
    data_y_cell{i} = fscanf(file, '%f');
    fclose(file);
end

% Genearte x
data_x_cell = {};
for i = 1:length(data_y_cell)
    data_x_cell{i} = 1:length(data_y_cell{i});
end

% Setting for plot { '-o','-p','-s','-d'}
markshape = '-o';

% Setting for color
linecolor = {[254  67 101] / 255; [252 157 154] / 255; ...
             [249 205 173] / 255; [131 175 155] / 255; ...
             [0   249   0] / 255};

% Create figure
figure;
for i = 1:length(data_y_cell)
    plot(data_x_cell{i}, data_y_cell{i}, ...
        markshape, ...
        'Color', linecolor{i}, ...
        'LineWidth', 1.5, ...
        'MarkerSize', 3, ...
        'MarkerEdgeColor', linecolor{i}, ...
        'MarkerFaceColor', linecolor{i});
    hold on;
end

% Add Legend
legend('line A', 'line B', 'line C');

% Set coordinate axis labels
xlabel('X label', 'FontName', 'Times New Roman', 'FontSize', 12);
ylabel('y label', 'FontName', 'Times New Roman', 'FontSize', 12);

% Set FontName and FontSize
set(legend, 'FontSize', 12, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 12);

% Set image size
set(gca,'color','none');
set(gcf,'color','none');
set(gcf, 'Units', 'centimeter', 'Position', [5 5 20 10]);

% box and grid
grid on;
box on;

% Save as eps
print('-depsc', '-tiff', '-r600', '-loose', save_file_name);

% Close hold
hold off;