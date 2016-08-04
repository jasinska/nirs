
%SUB 401004
k=nirs_data.oxyData(1,12);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,12)== k;
nirs_data.oxyData(i,12)=(nirs_data.oxyData(i,11) + nirs_data.oxyData(i,13))/2;
nirs_data.dxyData(i,12)=(nirs_data.dxyData(i,11) + nirs_data.dxyData(i,13))/2;
end
end

k=nirs_data.oxyData(1,1);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,1)== k;
nirs_data.oxyData(i,1)=(nirs_data.oxyData(i,11) + nirs_data.oxyData(i,12))/2;
nirs_data.dxyData(i,1)=(nirs_data.dxyData(i,11) + nirs_data.dxyData(i,12))/2;
end
end

k=nirs_data.oxyData(1,2);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,2)== k;
nirs_data.oxyData(i,2)=(nirs_data.oxyData(i,1) + nirs_data.oxyData(i,3))/2;
nirs_data.dxyData(i,2)=(nirs_data.dxyData(i,1) + nirs_data.dxyData(i,3))/2;
end
end

k=nirs_data.oxyData(11587,7);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,7)== k;
nirs_data.oxyData(i,7)=(nirs_data.oxyData(i,8) + nirs_data.oxyData(i,17))/2;
nirs_data.dxyData(i,7)=(nirs_data.dxyData(i,8) + nirs_data.dxyData(i,17))/2;
end
end


k=nirs_data.oxyData(11587,6);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,6)== k;
nirs_data.oxyData(i,6)=(nirs_data.oxyData(i,7) + nirs_data.oxyData(i,17))/2;
nirs_data.dxyData(i,6)=(nirs_data.dxyData(i,7) + nirs_data.dxyData(i,17))/2;
end
end

k=nirs_data.oxyData(11587,15);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,15)== k;
nirs_data.oxyData(i,15)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.dxyData(i,15)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
end
end


k=nirs_data.oxyData(1,4);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,4)== k;
nirs_data.oxyData(i,4)=(nirs_data.oxyData(i,3) + nirs_data.oxyData(i,15))/2;
nirs_data.dxyData(i,4)=(nirs_data.dxyData(i,3) + nirs_data.dxyData(i,15))/2;
end
end

k=nirs_data.oxyData(11587,5);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,5)== k;
nirs_data.oxyData(i,5)=(nirs_data.oxyData(i,4) + nirs_data.oxyData(i,6))/2;
nirs_data.dxyData(i,5)=(nirs_data.dxyData(i,4) + nirs_data.dxyData(i,6))/2;
end
end

for i=1:length(nirs_data.dxyData)
nirs_data.dxyData(i,36)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
nirs_data.dxyData(i,38)=(nirs_data.dxyData(i,27) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,37)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,49)=(nirs_data.dxyData(i,39) + nirs_data.dxyData(i,50))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,47)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,37))/2;
nirs_data.dxyData(i,48)=(nirs_data.dxyData(i,37) + nirs_data.dxyData(i,38))/2;

nirs_data.oxyData(i,36)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.oxyData(i,38)=(nirs_data.oxyData(i,27) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,37)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,49)=(nirs_data.oxyData(i,39) + nirs_data.oxyData(i,50))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,47)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,37))/2;
nirs_data.oxyData(i,48)=(nirs_data.oxyData(i,37) + nirs_data.oxyData(i,38))/2;
end


%SUB 401012
k=nirs_data.oxyData(6804,2);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,2)== k;
nirs_data.oxyData(i,2)=(nirs_data.oxyData(i,1) + nirs_data.oxyData(i,3))/2;
nirs_data.dxyData(i,2)=(nirs_data.dxyData(i,1) + nirs_data.dxyData(i,3))/2;
end
end

k=nirs_data.oxyData(6701,4);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,4)== k;
nirs_data.oxyData(i,4)=(nirs_data.oxyData(i,14) + nirs_data.oxyData(i,15))/2;
nirs_data.dxyData(i,4)=(nirs_data.dxyData(i,14) + nirs_data.dxyData(i,15))/2;
end
end

for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,6)== k;
nirs_data.oxyData(i,6)=(nirs_data.oxyData(i,5) + nirs_data.oxyData(i,7))/2;
nirs_data.dxyData(i,6)=(nirs_data.dxyData(i,5) + nirs_data.dxyData(i,7))/2;
end
end

for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,32)== -0.000000000000008053694078128903;
nirs_data.oxyData(i,32)=(nirs_data.oxyData(i,43) + nirs_data.oxyData(i,33))/2;
nirs_data.dxyData(i,32)=(nirs_data.dxyData(i,43) + nirs_data.dxyData(i,33))/2;
end
end
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,12)== -5.540401323269230e-05;
nirs_data.oxyData(i,12)=(nirs_data.oxyData(i,13) + nirs_data.oxyData(i,23))/2;
nirs_data.dxyData(i,12)=(nirs_data.dxyData(i,13) + nirs_data.dxyData(i,23))/2;
end
end
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,11)== -7.987131638901195e-15;
nirs_data.oxyData(i,11)=(nirs_data.oxyData(i,12) + nirs_data.oxyData(i,1))/2;
nirs_data.dxyData(i,11)=(nirs_data.dxyData(i,12) + nirs_data.dxyData(i,1))/2;
end
end
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,22)== -8.090454256289199e-15;
nirs_data.oxyData(i,22)=(nirs_data.oxyData(i,12) + nirs_data.oxyData(i,33))/2;
nirs_data.dxyData(i,22)=(nirs_data.dxyData(i,12) + nirs_data.dxyData(i,33))/2;
end
end
k=nirs_data.oxyData(13678,23);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,23)==k;
nirs_data.oxyData(i,23)=(nirs_data.oxyData(i,22) + nirs_data.oxyData(i,24))/2;
nirs_data.dxyData(i,23)=(nirs_data.dxyData(i,22) + nirs_data.dxyData(i,24))/2;
end
end

