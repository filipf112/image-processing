function y=mask(cofffreq,rank)
rofs = dzd(rank);
y = cofffreq*besselj(1,cofffreq*rofs)./(2*pi*rofs);
end

