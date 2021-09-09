function [discard, xyz]= findd(b,startx ,starty,desx1,desy1,z,x,discard,prevmov)

ww=[startx,starty+1];
bb=[desx1,desy1];
t1=400;
t2=400;
t3=400;


if((starty+1)>=x)       %valid?
    xyz=400;
    discard=horzcat(discard,startx,starty+1)
    return;
  
end

if(b(startx,starty+1)==1)       %=1 ?
         xyz=pdist2(bb,ww);
         t3=0;
       %fprintf('\ndown distance %d',xyz);
    else 
        xyz=400;
   discard=horzcat(discard,startx,starty+1)
   t3=1;
   return;
end

%checking
[ s2] = length(discard);
[ s4] =length(prevmov);


i=0;
for i=1:2:s2(1)
  
    if(discard(i)==ww(1) && discard(i+1)==ww(2))
        t1=1;
        fprintf('is in discard')
         xyz=400;
        break;
    else
        t1=0;
        
    end  
end


i=0;
for i=1:2:s4(1)
  
    if(prevmov(i)==ww(1) && prevmov(i+1)==ww(2))
        t2=1;
         xyz=400;
        fprintf('is in premov')
    break;
    else
        t2=0;
    end  
end

if (t1==0 && t2==0  && t3==0)
    t=0;
    return;
else
    t=t1*100 + t2*10+t3;
     xyz=400
    return;
end

end