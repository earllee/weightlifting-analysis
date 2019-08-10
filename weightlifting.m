clear
close all

% snatch = more technique
% clean and jerk = raw strength 

data = csvread('weightlifting.csv');

sex                         = data(:,1);  % sex
age                         = data(:,2);  % age
bweight                     = data(:,3);  % body weight
snatch_firstAttempt         = data(:,4);  % declared snatch weight
snatch_firstSuccess         = data(:,5);  % first successful snatch weight
snatch_max                  = data(:,6);  % max snatch weight
snatch_max2declared         = data(:,7);  % delta between max and declared
snatch_max2firstSuccess     = data(:,8);  % delta between first success and max

cj_firstAttempt             = data(:,9);  % declared clean-jerk weight
cj_firstSuccess             = data(:,10);  % first successful clean-jerk weight
cj_max                      = data(:,11); % max clean-jerk weight
cj_max2declared             = data(:,12); % delta between max and declared
cj_max2firstSuccess         = data(:,13); % delta between first success and max
total                       = data(:,14); % total max weight "score"

dm = [age, bweight, snatch_max./cj_max, cj_max2declared + snatch_max2declared, total];

labels = {...
    'age',...
    'bweight',...
    'snatch_{max}/cj_{max}',...
    'deltas_{total}',...
    'total'...
    };

[~,ax] = plotmatrix(dm);
for i = 1:length(labels)
  title(ax(1,i), labels{i})
  yl = ylabel(ax(i,1),labels{i},'fontweight','bold','Rotation', 0);
  yl.Position(1) = yl.Position(1) - 3.0;
end

mdl1 = fitlm([age, bweight, snatch_max./cj_max],total,'VarNames',{'age' 'bweight','snatch_max/cj_max','total'}) 

r = mdl1.Residuals.Raw;
figure
histogram(r)
figure
normplot(r)
figure
plot(mdl1)

yhat = mdl1.Fitted;
figure
[~,ax] = plotmatrix([age, bweight, snatch_max./cj_max],r);
labels = ['age','weight','ratio'];
for i = 1:length(labels)
  title(ax(1,i), labels{i})
end
figure
plotmatrix(yhat,r)