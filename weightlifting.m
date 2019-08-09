clear
close all

data = csvread('weightlifting.csv')

sex                         = data(:,1);  % sex
age                         = data(:,2);  % age
bweight                     = data(:,3);  % body weight
firstSnatchAttempt          = data(:,4);  % declared snatch weight
firstSuccessSnatch          = data(:,5);  % first successful snatch weight
maxSnatch                   = data(:,6);  % max snatch weight
firstAttemptSnatchDelta     = data(:,7);  % delta between max and declared
firstSuccessSnatchDelta     = data(:,8);  % delta between first success and max

% firstClearnjerkAttempt      = data(:,9);  % declared clean-jerk weight
% firstSuccessCleanjerk       = data(:,10);  % first successful clean-jerk weight
% maxCleanjerk                = data(:,11); % max clean-jerk weight
% firstAttemptCleanjerkDelta  = data(:,12); % delta between max and declared
% firstSuccessCleanjerkDelta  = data(:,13); % delta between first success and max
total                       = data(:,14); % total max weight "score"

dm = [age, bweight, firstSnatchAttempt, firstSuccessSnatch, maxSnatch, firstAttemptSnatchDelta, firstSuccessSnatchDelta, total];

% plotmatrix(data)
labels = {'age', 'bweight', 'firstSnatchAttempt', 'firstSuccessSnatch', 'maxSnatch', 'firstAttemptSnatchDelta', 'firstSuccessSnatchDelta', 'total'};

% labels = {'gender', 'age', 'bweight', 'first\nSnatchAttempt', 'firstSuccessSnatch', 'maxSnatch', 'firstAttemptSnatchDelta', 'firstSuccessSnatchDelta', 'firstClearnjerkAttempt', 'firstSuccessCleanjerk', 'maxCleanjerk', 'firstAttemptCleanjerkDelta', 'firstSuccessCleanjerkDelta', 'total'};
% data = [Height Weight Systolic Diastolic];

[h,ax] = plotmatrix(dm);
for i = 1:length(labels)
  title(ax(1,i), labels{i})
  ylabel(ax(i,1), labels{i})
end