k=nirs_data.oxyData(12581,33);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,33)==k;
nirs_data.oxyData(i,33)=(nirs_data.oxyData(i,32) + nirs_data.oxyData(i,34))/2;
nirs_data.dxyData(i,33)=(nirs_data.dxyData(i,32) + nirs_data.dxyData(i,34))/2;
end
end
k=nirs_data.oxyData(12581,52);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,52)==k;
nirs_data.oxyData(i,52)=(nirs_data.oxyData(i,42) + nirs_data.oxyData(i,51))/2;
nirs_data.dxyData(i,52)=(nirs_data.dxyData(i,42) + nirs_data.dxyData(i,51))/2;
end
end

for i=1:length(nirs_data.dxyData)
nirs_data.dxyData(i,36)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
nirs_data.dxyData(i,38)=(nirs_data.dxyData(i,27) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,37)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,49)=(nirs_data.dxyData(i,39) + nirs_data.dxyData(i,50))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,47)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,37))/2;
nirs_data.dxyData(i,48)=(nirs_data.dxyData(i,37) + nirs_data.dxyData(i,38))/2;

nirs_data.oxyData(i,36)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.oxyData(i,38)=(nirs_data.oxyData(i,27) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,37)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,49)=(nirs_data.oxyData(i,39) + nirs_data.oxyData(i,50))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,47)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,37))/2;
nirs_data.oxyData(i,48)=(nirs_data.oxyData(i,37) + nirs_data.oxyData(i,38))/2;
end


%SUB 401037

for i=1:length(nirs_data.oxyData)

if nirs_data.oxyData(i,2)== -2.207780593544538;
nirs_data.oxyData(i,2)=(nirs_data.oxyData(i,1) + nirs_data.oxyData(i,3))/2;
nirs_data.dxyData(i,2)=(nirs_data.dxyData(i,1) + nirs_data.dxyData(i,3))/2;
end

if nirs_data.oxyData(i,8)== -2.386377224127068;
nirs_data.oxyData(i,8)=(nirs_data.oxyData(i,7) + nirs_data.oxyData(i,9))/2;
nirs_data.dxyData(i,8)=(nirs_data.dxyData(i,7) + nirs_data.dxyData(i,9))/2;
end

end

for i=4854:length(nirs_data.oxyData)
    nirs_data.oxyData(i,41)=(nirs_data.oxyData(i,30) + nirs_data.oxyData(i,31))/2;
    nirs_data.oxyData(i,52)=(nirs_data.oxyData(i,41) + nirs_data.oxyData(i,42))/2;
    nirs_data.oxyData(i,51)=(nirs_data.oxyData(i,41) + nirs_data.oxyData(i,40))/2;
    nirs_data.dxyData(i,41)=(nirs_data.dxyData(i,30) + nirs_data.dxyData(i,31))/2;
    nirs_data.dxyData(i,52)=(nirs_data.dxyData(i,41) + nirs_data.dxyData(i,42))/2;
    nirs_data.dxyData(i,51)=(nirs_data.dxyData(i,41) + nirs_data.dxyData(i,40))/2;
end

for i=1:length(nirs_data.dxyData)
nirs_data.dxyData(i,36)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
nirs_data.dxyData(i,38)=(nirs_data.dxyData(i,27) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,37)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,49)=(nirs_data.dxyData(i,39) + nirs_data.dxyData(i,50))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,47)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,37))/2;
nirs_data.dxyData(i,48)=(nirs_data.dxyData(i,37) + nirs_data.dxyData(i,38))/2;
end
for i=1:length(nirs_data.oxyData)
nirs_data.oxyData(i,36)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.oxyData(i,38)=(nirs_data.oxyData(i,27) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,37)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,49)=(nirs_data.oxyData(i,39) + nirs_data.oxyData(i,50))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,47)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,37))/2;
nirs_data.oxyData(i,48)=(nirs_data.oxyData(i,37) + nirs_data.oxyData(i,38))/2;
end


%SUB401038


k=nirs_data.oxyData(2483,2);
for i=1:length(nirs_data.oxyData)
    if nirs_data.oxyData(i,2)==k; 
        nirs_data.oxyData(i,2)=(nirs_data.oxyData(i,12) + nirs_data.oxyData(i,13))/2;
        nirs_data.dxyData(i,2)=(nirs_data.dxyData(i,12) + nirs_data.dxyData(i,13))/2;
    end
end

k=nirs_data.oxyData(10455,3);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,3)==k;
    nirs_data.oxyData(i,3)=(nirs_data.oxyData(i,13) + nirs_data.oxyData(i,14))/2;
    nirs_data.dxyData(i,3)=(nirs_data.dxyData(i,13) + nirs_data.dxyData(i,14))/2;
else
end
end

k=nirs_data.oxyData(10455,41);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,41)== k;
nirs_data.oxyData(i,41)=(nirs_data.oxyData(i,40) + nirs_data.oxyData(i,42))/2;
nirs_data.dxyData(i,41)=(nirs_data.dxyData(i,42) + nirs_data.dxyData(i,40))/2;
end
end

for i=1:length(nirs_data.dxyData)
nirs_data.dxyData(i,36)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
nirs_data.dxyData(i,38)=(nirs_data.dxyData(i,27) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,37)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,49)=(nirs_data.dxyData(i,39) + nirs_data.dxyData(i,50))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,47)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,37))/2;
nirs_data.dxyData(i,48)=(nirs_data.dxyData(i,37) + nirs_data.dxyData(i,38))/2;
end
for i=1:length(nirs_data.oxyData)
nirs_data.oxyData(i,36)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.oxyData(i,38)=(nirs_data.oxyData(i,27) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,37)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,49)=(nirs_data.oxyData(i,39) + nirs_data.oxyData(i,50))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,47)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,37))/2;
nirs_data.oxyData(i,48)=(nirs_data.oxyData(i,37) + nirs_data.oxyData(i,38))/2;
end

%SUB401016

k=nirs_data.oxyData(188,2);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,2)==k;
nirs_data.oxyData(i,2)=(nirs_data.oxyData(i,12) + nirs_data.oxyData(i,13))/2;
nirs_data.dxyData(i,2)=(nirs_data.dxyData(i,12) + nirs_data.dxyData(i,13))/2;
else
end
end

k=nirs_data.oxyData(4011,1);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,1)== k;
nirs_data.oxyData(i,1)=(nirs_data.oxyData(i,11) + nirs_data.oxyData(i,12))/2;
nirs_data.dxyData(i,1)=(nirs_data.dxyData(i,11) + nirs_data.dxyData(i,12))/2;
end
end

