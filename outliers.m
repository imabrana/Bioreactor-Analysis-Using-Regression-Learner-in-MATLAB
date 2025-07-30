% Generate some example for data testing purpose
data = [randn(100,1); 20; 12; 24; 25; 36 ]
% Detect Outliers by IQR Method
Q1 = prctile(data,25);
Q3 = prctile(data,75);
IQR = Q3 - Q1;
lower_bound = Q1 - 1.5*IQR;
upper_bound = Q3 + 1.5*IQR;
outliers_iqr = data(data < lower_bound | data > upper_bound)

% Detect Outliers by Z method 
mean_data = mean(data);
std_data = std(data);
z_score = (data - mean_data)/std_data;
threshold = 4;
outliers_z = data(abs(z_score)>threshold);

% Print the results
disp(['IQR Outliers:' num2str(outliers_iqr')]);
disp(['Z Outliers:' num2str(outliers_z')]),
