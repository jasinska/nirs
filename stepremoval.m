function c=stepremoval(a)
a=medfilt1(a,10);
b=diff(a);
bb=conv(b,[1 1 1 1 1],'same');
z=(bb-mean(bb))/std(bb);
ind=find(abs(z)>3);
b(ind)=0;
c(1)=a(1);
for i=2:length(a);
c(i)=b(i-1)+c(i-1);
end
end