k=nirs_data.oxyData(4011,8);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,8)== k;
nirs_data.oxyData(i,8)=(nirs_data.oxyData(i,7) + nirs_data.oxyData(i,9))/2;
nirs_data.dxyData(i,8)=(nirs_data.dxyData(i,7) + nirs_data.dxyData(i,9))/2;
end
end

k=nirs_data.oxyData(8339,20);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,20)== k;
nirs_data.oxyData(i,20)=(nirs_data.oxyData(i,19) + nirs_data.oxyData(i,9))/2;
nirs_data.dxyData(i,20)=(nirs_data.dxyData(i,19) + nirs_data.dxyData(i,9))/2;
end
end

k=nirs_data.oxyData(9953,41);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,41)== k;
nirs_data.oxyData(i,41)=(nirs_data.oxyData(i,51) + nirs_data.oxyData(i,52))/2;
nirs_data.dxyData(i,41)=(nirs_data.dxyData(i,51) + nirs_data.dxyData(i,52))/2;
end
end

k=nirs_data.oxyData(9953,31);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,31)== k;
nirs_data.oxyData(i,31)=(nirs_data.oxyData(i,41) + nirs_data.oxyData(i,42))/2;
nirs_data.dxyData(i,31)=(nirs_data.dxyData(i,41) + nirs_data.dxyData(i,42))/2;
end
end

k=nirs_data.oxyData(9953,21);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,21)== k;
nirs_data.oxyData(i,21)=(nirs_data.oxyData(i,31) + nirs_data.oxyData(i,20))/2;
nirs_data.dxyData(i,21)=(nirs_data.dxyData(i,31) + nirs_data.dxyData(i,20))/2;
end
end

k=nirs_data.oxyData(9953,10);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,10)== k;
nirs_data.oxyData(i,10)=(nirs_data.oxyData(i,20) + nirs_data.oxyData(i,9))/2;
nirs_data.dxyData(i,10)=(nirs_data.dxyData(i,20) + nirs_data.dxyData(i,9))/2;
end
end

k=nirs_data.oxyData(3984,23);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,23)== k;
nirs_data.oxyData(i,23)=(nirs_data.oxyData(i,12) + nirs_data.oxyData(i,13))/2;
nirs_data.dxyData(i,23)=(nirs_data.dxyData(i,12) + nirs_data.dxyData(i,13))/2;
end
end

k=nirs_data.oxyData(9953,26);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,26)== k;
nirs_data.oxyData(i,26)=(nirs_data.oxyData(i,15) + nirs_data.oxyData(i,25))/2;
nirs_data.dxyData(i,26)=(nirs_data.dxyData(i,15) + nirs_data.dxyData(i,25))/2;
end
end

k=nirs_data.oxyData(3984,27);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,27)== k;
nirs_data.oxyData(i,27)=(nirs_data.oxyData(i,26) + nirs_data.oxyData(i,28))/2;
nirs_data.dxyData(i,27)=(nirs_data.dxyData(i,26) + nirs_data.dxyData(i,28))/2;
end
end

k=nirs_data.oxyData(9953,30);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,30)== k;
nirs_data.oxyData(i,30)=(nirs_data.oxyData(i,29) + nirs_data.oxyData(i,31))/2;
nirs_data.dxyData(i,30)=(nirs_data.dxyData(i,29) + nirs_data.dxyData(i,31))/2;
end
end

k=nirs_data.oxyData(3984,33);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,33)== k;
nirs_data.oxyData(i,33)=(nirs_data.oxyData(i,32) + nirs_data.oxyData(i,34))/2;
nirs_data.dxyData(i,33)=(nirs_data.dxyData(i,32) + nirs_data.dxyData(i,34))/2;
end
end

k=nirs_data.oxyData(3984,44);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,44)== k;
nirs_data.oxyData(i,44)=(nirs_data.oxyData(i,43) + nirs_data.oxyData(i,45))/2;
nirs_data.dxyData(i,44)=(nirs_data.dxyData(i,43) + nirs_data.dxyData(i,45))/2;
end
end

k=nirs_data.oxyData(8938,34);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,34)== k;
nirs_data.oxyData(i,34)=(nirs_data.oxyData(i,33) + nirs_data.oxyData(i,35))/2;
nirs_data.dxyData(i,34)=(nirs_data.dxyData(i,33) + nirs_data.dxyData(i,35))/2;
end
end

for i=1:length(nirs_data.dxyData)
nirs_data.dxyData(i,36)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
nirs_data.dxyData(i,38)=(nirs_data.dxyData(i,27) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,37)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,49)=(nirs_data.dxyData(i,39) + nirs_data.dxyData(i,50))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,47)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,37))/2;
nirs_data.dxyData(i,48)=(nirs_data.dxyData(i,37) + nirs_data.dxyData(i,38))/2;
end
for i=1:length(nirs_data.oxyData)
nirs_data.oxyData(i,36)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.oxyData(i,38)=(nirs_data.oxyData(i,27) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,37)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,49)=(nirs_data.oxyData(i,39) + nirs_data.oxyData(i,50))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,47)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,37))/2;
nirs_data.oxyData(i,48)=(nirs_data.oxyData(i,37) + nirs_data.oxyData(i,38))/2;
end

%SUB 401013
k=nirs_data.oxyData(6198,7);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,7)== k;
nirs_data.oxyData(i,7)=(nirs_data.oxyData(i,6) + nirs_data.oxyData(i,8))/2;
nirs_data.dxyData(i,7)=(nirs_data.dxyData(i,6) + nirs_data.dxyData(i,8))/2;
end
end
k=nirs_data.oxyData(8624,13);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,13)== k;
nirs_data.oxyData(i,13)=(nirs_data.oxyData(i,12) + nirs_data.oxyData(i,14))/2;
nirs_data.dxyData(i,13)=(nirs_data.dxyData(i,12) + nirs_data.dxyData(i,14))/2;
end
end
for i=1:length(nirs_data.dxyData)
nirs_data.dxyData(i,36)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
nirs_data.dxyData(i,38)=(nirs_data.dxyData(i,27) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,37)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,49)=(nirs_data.dxyData(i,39) + nirs_data.dxyData(i,50))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,47)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,37))/2;
nirs_data.dxyData(i,48)=(nirs_data.dxyData(i,37) + nirs_data.dxyData(i,38))/2;
end
for i=1:length(nirs_data.oxyData)
nirs_data.oxyData(i,36)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.oxyData(i,38)=(nirs_data.oxyData(i,27) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,37)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,49)=(nirs_data.oxyData(i,39) + nirs_data.oxyData(i,50))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,47)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,37))/2;
nirs_data.oxyData(i,48)=(nirs_data.oxyData(i,37) + nirs_data.oxyData(i,38))/2;
end

