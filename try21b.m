function try21b ()
clc;
a=imread('2b.jpg');
  b1= im2bw(a); %to binary
    %imshow(b1);
   b=b1(5:end-5,5:end-5); %croping 
   %imtool(b)
   [z x] = size(b);
    
 desx=57;           %destination coord
 desy=10;
  prevmov=zeros(1,2);       %path1
  nextmov=zeros(1,3);       %level
  discard=zeros(1,2);      
  startx=85;
  starty=24;

while( startx~=desx && starty~=desy )

snx=startx
sny=starty

[discard,xyz] = findr(b,snx, sny,desx,desy,z,discard,prevmov);

p1x=snx+1;
p1y=sny;

[discard,xyz1] = findl(b,snx,sny,desx,desy,z,x,discard,prevmov);

p2x=snx-1;
p2y=sny;

[discard,xyz2] = findu(b,snx,sny,desx,desy,z,x,discard,prevmov);


    p3x=snx;
    p3y=sny-1;

[discard,xyz3]= findd(b,snx,sny,desx,desy,z,x,discard,prevmov);


    p4x=snx;
    p4y=sny+1;

c=zeros(4,3);
 
c(1,1)=xyz;
c(1,2)=p1x;
c(1,3)=p1y;
 
c(2,1)=xyz1;
c(2,2)=p2x;
c(2,3)=p2y;
 
c(3,1)=xyz2;
c(3,2)=p3x;
c(3,3)=p3y;
 
c(4,1)=xyz3;
c(4,2)=p4x;
c(4,3)=p4y;


c=sortrows(c);

s1=c(1,1);
e1x=c(1,2);
e1y=c(1,3);
        
s2=c(2,1);
e2x=c(2,2);
e2y=c(2,3);
s3=c(3,1);
e3x=c(3,2);
e3y=c(3,3);

sd1 =[e1x,e1y];
sd2=[e2x,e2y];
sd3=[e3x,e3y];


if(xyz==400 && xyz1==400 && xyz2==400 && xyz3==400)
    r=0000;

elseif(xyz<xyz1 &&  xyz<xyz2 && xyz<xyz3)
       r=0100; 
   elseif (xyz1<xyz &&  xyz1<xyz2 && xyz1<xyz3)
    r=1000;
   elseif (xyz2<xyz &&  xyz2<xyz1 && xyz2<xyz3)
   r=0010; 
   elseif (xyz3<xyz &&  xyz3<xyz1 && xyz3<xyz2)
       r=0001; 
elseif (xyz==xyz1 || xyz2==xyz ||  xyz3==xyz || xyz3==xyz2 ||xyz3==xyz1 || xyz1==xyz2 )
       r=1100;
   end 
       switch (r)
       case 0100
           
           startx=startx+1;
           starty;
          prevmov=horzcat(prevmov,startx,starty);
                     
       case 1000
           startx=startx-1;
           prevmov=horzcat(prevmov,startx,starty);
               
               
       case 0010
           starty=starty-1;
          prevmov=horzcat(prevmov,startx,starty);
                
      
       case 0001
           starty=starty+1;
           prevmov=horzcat(prevmov,startx,starty);
       
       case 1100
           vv=findn(sd1,discard,prevmov);
                if (vv==0)
                prevmov= horzcat(prevmov,e1x,e1y);
                %fprintf('added 69,23')
                startx=e1x;
                starty=e1y;
                else 
                 vy = findn(sd2,discard,prevmov);
                 if (vy==0)
                prevmov= horzcat(prevmov,e2x,e2y);
                %fprintf('added 555,555')
                startx=e1x;
                starty=e1y;
                end
                end
                
                
           case 0000
               
               fprintf('\nerror');
               
                startx=nextmov(end,end-1);
                starty=nextmov(end,end);
                fprintf('yyy')
                prevmov = horzcat(prevmov,startx,starty);
                nextmov((end):(end),:)=[];
        
       end
prevmov  
  

d=find1(sd2,discard,prevmov,nextmov);
dd=find1(sd3,discard,prevmov,nextmov);
%ddd=find1(sd4,discard,prevmov,nextmov);
 if(dd==0)
%fprintf('added')
nextmov(end+1,end+1)=c(3,1);
nextmov(end,end+1)=e3x;
nextmov(end,end+1)=e3y;
 end
 
 if(d==0)
%fprintf('added')
nextmov(end+1,end+1)=c(2,1);
nextmov(end,end+1)=e2x;
nextmov(end,end+1)=e2y;

 end
   
a(startx +4,starty+4,2:3)=0;  

 % imshow(a)
  %pause(1);

end 



















end