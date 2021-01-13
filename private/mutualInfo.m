function [ I ] = mutualInfo( lambda1, lambda2 )
%MUTUAL_INFO Calculate Mutual Information through numerical approximation
%
  w1=0.5; w2=0.5; %weights
  I = poisson_mixture(lambda1, lambda2) - cond_entropy(w1,lambda1, w2,lambda2);
  I = I*log2(exp(1)); %convert into 'bits' log base 2
  % Maximum MI for equal weights = 1 bit
  if isinf(I)
        I = nan;
  end
end


function [ H_Y ] = poisson_mixture( lambda1, lambda2 )
% Uses numerical integration to calculate entropy
%
  w1 = 0.5; w2 = 0.5;
  H_Y = 0;
  for y = 0:3*max(lambda1, lambda2)
     p_y1 = w1*poisspdf(y,lambda1);
     p_y2 = w2*poisspdf(y,lambda2);
     p = p_y1 + p_y2;
     H_Y = H_Y - p*log(p);
  end
end


function [ H_Yx ] = cond_entropy(w1, lambda1, w2, lambda2)
%Calculates the conditional entropy
H_Yx = w1*entropy(lambda1) + w2*entropy(lambda2);
end


function H = entropy(lambda)
%Entropy of a Poisson r.v.
% Use Stirlig approx.
 H = 0.5*log(2*pi*exp(1)*lambda)...
    -1/(12*lambda)...
    -1/(24*lambda^2);
end
