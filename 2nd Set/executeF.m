function executeF(fr0,fr1,w,h,value) % were w=width and h=high
	
		%property elements 
		QP=27;
		i=1;
		j=1;
		num=0;
		MSE=0;
		PSNR0=0;
		move=4;
		r=1;
		c=1;
		SAD=0;
		one=0;
		two=0;
		MSE2=0;
		PSNR2=0;
		%----------------
  
		%opening the frames
		fin0=fopen(fr0,'r');
		fr0 =fread(fin0,[w,h])';
		fclose(fin0);
  
		fin1=fopen(fr1,'r');
		fr1 =fread(fin1,[w,h])';
		fclose(fin1);
		%------------------
  
  
		%cutting frame0 at 4x4 piecies - calculating quantization - entropy -reversal quantization and integral approach of dct
		i=1;
		while i<size(fr0,1)        %rows of frame0
			for j=1:4:size(fr0,2)   %columns of frame0
				cuti=i+3;
				cutj=j+3;
				dct0(i:cuti,j:cutj)=integer_transform(fr0(i:cuti,j:cutj));    %integral approach of dct
				quanum(i:cuti,j:cutj)= quantization(dct0(i:cuti,j:cutj),QP); %calculation quantization
				revQuan(i:cuti,j:cutj)=inv_quantization(quanum(i:cuti,j:cutj),QP); % calculating reversal quanization
				result=inv_integer_transform(revQuan(i:cuti,j:cutj));   
				revDct0(i:cuti,j:cutj)=round(result/64);                      % calculating reversal integral approach of dct0
        
			end	
      
			i=i+move;
		end
		check0 = abs(quanum);
		check1 = uint8(check0);
		entpy  = entropy(check1); % calculating entropy
		fprintf("Entropy for frame0 is=");
		fprintf("%d\n",entpy);
		
		imagesc(revDct0);
		colormap(gray);
		title("RevDct0");
		%-------------------
 
  
		%calculating MSE and PSNR  for frame0
		k=1;m=1;
		num=size(fr0,1)*size(fr0,2);
		while k<size(fr0,1)
			while m<size(fr0,2)
				MSE+=double((fr0(k,m)-revDct0(k,m)).^2);
				m++;
			end
			m=1;
			k++;
		end
		MSE=MSE/num;
		fprintf("MSE FOR FRAME0 IS :");
		fprintf("%d\n",MSE);
		PSNR0=10*log10(255^2/MSE);
		fprintf("PSNR FOR FRAME0 IS :");
		fprintf("%d\n",PSNR0);
		%----------------------
   
	
	
	
	
	if(value==8)
		
		%movement estimation
   
		while(r<size(fr1,1))
			while(c<size(fr1,2))
				check=0;
				for i=-value:value
					for j=-value:value
						Rmove=i+r;
						Cmove=j+c;
						if((Rmove)>= 1 && (Cmove)>=1 && (Rmove+15)<=size(fr1,1) && (Cmove+15)<=size(fr1,2))
							move1=r+15;
							move2=c+15;
							step1=r:r+15;
							step2=c:c+15;
							step3=r+15;
							step4=c+15;
							SAD=sum(sum(abs(fr1(step1,step2)-revDct0(r+i:move1+i,j+c:move2+j))));
							%SAD=sum(sum(fr1-revDct0));
							if(check==1)
								if (SAD<elaxisto)
									elaxisto=SAD;
									horizontally=i;
									vertically=j;
								end
							else
								elaxisto=SAD;
								horizontally=i;
								vertically=j;
								check=1;
							end
						end
					end
				end
				ms_fr1(r:r+15,c:c+15)=revDct0(horizontally+r:horizontally+15+r,vertically+c:vertically+15+c);
				c=c+16;
			end
			c=1;
			r=r+16;
		end
		fprintf("teleiosa\n");
   
		MSE=fr1 - ms_fr1;
		%--------------------------
   
		%cutting frame1 at 4x4 piecies - calculating quantization - entropy -reversal quantization and integral approach of dct
		b=1;
		while(b<size(fr0,1))
			for p=1:4:size(fr0,2)
				cutb=b+3;
				cutp=p+3;
				MSEdct(b:cutb,p:cutp)=integer_transform(MSE(b:cutb,p:cutp));
				MSEquanum(b:cutb,p:cutp)=quantization(MSEdct(b:cutb,p:cutp),QP);
				MSErevDct(b:cutb,p:cutp)=inv_quantization(MSEquanum(b:cutb,p:cutp),QP);
				result2=inv_integer_transform(MSErevDct(b:cutb,p:cutp));
				MSEnew(b:cutb,p:cutp)=round(result2/64);
			
			end
			b=b+move;
		end
		check2 = abs(MSEquanum);
		check3 = uint8(check2);
		entpy2  = entropy(check3); % calculating entropy
		fprintf("Entropy for frame1 is=");
		fprintf("%d\n",entpy2);
		imagesc(MSEnew);colormap(gray);title("MSEnew");
		newfr1=ms_fr1+MSEnew;
		%------------------------
	
		%calculating MSE and PSNR  for frame1
		k=1;m=1;
		num=size(fr1,1)*size(fr1,2);
		while k<size(fr1,1)
			while m<size(fr1,2)
				MSE2+=double((fr1(k,m)-newfr1(k,m)).^2);
				m++;
			end
			m=1;
			k++;
		end
		MSE2=MSE2/num;
		fprintf("MSE FOR FRAME1 IS :");
		fprintf("%d\n",MSE2);
		PSNR2=10*log10(255^2/MSE2);
		fprintf("PSNR FOR FRAME1 IS :");
		fprintf("%d\n",PSNR2);
		%-------------------------
	end
   
	
	if(value==4)
	
		fprintf("Now results of step 3 and step 4 with i e [-4,4] and j e [-4,4]\n");
		%movement estimation
		while(r<size(fr1,1))
			while(c<size(fr1,2))
				check=0;
				for i=-value:value
					for j=-value:value
						Rmove=i+r;
						Cmove=j+c;
						if((Rmove)>= 1 && (Cmove)>=1 && (Rmove+15)<=size(fr1,1) && (Cmove+15)<=size(fr1,2))
							move1=r+15;
							move2=c+15;
							step1=r:r+15;
							step2=c:c+15;
							step3=r+15;
							step4=c+15;
							SAD=sum(sum(abs(fr1-revDct0)));
							%SAD=sum(sum(abs(fr1(step1,step2)-revDct0(r+i:move1+i,j+c:move2+j))));
							if(check==1)
								if (SAD<elaxisto)
									elaxisto=SAD;
									horizontally=i;
									vertically=j;
								end
							else
								elaxisto=SAD;
								horizontally=i;
								vertically=j;
								check=1;
							end
						end
					end
				end
				ms_fr1(r:r+15,c:c+15)=revDct0(horizontally+r:horizontally+15+r,vertically+c:vertically+15+c);
			
				c=c+16;
			end
			c=1;
			r=r+16;
		end
		fprintf("teleiosa\n");
		MSE=fr1 - ms_fr1;
		%--------------------------
   
		%cutting frame1 at 4x4 piecies - calculating quantization - entropy -reversal quantization and integral approach of dct
		b=1;
		while(b<size(fr0,1))
			for p=1:4:size(fr0,2)
				cutb=b+3;
				cutp=p+3;
				MSEdct(b:cutb,p:cutp)=integer_transform(MSE(b:cutb,p:cutp));
				MSEquanum(b:cutb,p:cutp)=quantization(MSEdct(b:cutb,p:cutp),QP);
				MSErevDct(b:cutb,p:cutp)=inv_quantization(MSEquanum(b:cutb,p:cutp),QP);
				result2=inv_integer_transform(MSErevDct(b:cutb,p:cutp));
				MSEnew(b:cutb,p:cutp)=round(result2/64);
			
			end
			b=b+move;
		end
		check2 = abs(MSEquanum);
		check3 = uint8(check2);
		entpy2  = entropy(check3); % calculating entropy
		fprintf("Entropy for frame1 is=");
		fprintf("%d\n",entpy2);
		figure;imagesc(MSEnew);colormap(gray);title("MSEnew");
		newfr1=ms_fr1+MSEnew;
		%------------------------
	
		%calculating MSE and PSNR  for frame1
		k=1;m=1;
		num=size(fr1,1)*size(fr1,2);
		while k<size(fr1,1)
			while m<size(fr1,2)
				MSE2+=double((fr1(k,m)-newfr1(k,m)).^2);
				m++;
			end
			m=1;
			k++;
		end
		MSE2=MSE2/num;
		fprintf("MSE FOR FRAME1 IS :");
		fprintf("%d\n",MSE2);
		PSNR2=10*log10(255^2/MSE2);
		fprintf("PSNR FOR FRAME1 IS :");
		fprintf("%d\n",PSNR2);
		%-------------------------
   
end
