function [ppredict1, ppredict2, pfilter1, pfilter2, psmooth1, psmooth2] = hamilton_kim(pdf_s1, pdf_s2, p11, p22)
% [ppredict1, ppredict2, pfilter1, pfilter2, psmooth1, psmooth2] = hamilton_kim(pdf_s1, pdf_s2, p11, p22)

T = length(pdf_s1);

%preallocation of vectors
pfilter1  = NaN(T,1);
pfilter2  = NaN(T,1);
ppredict1 = NaN(T,1);
ppredict2 = NaN(T,1);
psmooth1  = NaN(T,1);
psmooth2  = NaN(T,1);

%Initial prediction prob.
ppredict1(1) = (1-p22)/(2-p11-p22); %state 1
ppredict2(1) = 1-ppredict1(1); %state 2
  
for t = 1:T
    pfilter1(t) = pdf_s1(t).*ppredict1(t)./(pdf_s2(t).*ppredict2(t)+pdf_s1(t).*ppredict1(t)); % filtering
    pfilter2(t) = pdf_s2(t).*ppredict2(t)./(pdf_s2(t).*ppredict2(t)+pdf_s1(t).*ppredict1(t)); 
    if t < T
        ppredict1(t+1) = p11.*pfilter1(t)+(1-p22).*(pfilter2(t)); % prediction
        ppredict2(t+1) = p22.*pfilter2(t)+(1-p11).*(pfilter1(t));
    elseif t == T
        psmooth1(t) = pfilter1(t);
        psmooth2(t) = pfilter2(t);
        for tt = (T-1):-1:1 % smoothing
            psmooth1(tt) = pfilter1(tt)*(p11*psmooth1(tt+1)/ppredict1(tt+1) + (1-p11)*psmooth2(tt+1)/ppredict2(tt+1));
            psmooth2(tt) = pfilter2(tt)*((1-p22)*psmooth1(tt+1)/ppredict1(tt+1) + (p22)*psmooth2(tt+1)/ppredict2(tt+1));
        end
    end
end