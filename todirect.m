function []= todirect ()
path = [84    24    83    24    82    24    81    24    80    24    79    24    78    24    77    24    76 24    75    24    74    24    73    24    72    24    71    24    70    24    70    23    69    23    69    22 69    21    70    21    70    22    71    22    71    21    72    21    72    22    72    23    71    23    73 23    73    22    73    21    74    21    74    22    74    23    75    23    75    22    75    21    76    21 76    22    76    23    77    23    77    22    77    21    77    20    77    19    77    18    77    17    77 16    77    15    77    14    77    13    77    12    76    12    75    12    74    12    73    12    72    12 71    12    70    12    69    12    68    12    67    12    66    12    65    12    64    12    63    12    62 12    61    12    60    12    59    12    58    12    58    11    57    11];
spath=zeros();
l= length (path);
currentdirection=0;
%0 is up
% 1 is right
% 2 is down
% 3 is left
for i=1:2:(l-2)

if ((path(i)-path(i+2))==(-1) && path(i+1)==path(i+3))
        spath=horzcat(spath,' ','r');
    elseif ((path(i)-path(i+2))==(1) && path(i+1)==path(i+3))
        spath=horzcat(spath,' ','l');
    elseif ((path(i)==path(i+2)) && (path(i+1)-path(i+3))==(-1))
        spath=horzcat(spath,' ','d');        
    elseif ((path(i)==path(i+2)) && (path(i+1)-path(i+3))==(1))
        spath=horzcat(spath,' ','u');
end
end
spath
m=length(spath);
for j=1:m
    if(spath=='r')
        if(currentdirection==0)
            currentdirection=1;
        elseif (currentdirection==1)
            currentdirection=2;
        elseif (currentdirection==2)
            currentdirection=3;
        elseif (currentdirection==3)
            currentdirection=0;
        end
    elseif (spath=='l')
        if(currentdirection==0)
            currentdirection=3;
        elseif (currentdirection==1)
            currentdirection=0;
        elseif (currentdirection==2)
            currentdirection=3;
        elseif (currentdirection==3)
            currentdirection=2;
        end
    elseif(spath=='u')
        if(currentdirection==0)
            currentdirection=0;
        elseif (currentdirection==1)
            currentdirection=1;
        elseif (currentdirection==2)
            currentdirection=2;
        elseif (currentdirection==3)
            currentdirection=3;
        end
    elseif (spath=='d')
        if(currentdirection==0)
            currentdirection=2;
        elseif (currentdirection==1)
            currentdirection=3;
        elseif (currentdirection==2)
            currentdirection=0;
        elseif (currentdirection==3)
            currentdirection=1;
        end
    end
end

end