%SUB 401044
k=nirs_data.oxyData(5108,1);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,1)== k;
nirs_data.oxyData(i,1)=(nirs_data.oxyData(i,11) + nirs_data.oxyData(i,12))/2;
nirs_data.dxyData(i,1)=(nirs_data.dxyData(i,11) + nirs_data.dxyData(i,12))/2;
end
end
k=nirs_data.oxyData(5108,2);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,2)== k;
nirs_data.oxyData(i,2)=(nirs_data.oxyData(i,12) + nirs_data.oxyData(i,13))/2;
nirs_data.dxyData(i,2)=(nirs_data.dxyData(i,12) + nirs_data.dxyData(i,13))/2;
end
end
k=nirs_data.oxyData(10265,3);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,3)== k;
nirs_data.oxyData(i,3)=(nirs_data.oxyData(i,13) + nirs_data.oxyData(i,14))/2;
nirs_data.dxyData(i,3)=(nirs_data.dxyData(i,13) + nirs_data.dxyData(i,14))/2;
end
end
k=nirs_data.oxyData(10265,4);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,4)== k;
nirs_data.oxyData(i,4)=(nirs_data.oxyData(i,14) + nirs_data.oxyData(i,15))/2;
nirs_data.dxyData(i,4)=(nirs_data.dxyData(i,14) + nirs_data.dxyData(i,15))/2;
end
end
for i=8805:length(nirs_data.oxyData)
nirs_data.oxyData(i,5)=(nirs_data.oxyData(i,15) + nirs_data.oxyData(i,16))/2;
nirs_data.dxyData(i,5)=(nirs_data.dxyData(i,15) + nirs_data.dxyData(i,16))/2;
end
for i=3100:length(nirs_data.oxyData)
nirs_data.oxyData(i,34)=(nirs_data.oxyData(i,23) + nirs_data.oxyData(i,44))/2;
nirs_data.dxyData(i,34)=(nirs_data.dxyData(i,23) + nirs_data.dxyData(i,44))/2;
end
k=nirs_data.oxyData(7517,8);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,8)== k;
nirs_data.oxyData(i,8)=(nirs_data.oxyData(i,18) + nirs_data.oxyData(i,19))/2;
nirs_data.dxyData(i,8)=(nirs_data.dxyData(i,18) + nirs_data.dxyData(i,19))/2;
end
end
k=nirs_data.oxyData(7517,7);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,7)== k;
nirs_data.oxyData(i,7)=(nirs_data.oxyData(i,6) + nirs_data.oxyData(i,8))/2;
nirs_data.dxyData(i,7)=(nirs_data.dxyData(i,6) + nirs_data.dxyData(i,8))/2;
end
end
k=nirs_data.oxyData(8160,6);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,6)== k;
nirs_data.oxyData(i,6)=(nirs_data.oxyData(i,5) + nirs_data.oxyData(i,7))/2;
nirs_data.dxyData(i,6)=(nirs_data.dxyData(i,5) + nirs_data.dxyData(i,7))/2;
end
end
k=nirs_data.oxyData(8160,9);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,9)== k;
nirs_data.oxyData(i,9)=(nirs_data.oxyData(i,19) + nirs_data.oxyData(i,20))/2;
nirs_data.dxyData(i,9)=(nirs_data.dxyData(i,19) + nirs_data.dxyData(i,20))/2;
end
end
k=nirs_data.oxyData(8160,10);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,10)== k;
nirs_data.oxyData(i,10)=(nirs_data.oxyData(i,21) + nirs_data.oxyData(i,20))/2;
nirs_data.dxyData(i,10)=(nirs_data.dxyData(i,21) + nirs_data.dxyData(i,20))/2;
end
end
for i=1:length(nirs_data.dxyData)
nirs_data.dxyData(i,35)=(nirs_data.dxyData(i,24) + nirs_data.dxyData(i,25))/2;
nirs_data.dxyData(i,36)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
nirs_data.dxyData(i,39)=(nirs_data.dxyData(i,28) + nirs_data.dxyData(i,29))/2;
nirs_data.dxyData(i,38)=(nirs_data.dxyData(i,27) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,37)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,45)=(nirs_data.dxyData(i,34) + nirs_data.dxyData(i,44))/2;
nirs_data.dxyData(i,50)=(nirs_data.dxyData(i,40) + nirs_data.dxyData(i,51))/2;
nirs_data.dxyData(i,49)=(nirs_data.dxyData(i,39) + nirs_data.dxyData(i,50))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,47)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,37))/2;
nirs_data.dxyData(i,48)=(nirs_data.dxyData(i,37) + nirs_data.dxyData(i,38))/2;
end
for i=1:length(nirs_data.oxyData)
nirs_data.oxyData(i,35)=(nirs_data.oxyData(i,24) + nirs_data.oxyData(i,25))/2;
nirs_data.oxyData(i,36)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.oxyData(i,39)=(nirs_data.oxyData(i,28) + nirs_data.oxyData(i,29))/2;
nirs_data.oxyData(i,38)=(nirs_data.oxyData(i,27) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,37)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,45)=(nirs_data.oxyData(i,34) + nirs_data.oxyData(i,44))/2;
nirs_data.oxyData(i,50)=(nirs_data.oxyData(i,40) + nirs_data.oxyData(i,51))/2;
nirs_data.oxyData(i,49)=(nirs_data.oxyData(i,39) + nirs_data.oxyData(i,50))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,47)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,37))/2;
nirs_data.oxyData(i,48)=(nirs_data.oxyData(i,37) + nirs_data.oxyData(i,38))/2;
end


