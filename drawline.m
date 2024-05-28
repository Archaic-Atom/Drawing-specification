clc;
clear;

% 文件路径
filename1 = "D:\文档\zzzzzzz\50_a0\pooling heatmap loss\PHL_a0_after50.txt"; % 第1个数据文件
filename2 = "D:\文档\zzzzzzz\50_a0\heatmap loss\heatmap_loss_a0_after50.txt"; % 第2个数据文件
filename3 = "D:\文档\zzzzzzz\50_a0\point loss\PL_a0_after_50.txt"; % 第3个数据文件

% 读取数据
fid1 = fopen(filename1, 'rt');
yData1 = fscanf(fid1, '%f');
fclose(fid1);

fid2 = fopen(filename2, 'rt');
yData2 = fscanf(fid2, '%f');
fclose(fid2);

fid3 = fopen(filename3, 'rt');
yData3 = fscanf(fid3, '%f');
fclose(fid3);

% 生成x轴数据
xData1 = 1:length(yData1);
xData2 = 1:length(yData2);
xData3 = 1:length(yData3);

% 绘图设置
markshape = '-o'; % 标记形状为带圈的线

% 定义线条颜色
linecolor1 = [131 175 155]/255; % PHL_a0_50的线条颜色
linecolor2 = [249 205 173]/255; % heatmap_loss_a0_50的线条颜色
linecolor3 = [252 157 154]/255; % PL_a0_after_50的线条颜色
% linecolor = {[254 67 101]/255; [252 157 154]/255;  ...
%             [249 205 173]/255; [131 175 155]/255; ...
%             [0 249 0]/255};
% 创建新的图形窗口
figure;

% 绘制第一个数据集的曲线
plot(xData1, yData1, markshape, 'Color', linecolor1, 'LineWidth', 1.5, 'MarkerSize', 3, 'MarkerEdgeColor', linecolor1, 'MarkerFaceColor', linecolor1);
hold on; % 保持当前图形

% 绘制第二个数据集的曲线
plot(xData2, yData2, markshape, 'Color', linecolor2, 'LineWidth', 1.5, 'MarkerSize', 3, 'MarkerEdgeColor', linecolor2, 'MarkerFaceColor', linecolor2);

% 绘制第三个数据集的曲线
plot(xData3, yData3, markshape, 'Color', linecolor3, 'LineWidth', 1.5, 'MarkerSize', 3, 'MarkerEdgeColor', linecolor3, 'MarkerFaceColor', linecolor3);

% 添加图例
legend('Pooling Heatmap Loss', 'Heatmap Loss', 'Point Loss'); % 更新图例名称

% 设置坐标轴标签
% xlabel('Epoch', 'FontName', 'Times New Roman', 'FontSize', 12);
% ylabel('Average L2 error', 'FontName', 'Times New Roman', 'FontSize', 12);

% 设置字体大小和名称
set(legend, 'FontSize', 12, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 12);

% 设置图形窗口位置和大小（单位：厘米）
set(gcf, 'Units', 'centimeter', 'Position', [5 5 20 10]);

% 显示网格
grid on;

% 确保边框线显示
box on;

% 获取当前坐标轴句柄并设置边框线宽度
ax = gca;
ax.LineWidth = 1;

% 保存图形为SVG文件
print('-dsvg', '-r600', '-loose', 'epoch_l2_error'); % 更新输出文件名

% 关闭hold状态
hold off;