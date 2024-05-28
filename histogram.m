clc;  
clear;  
  
% 文件路径  
path = "D:\文档\zzzzzzz\sar_histogram_freq.txt";  
  
% 颜色设置  
% color = [131 175 155; 254 67 101; 53 183 119; 158 24 157] / 255.0;  
color = [254 67 101] / 255.0;   
% 初始化图形  
figure;  
hold on;  
  
% 假设文件中有 4 组数据（根据实际的列数调整）  
num_datasets = 1; % 根据txt文件的列数来设置  
data = load(path);  
  
% 检查数据是否匹配预期的维度  
if size(data, 1) ~= 256 || size(data, 2) ~= num_datasets  
    error('Loaded data does not match expected dimensions.');  
end  
  
% 循环遍历每一组数据  
for i = 1:num_datasets  
    % 选择当前数据集  
    Y = data(:, i);  
      
    % 绘制面积图  
    b = area(0:255, Y);  
    set(b, 'FaceColor', color(i,:), 'EdgeColor', 'none', 'FaceAlpha', 0.5);  
end  
  
% 设置图形属性  
grid on;  
box on;  
% ylabel('Value'); % 修改纵坐标标签  
% xlabel('Disparity');  % 修改纵坐标标签
set(gca, 'xlim', [0, 255], 'xtick', 0:50:255); % 根据需要调整 x 轴范围和刻度  
set(gca, 'FontSize', 12);  
% legend_title = legend('Dataset 1', 'Dataset 2', 'Dataset 3', 'Dataset 4'); % 根据数据集名称调整图例  
% set(legend_title, 'fontsize', 12, 'FontName', 'Times New Roman');  % 图例的字体和字体大小
set(gca, 'color', 'none');  
set(gcf, 'color', 'none');  
set(gcf, 'Units', 'centimeter', 'Position', [5 5 12 10]); % 调整图形窗口位置和大小  
  
% 保存图形为 PDF  
print('-dsvg', '-r600', 'optical_histogram_area');