%SUB 401017
k=nirs_data.oxyData(1,11);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,11)== k;
nirs_data.oxyData(i,11)=(nirs_data.oxyData(i,1) + nirs_data.oxyData(i,22))/2;
nirs_data.dxyData(i,11)=(nirs_data.dxyData(i,1) + nirs_data.dxyData(i,22))/2;
end
end
k=nirs_data.oxyData(3210,31);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,31)== k;
nirs_data.oxyData(i,31)=(nirs_data.oxyData(i,41) + nirs_data.oxyData(i,42))/2;
nirs_data.dxyData(i,31)=(nirs_data.dxyData(i,41) + nirs_data.dxyData(i,42))/2;
end
end
k=nirs_data.oxyData(3100,21);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,21)== k;
nirs_data.oxyData(i,21)=(nirs_data.oxyData(i,10) + nirs_data.oxyData(i,20))/2;
nirs_data.dxyData(i,21)=(nirs_data.dxyData(i,10) + nirs_data.dxyData(i,20))/2;
end
end


%SUB 401045
k=nirs_data.oxyData(1,1);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,1)== k;
nirs_data.oxyData(i,1)=(nirs_data.oxyData(i,3) + nirs_data.oxyData(i,4))/2;
nirs_data.dxyData(i,1)=(nirs_data.dxyData(i,3) + nirs_data.dxyData(i,4))/2;
end
end
k=nirs_data.oxyData(1,14);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,14)== k;
nirs_data.oxyData(i,14)=(nirs_data.oxyData(i,16) + nirs_data.oxyData(i,17))/2;
nirs_data.dxyData(i,14)=(nirs_data.dxyData(i,16) + nirs_data.dxyData(i,17))/2;
end
end


%SUB 401036?
k=nirs_data.oxyData(1,2);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,2)== k;
nirs_data.oxyData(i,2)=(nirs_data.oxyData(i,12) + nirs_data.oxyData(i,13))/2;
nirs_data.dxyData(i,2)=(nirs_data.dxyData(i,12) + nirs_data.dxyData(i,13))/2;
end
end
k=nirs_data.oxyData(1,3);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,3)== k;
nirs_data.oxyData(i,3)=(nirs_data.oxyData(i,2) + nirs_data.oxyData(i,4))/2;
nirs_data.dxyData(i,3)=(nirs_data.dxyData(i,2) + nirs_data.dxyData(i,4))/2;
end
end
k=nirs_data.oxyData(1,9);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,9)== k;
nirs_data.oxyData(i,9)=(nirs_data.oxyData(i,10) + nirs_data.oxyData(i,8))/2;
nirs_data.dxyData(i,9)=(nirs_data.dxyData(i,10) + nirs_data.dxyData(i,8))/2;
end
end
k=nirs_data.oxyData(4027,26);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,26)== k;
nirs_data.oxyData(i,26)=(nirs_data.oxyData(i,16) + nirs_data.oxyData(i,15))/2;
nirs_data.dxyData(i,26)=(nirs_data.dxyData(i,16) + nirs_data.dxyData(i,15))/2;
end
end
k=nirs_data.oxyData(4027,27);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,27)== k;
nirs_data.oxyData(i,27)=(nirs_data.oxyData(i,26) + nirs_data.oxyData(i,28))/2;
nirs_data.dxyData(i,27)=(nirs_data.dxyData(i,26) + nirs_data.dxyData(i,28))/2;
end
end
k=nirs_data.oxyData(4027,33);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,33)== k;
nirs_data.oxyData(i,33)=(nirs_data.oxyData(i,34) + nirs_data.oxyData(i,32))/2;
nirs_data.dxyData(i,33)=(nirs_data.dxyData(i,34) + nirs_data.dxyData(i,32))/2;
end
end
k=nirs_data.oxyData(4027,43);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,43)== k;
nirs_data.oxyData(i,43)=(nirs_data.oxyData(i,33) + nirs_data.oxyData(i,32))/2;
nirs_data.dxyData(i,43)=(nirs_data.dxyData(i,33) + nirs_data.dxyData(i,32))/2;
end
end
k=nirs_data.oxyData(4027,44);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,44)== k;
nirs_data.oxyData(i,44)=(nirs_data.oxyData(i,43) + nirs_data.oxyData(i,45))/2;
nirs_data.dxyData(i,44)=(nirs_data.dxyData(i,43) + nirs_data.dxyData(i,45))/2;
end
end
k=nirs_data.oxyData(4027,51);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,51)== k;
nirs_data.oxyData(i,51)=(nirs_data.oxyData(i,50) + nirs_data.oxyData(i,52))/2;
nirs_data.dxyData(i,51)=(nirs_data.dxyData(i,50) + nirs_data.dxyData(i,52))/2;
end
end
for i=1:length(nirs_data.dxyData)
nirs_data.dxyData(i,35)=(nirs_data.dxyData(i,24) + nirs_data.dxyData(i,25))/2;
nirs_data.dxyData(i,36)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
nirs_data.dxyData(i,38)=(nirs_data.dxyData(i,27) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,37)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,45)=(nirs_data.dxyData(i,34) + nirs_data.dxyData(i,44))/2;
nirs_data.dxyData(i,50)=(nirs_data.dxyData(i,40) + nirs_data.dxyData(i,51))/2;
nirs_data.dxyData(i,49)=(nirs_data.dxyData(i,39) + nirs_data.dxyData(i,50))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,47)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,37))/2;
nirs_data.dxyData(i,48)=(nirs_data.dxyData(i,37) + nirs_data.dxyData(i,38))/2;
end
for i=1:length(nirs_data.oxyData)
nirs_data.oxyData(i,35)=(nirs_data.oxyData(i,24) + nirs_data.oxyData(i,25))/2;
nirs_data.oxyData(i,36)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.oxyData(i,38)=(nirs_data.oxyData(i,27) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,37)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,45)=(nirs_data.oxyData(i,34) + nirs_data.oxyData(i,44))/2;
nirs_data.oxyData(i,50)=(nirs_data.oxyData(i,40) + nirs_data.oxyData(i,51))/2;
nirs_data.oxyData(i,49)=(nirs_data.oxyData(i,39) + nirs_data.oxyData(i,50))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,47)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,37))/2;
nirs_data.oxyData(i,48)=(nirs_data.oxyData(i,37) + nirs_data.oxyData(i,38))/2;
end



