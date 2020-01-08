clear all
close all
p = 0 : 0.01 : 1;
for alpha = [0.01 0.05]
    for ii = 1 : length(p)
        for  jj = 1 : length(p)
            hitrate = p(ii); farate = p(jj);
            hitrate(hitrate > (1-alpha)) = 1-alpha;
            hitrate(hitrate < alpha) = alpha;
            farate(farate > (1-alpha)) = 1-alpha;
            farate(farate < alpha) = alpha;
            zh = erfinv(1-2.*(1-hitrate)).*sqrt(2);
            zf = erfinv(1-2.*(1-farate)).*sqrt(2);
            dp(ii,jj) = zh-zf;
            beta(ii,jj) = -(zh+zf)/2;
        end
    end
    figure;waterfall(p,p,dp)
    ylabel('hit rate')
    xlabel('false alarm rate')
    zlabel('d prime')
    title(['\alpha = ',num2str(alpha)])
    zlim([-5 5])
end