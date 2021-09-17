T= readtable('Facebook.csv')
T.Properties.VariableNames
T = removevars(T,{'PostMonth','PostWeekday','PageTotalLikes','Category','LifetimePostTotalReach'});
T = removevars(T,{'LifetimePostTotalImpressions','LifetimeEngagedUsers','LifetimePostConsumers','LifetimePostConsumptions'});
T = removevars(T,{'LifetimePostTotalImpressionsByPeopleWhoHaveLikedYourPage','LifetimePostReachByPeopleWhoLikeYourPage'});
T = removevars(T,{'LifetimePostWhoHaveLikedYourPageAndEngagedWithYourPost'});
T.Properties.VariableNames
vars = {'Paid','share','like'};
T2 = T{:,vars};
T2(isnan(T2)) = 0;
T{:,vars} = T2
writetable(T,'FacebookNew.csv')

mean(T.PostHour)
max(T.PostHour)
min(T.PostHour)
histogram(T.PostHour)

histogram(T.Paid)

mean(T.comment)
max(T.comment)
min(T.comment)
histogram(T.comment)

mean(T.like)
max(T.like)
min(T.like)
histogram(T.like)

mean(T.share)
max(T.share)
min(T.share)
histogram(T.share)

mean(T.TotalInteractions)
max(T.TotalInteractions)
min(T.TotalInteractions)
histogram(T.TotalInteractions)

plot(T.like, T.share, 'Linestyle', 'none','Marker','.')
corrcoef(T.like, T.share)

plot(T.like, T.comment, 'Linestyle', 'none','Marker','.')
corrcoef(T.like, T.comment)

[a1,~,c1] = unique(T.Paid);
A1 = accumarray(c1(:),T.TotalInteractions(:));
bar(a1(:),A1(:));
corrcoef(T.Paid, T.TotalInteractions)
