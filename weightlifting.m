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

cj_firstAttempt      = data(:,9);  % declared clean-jerk weight
cj_firstSuccess       = data(:,10);  % first successful clean-jerk weight
cj_max                = data(:,11); % max clean-jerk weight
cj_max2declared  = data(:,12); % delta between max and declared
cj_max2firstSuccess  = data(:,13); % delta between first success and max
total                       = data(:,14); % total max weight "score"

dm = [age, bweight, snatch_firstAttempt, snatch_firstSuccess, snatch_max, snatch_max2declared, cj_max2declared, snatch_max2firstSuccess, total];

labels = {...
    'age',...
    'bweight',...
    'snatch_{firstAttempt}',...
    'snatch_{firstSuccess}',...
    'snatch_{max}',...
    'snatch_{max2declared}',...
    'cj_{max2declared}',...
    'snatch_{max2firstSuccess}',...
    'total'...
    };

% labels = {'gender', 'age', 'bweight', 'snatch_firstAttempt', 'snatch_firstSuccess', 'snatch_max', 'snatch_max2declared', 'snatch_max2firstSuccess', 'cj_firstAttempt', 'cj_firstSuccess', 'cj_max', 'cj_max2declared', 'cj_max2firstSuccess', 'total'};

[h,ax] = plotmatrix(dm);
for i = 1:length(labels)
  title(ax(1,i), labels{i})
  ylabel(ax(i,1), labels{i})
end

mdl1=fitlm([age, bweight, cj_max2declared],total,'VarNames',{'age' 'bweight','cj_max2declared','total'}) 
mdl1=fitlm([age, bweight, snatch_max2declared],total,'VarNames',{'age' 'bweight','snatch_max2declared','total'}) 
mdl1=fitlm([age, bweight, snatch_max./cj_max],total,'VarNames',{'age' 'bweight','snatch_max/cj_max','total'}) 

figure
plot(mdl1)