function [discard,xyz]= findu(b,startx , starty,desx1,desy1,z,x,discard,prevmov)

ww=[startx,starty-1];
bb=[desx1,desy1];
t1=400;
t12=400;
t5=400;

if(starty-1==0 )
    xyz=400;
    discard=horzcat(discard,startx,starty-1)
    return;
end
    if(b(startx,starty-1)==1)
        
        xyz=pdist2(bb,ww);
        t5=0;
        %fprintf('\nup distance %d',xyz);
    else 
        
        xyz=400;
        discard=horzcat(discard,startx,starty-1)
        % fprintf('returnu1');
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
        t12=1;
         xyz=400;
        fprintf('is in premov')
    break;
    else
        t12=0;
    end  
end

if (t1==0 && t12==0 &&  t5==0)
    t=0;
    return;
else
    t=t1*100 + t12*10+t5;
     xyz=400
    return;
end

end