%SUB 401028
k=nirs_data.oxyData(1,5);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,5)== k;
nirs_data.oxyData(i,5)=(nirs_data.oxyData(i,6) + nirs_data.oxyData(i,15))/2;
nirs_data.dxyData(i,5)=(nirs_data.dxyData(i,6) + nirs_data.dxyData(i,15))/2;
end
end
k=nirs_data.oxyData(1,24);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,24)== k;
nirs_data.oxyData(i,24)=(nirs_data.oxyData(i,23) + nirs_data.oxyData(i,25))/2;
nirs_data.dxyData(i,24)=(nirs_data.dxyData(i,23) + nirs_data.dxyData(i,25))/2;
end
end
k=nirs_data.oxyData(1,29);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,29)== k;
nirs_data.oxyData(i,29)=(nirs_data.oxyData(i,30) + nirs_data.oxyData(i,28))/2;
nirs_data.dxyData(i,29)=(nirs_data.dxyData(i,30) + nirs_data.dxyData(i,28))/2;
end
end
k=nirs_data.oxyData(4027,41);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,41)== k;
nirs_data.oxyData(i,41)=(nirs_data.oxyData(i,40) + nirs_data.oxyData(i,42))/2;
nirs_data.dxyData(i,41)=(nirs_data.dxyData(i,40) + nirs_data.dxyData(i,42))/2;
end
end
k=nirs_data.oxyData(4027,27);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,27)== k;
nirs_data.oxyData(i,27)=(nirs_data.oxyData(i,26) + nirs_data.oxyData(i,28))/2;
nirs_data.dxyData(i,27)=(nirs_data.dxyData(i,26) + nirs_data.dxyData(i,28))/2;
end
end
k=nirs_data.oxyData(4027,33);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,33)== k;
nirs_data.oxyData(i,33)=(nirs_data.oxyData(i,34) + nirs_data.oxyData(i,32))/2;
nirs_data.dxyData(i,33)=(nirs_data.dxyData(i,34) + nirs_data.dxyData(i,32))/2;
end
end
k=nirs_data.oxyData(4027,43);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,43)== k;
nirs_data.oxyData(i,43)=(nirs_data.oxyData(i,33) + nirs_data.oxyData(i,32))/2;
nirs_data.dxyData(i,43)=(nirs_data.dxyData(i,33) + nirs_data.dxyData(i,32))/2;
end
end
k=nirs_data.oxyData(4027,44);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,44)== k;
nirs_data.oxyData(i,44)=(nirs_data.oxyData(i,43) + nirs_data.oxyData(i,45))/2;
nirs_data.dxyData(i,44)=(nirs_data.dxyData(i,43) + nirs_data.dxyData(i,45))/2;
end
end
k=nirs_data.oxyData(4027,51);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,51)== k;
nirs_data.oxyData(i,51)=(nirs_data.oxyData(i,50) + nirs_data.oxyData(i,52))/2;
nirs_data.dxyData(i,51)=(nirs_data.dxyData(i,50) + nirs_data.dxyData(i,52))/2;
end
end
for i=1:length(nirs_data.dxyData)
nirs_data.dxyData(i,52)=(nirs_data.dxyData(i,41) + nirs_data.dxyData(i,42))/2;
nirs_data.dxyData(i,51)=(nirs_data.dxyData(i,41) + nirs_data.dxyData(i,40))/2;
nirs_data.dxyData(i,35)=(nirs_data.dxyData(i,24) + nirs_data.dxyData(i,25))/2;
nirs_data.dxyData(i,36)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
nirs_data.dxyData(i,38)=(nirs_data.dxyData(i,27) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,37)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,39)=(nirs_data.dxyData(i,28) + nirs_data.dxyData(i,29))/2;
nirs_data.dxyData(i,45)=(nirs_data.dxyData(i,34) + nirs_data.dxyData(i,44))/2;
nirs_data.dxyData(i,50)=(nirs_data.dxyData(i,40) + nirs_data.dxyData(i,51))/2;
nirs_data.dxyData(i,49)=(nirs_data.dxyData(i,39) + nirs_data.dxyData(i,50))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,47)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,37))/2;
nirs_data.dxyData(i,48)=(nirs_data.dxyData(i,37) + nirs_data.dxyData(i,38))/2;
end
for i=1:length(nirs_data.oxyData)

nirs_data.oxyData(i,52)=(nirs_data.oxyData(i,41) + nirs_data.oxyData(i,42))/2;
nirs_data.oxyData(i,51)=(nirs_data.oxyData(i,41) + nirs_data.oxyData(i,40))/2;
nirs_data.oxyData(i,35)=(nirs_data.oxyData(i,24) + nirs_data.oxyData(i,25))/2;
nirs_data.oxyData(i,36)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.oxyData(i,39)=(nirs_data.oxyData(i,28) + nirs_data.oxyData(i,29))/2;
nirs_data.oxyData(i,38)=(nirs_data.oxyData(i,27) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,37)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,45)=(nirs_data.oxyData(i,34) + nirs_data.oxyData(i,44))/2;
nirs_data.oxyData(i,50)=(nirs_data.oxyData(i,40) + nirs_data.oxyData(i,51))/2;
nirs_data.oxyData(i,49)=(nirs_data.oxyData(i,39) + nirs_data.oxyData(i,50))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,47)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,37))/2;
nirs_data.oxyData(i,48)=(nirs_data.oxyData(i,37) + nirs_data.oxyData(i,38))/2;

end

%401025
for i=1:length(nirs_data.dxyData)
nirs_data.dxyData(i,52)=(nirs_data.dxyData(i,31) + nirs_data.dxyData(i,42))/2;
nirs_data.dxyData(i,51)=(nirs_data.dxyData(i,30) + nirs_data.dxyData(i,40))/2;
nirs_data.dxyData(i,36)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
nirs_data.dxyData(i,38)=(nirs_data.dxyData(i,27) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,37)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,49)=(nirs_data.dxyData(i,39) + nirs_data.dxyData(i,50))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,47)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,37))/2;
nirs_data.dxyData(i,48)=(nirs_data.dxyData(i,37) + nirs_data.dxyData(i,38))/2;
end
for i=1:length(nirs_data.oxyData)

