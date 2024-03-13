%LOADING PACKAGES
pkg load image;
pkg load signal;
%END

fprintf("Press 8 if you want values from[-8,8]\n");
fprintf("Press 4 if you want values from[-4,4]\n");
value=input("Enter the value here :");
%DIAVASMA ARXEIWN OPWS ANAFERETAI STHN EKFWNHSH
%H synarthsh ayth ektelei thn askhsh dexontas os orisma
%ta frames alla kai tis diastaseis tous 
fr0='frame0.raw';
fr1='frame1.raw';
if(value==4)
	executeF(fr0,fr1,176,144,value);
end
if(value==8)
	executeF(fr0,fr1,176,144,value);
end
