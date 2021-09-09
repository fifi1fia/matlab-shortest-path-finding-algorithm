function [t]= find1(ww,discard,prevmov,nextmov)
%fprintf('find')

[ s2] = length(discard);
[ s4] =length(prevmov);
[ s6] = size(nextmov)


t=100;
t1=400;
t12=400;
t3=400;
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

k=0;
j=0;

for j=1:1:s6(1)
  for k=1:3:s6(2)
      
    if(nextmov(j,k+1)==ww(1) && nextmov(j,k+2)==ww(2))
        t3=1;
        
        fprintf('is in nextmov')
    break;
    else
        t3=0;
       fprintf('notfound')
    end  
  end
end
%t4=[t1 t12 t3];            all(t4)
if (t1==0 && t12==0 && t3==0)
    t=0
    return;
else
    t=t1*100 + t12*10+t3
    return;
end
end