nirs_data.oxyData(i,52)=(nirs_data.oxyData(i,31) + nirs_data.oxyData(i,42))/2;
nirs_data.oxyData(i,51)=(nirs_data.oxyData(i,30) + nirs_data.oxyData(i,40))/2;
nirs_data.oxyData(i,36)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.oxyData(i,38)=(nirs_data.oxyData(i,27) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,37)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,49)=(nirs_data.oxyData(i,39) + nirs_data.oxyData(i,50))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,47)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,37))/2;
nirs_data.oxyData(i,48)=(nirs_data.oxyData(i,37) + nirs_data.oxyData(i,38))/2;

end

%401014
for i=1:length(nirs_data.dxyData)
nirs_data.dxyData(i,52)=(nirs_data.dxyData(i,31) + nirs_data.dxyData(i,42))/2;
nirs_data.dxyData(i,41)=(nirs_data.dxyData(i,42) + nirs_data.dxyData(i,40))/2;
nirs_data.dxyData(i,36)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
nirs_data.dxyData(i,38)=(nirs_data.dxyData(i,27) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,37)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,49)=(nirs_data.dxyData(i,39) + nirs_data.dxyData(i,50))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,47)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,37))/2;
nirs_data.dxyData(i,48)=(nirs_data.dxyData(i,37) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,26)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,27))/2;
nirs_data.dxyData(i,22)=(nirs_data.dxyData(i,11) + nirs_data.dxyData(i,12))/2;
nirs_data.dxyData(i,13)=(nirs_data.dxyData(i,14) + nirs_data.dxyData(i,12))/2;
end
for i=1:length(nirs_data.oxyData)

nirs_data.oxyData(i,52)=(nirs_data.oxyData(i,31) + nirs_data.oxyData(i,42))/2;
nirs_data.oxyData(i,41)=(nirs_data.oxyData(i,42) + nirs_data.oxyData(i,40))/2;
nirs_data.oxyData(i,36)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.oxyData(i,38)=(nirs_data.oxyData(i,27) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,37)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,49)=(nirs_data.oxyData(i,39) + nirs_data.oxyData(i,50))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,47)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,37))/2;
nirs_data.oxyData(i,48)=(nirs_data.oxyData(i,37) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,26)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,27))/2;
nirs_data.oxyData(i,22)=(nirs_data.oxyData(i,11) + nirs_data.oxyData(i,12))/2;
nirs_data.oxyData(i,13)=(nirs_data.oxyData(i,14) + nirs_data.oxyData(i,12))/2;
end

%401022
for i=1:length(nirs_data.dxyData)
nirs_data.dxyData(i,35)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,24))/2;
nirs_data.dxyData(i,39)=(nirs_data.dxyData(i,29) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,36)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
nirs_data.dxyData(i,38)=(nirs_data.dxyData(i,27) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,37)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,45)=(nirs_data.dxyData(i,44) + nirs_data.dxyData(i,34))/2;
nirs_data.dxyData(i,50)=(nirs_data.dxyData(i,40) + nirs_data.dxyData(i,51))/2;
nirs_data.dxyData(i,49)=(nirs_data.dxyData(i,39) + nirs_data.dxyData(i,50))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,47)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,37))/2;
nirs_data.dxyData(i,48)=(nirs_data.dxyData(i,37) + nirs_data.dxyData(i,38))/2;

end
for i=1:length(nirs_data.oxyData)
nirs_data.oxyData(i,35)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,24))/2;
nirs_data.oxyData(i,39)=(nirs_data.oxyData(i,29) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,36)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.oxyData(i,38)=(nirs_data.oxyData(i,27) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,37)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,45)=(nirs_data.oxyData(i,44) + nirs_data.oxyData(i,34))/2;
nirs_data.oxyData(i,50)=(nirs_data.oxyData(i,40) + nirs_data.oxyData(i,51))/2;
nirs_data.oxyData(i,49)=(nirs_data.oxyData(i,39) + nirs_data.oxyData(i,50))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,47)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,37))/2;
nirs_data.oxyData(i,48)=(nirs_data.oxyData(i,37) + nirs_data.oxyData(i,38))/2;

end


%401049
k=nirs_data.oxyData(12828,9);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,9)== k;
nirs_data.oxyData(i,9)=(nirs_data.oxyData(i,30) + nirs_data.oxyData(i,19))/2;
nirs_data.dxyData(i,9)=(nirs_data.dxyData(i,30) + nirs_data.dxyData(i,19))/2;
end
end
k=nirs_data.oxyData(12828,8);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,8)== k;
nirs_data.oxyData(i,8)=(nirs_data.oxyData(i,18) + nirs_data.oxyData(i,19))/2;
nirs_data.dxyData(i,8)=(nirs_data.dxyData(i,18) + nirs_data.dxyData(i,19))/2;
end
end
k=nirs_data.oxyData(9367,11);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,11)== k;
nirs_data.oxyData(i,11)=(nirs_data.oxyData(i,32) + nirs_data.oxyData(i,22))/2;
nirs_data.dxyData(i,11)=(nirs_data.dxyData(i,32) + nirs_data.dxyData(i,22))/2;
end
end
k=nirs_data.oxyData(9367,1);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,1)== k;
nirs_data.oxyData(i,1)=(nirs_data.oxyData(i,2) + nirs_data.oxyData(i,11))/2;
nirs_data.dxyData(i,1)=(nirs_data.dxyData(i,2) + nirs_data.dxyData(i,11))/2;
end
end
for i=1:length(nirs_data.dxyData)
nirs_data.dxyData(i,36)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
nirs_data.dxyData(i,38)=(nirs_data.dxyData(i,27) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,37)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,49)=(nirs_data.dxyData(i,39) + nirs_data.dxyData(i,50))/2;
nirs_data.dxyData(i,46)=(nirs_data.dxyData(i,35) + nirs_data.dxyData(i,45))/2;
nirs_data.dxyData(i,47)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,37))/2;
nirs_data.dxyData(i,48)=(nirs_data.dxyData(i,37) + nirs_data.dxyData(i,38))/2;
end
for i=1:length(nirs_data.oxyData)
nirs_data.oxyData(i,36)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.oxyData(i,38)=(nirs_data.oxyData(i,27) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,37)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,49)=(nirs_data.oxyData(i,39) + nirs_data.oxyData(i,50))/2;
nirs_data.oxyData(i,46)=(nirs_data.oxyData(i,35) + nirs_data.oxyData(i,45))/2;
nirs_data.oxyData(i,47)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,37))/2;
nirs_data.oxyData(i,48)=(nirs_data.oxyData(i,37) + nirs_data.oxyData(i,38))/2;
end




