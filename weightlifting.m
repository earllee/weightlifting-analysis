clear
close all

data = csvread('weightlifting.csv')

sex                         = data(:,1);  % sex
age                         = data(:,2);  % age

firstSnatchAttempt          = data(:,3);  % declared snatch weight
firstSuccessSnatch          = data(:,4);  % first successful snatch weight
maxSnatch                   = data(:,5);  % max snatch weight
firstAttemptSnatchDelta     = data(:,6);  % delta between max and declared
firstSuccessSnatchDelta     = data(:,7);  % delta between first success and max

% firstClearnjerkAttempt      = data(:,8);  % declared clean-jerk weight
% firstSuccessCleanjerk       = data(:,9);  % first successful clean-jerk weight
% maxCleanjerk                = data(:,10); % max clean-jerk weight
% firstAttemptCleanjerkDelta  = data(:,11); % delta between max and declared
% firstSuccessCleanjerkDelta  = data(:,12); % delta between first success and max
total                       = data(:,13); % total max weight "score"

dm = [sex, age, firstSnatchAttempt, firstSuccessSnatch, maxSnatch, firstAttemptSnatchDelta, firstSuccessSnatchDelta, total];

% plotmatrix(data)
labels = {'gender', 'age', 'bweight', 'firstSnatchAttempt', 'firstSuccessSnatch', 'maxSnatch', 'firstAttemptSnatchDelta', 'firstSuccessSnatchDelta', 'total'};

% labels = {'gender', 'age', 'bweight', 'firstSnatchAttempt', 'firstSuccessSnatch', 'maxSnatch', 'firstAttemptSnatchDelta', 'firstSuccessSnatchDelta', 'firstClearnjerkAttempt', 'firstSuccessCleanjerk', 'maxCleanjerk', 'firstAttemptCleanjerkDelta', 'firstSuccessCleanjerkDelta', 'total'};
% data = [Height Weight Systolic Diastolic];

[h,ax] = plotmatrix(dm);
for i = 1:length(dm)
  title(ax(1,i), labels{i})
  ylabel(ax(i,1), labels{i})
end