function y=dzd(number)
mr=ones(number);
orig=ceil(number/2);
for k=1:number
    mr(k,:)=(k-orig)*mr(k,:);
end
mc = mr';
y=sqrt(mr.^2+mc.^2);
y(orig,orig)=eps;
end