%401050
k=nirs_data.oxyData(12691,22);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,22)== k;
nirs_data.oxyData(i,22)=(nirs_data.oxyData(i,11) + nirs_data.oxyData(i,32))/2;
nirs_data.dxyData(i,22)=(nirs_data.dxyData(i,11) + nirs_data.dxyData(i,32))/2;
end
end
k=nirs_data.oxyData(12691,29);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,29)== k;
nirs_data.oxyData(i,29)=(nirs_data.oxyData(i,18) + nirs_data.oxyData(i,19))/2;
nirs_data.dxyData(i,29)=(nirs_data.dxyData(i,18) + nirs_data.dxyData(i,19))/2;
end
end
k=nirs_data.oxyData(12691,30);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,30)== k;
nirs_data.oxyData(i,30)=(nirs_data.oxyData(i,19) + nirs_data.oxyData(i,20))/2;
nirs_data.dxyData(i,30)=(nirs_data.dxyData(i,19) + nirs_data.dxyData(i,20))/2;
end
end
k=nirs_data.oxyData(12691,33);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,33)== k;
nirs_data.oxyData(i,33)=(nirs_data.oxyData(i,32) + nirs_data.oxyData(i,43))/2;
nirs_data.dxyData(i,33)=(nirs_data.dxyData(i,32) + nirs_data.dxyData(i,43))/2;
end
end
k=nirs_data.oxyData(12691,34);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,34)== k;
nirs_data.oxyData(i,34)=(nirs_data.oxyData(i,23) + nirs_data.oxyData(i,24))/2;
nirs_data.dxyData(i,34)=(nirs_data.dxyData(i,23) + nirs_data.dxyData(i,24))/2;
end
end
k=nirs_data.oxyData(12691,39);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,39)== k;
nirs_data.oxyData(i,39)=(nirs_data.oxyData(i,28) + nirs_data.oxyData(i,29))/2;
nirs_data.dxyData(i,39)=(nirs_data.dxyData(i,28) + nirs_data.dxyData(i,29))/2;
end
end
k=nirs_data.oxyData(12691,40);
for i=1:length(nirs_data.oxyData)
if nirs_data.oxyData(i,40)== k;
nirs_data.oxyData(i,40)=(nirs_data.oxyData(i,30) + nirs_data.oxyData(i,29))/2;
nirs_data.dxyData(i,40)=(nirs_data.dxyData(i,30) + nirs_data.dxyData(i,29))/2;
end
end

for i=1:length(nirs_data.dxyData)
nirs_data.dxyData(i,35)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,24))/2;
nirs_data.dxyData(i,36)=(nirs_data.dxyData(i,25) + nirs_data.dxyData(i,26))/2;
nirs_data.dxyData(i,38)=(nirs_data.dxyData(i,27) + nirs_data.dxyData(i,28))/2;
nirs_data.dxyData(i,37)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,49)=(nirs_data.dxyData(i,39) + nirs_data.dxyData(i,50))/2;
nirs_data.dxyData(i,47)=(nirs_data.dxyData(i,36) + nirs_data.dxyData(i,37))/2;
nirs_data.dxyData(i,48)=(nirs_data.dxyData(i,37) + nirs_data.dxyData(i,38))/2;
nirs_data.dxyData(i,21)=(nirs_data.dxyData(i,20) + nirs_data.dxyData(i,10))/2;
nirs_data.dxyData(i,31)=(nirs_data.dxyData(i,30) + nirs_data.dxyData(i,21))/2;
nirs_data.dxyData(i,41)=(nirs_data.dxyData(i,30) + nirs_data.dxyData(i,31))/2;
nirs_data.dxyData(i,42)=(nirs_data.dxyData(i,21) + nirs_data.dxyData(i,31))/2;
nirs_data.dxyData(i,45)=(nirs_data.dxyData(i,34) + nirs_data.dxyData(i,35))/2;
nirs_data.dxyData(i,51)=(nirs_data.dxyData(i,41) + nirs_data.dxyData(i,40))/2;
nirs_data.dxyData(i,52)=(nirs_data.dxyData(i,41) + nirs_data.dxyData(i,42))/2;
nirs_data.dxyData(i,7)=(nirs_data.dxyData(i,6) + nirs_data.dxyData(i,8))/2;
end
for i=1:length(nirs_data.oxyData)
nirs_data.oxyData(i,35)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,24))/2;
nirs_data.oxyData(i,36)=(nirs_data.oxyData(i,25) + nirs_data.oxyData(i,26))/2;
nirs_data.oxyData(i,38)=(nirs_data.oxyData(i,27) + nirs_data.oxyData(i,28))/2;
nirs_data.oxyData(i,37)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,49)=(nirs_data.oxyData(i,39) + nirs_data.oxyData(i,50))/2;
nirs_data.oxyData(i,47)=(nirs_data.oxyData(i,36) + nirs_data.oxyData(i,37))/2;
nirs_data.oxyData(i,48)=(nirs_data.oxyData(i,37) + nirs_data.oxyData(i,38))/2;
nirs_data.oxyData(i,21)=(nirs_data.oxyData(i,20) + nirs_data.oxyData(i,10))/2;
nirs_data.oxyData(i,31)=(nirs_data.oxyData(i,30) + nirs_data.oxyData(i,21))/2;
nirs_data.oxyData(i,41)=(nirs_data.oxyData(i,30) + nirs_data.oxyData(i,31))/2;
nirs_data.oxyData(i,42)=(nirs_data.oxyData(i,21) + nirs_data.oxyData(i,31))/2;
nirs_data.oxyData(i,45)=(nirs_data.oxyData(i,34) + nirs_data.oxyData(i,35))/2;
nirs_data.oxyData(i,51)=(nirs_data.oxyData(i,41) + nirs_data.oxyData(i,40))/2;
nirs_data.oxyData(i,52)=(nirs_data.oxyData(i,41) + nirs_data.oxyData(i,42))/2;
nirs_data.oxyData(i,7)=(nirs_data.oxyData(i,6) + nirs_data.oxyData(i,8))/2;
end



