function [t]= findn(ww,discard,prevmov)
%fprintf('find')
ww;

prevmov;
discard;



[ s2] = length(discard);
[ s4] =length(prevmov);




t1=400000;
t12=40000;

i=0;
for i=1:2:s2(1)
  
    if(discard(i)==ww(1) && discard(i+1)==ww(2))
        t1=1;
        fprintf('is in discard')
        break;
    else
        t1=0;
        
    end  
end

i=0;
for i=1:2:s4(1)
  
    if(prevmov(i)==ww(1) && prevmov(i+1)==ww(2))
        t12=1;
        
        fprintf('is in premov')
    break;
    else
        t12=0;
    end  
end

%t4=[t1 t12 t3];            all(t4)

if (t1==0 && t12==0)
    t=0;
    return;
else
    t=t1*100 + t12*10;
    return;
end
end