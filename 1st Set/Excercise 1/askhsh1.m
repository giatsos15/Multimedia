

function askhsh1
  pkg load image;
  pkg load signal;
  fprintf("ASKHSH 1 BEGINS HERE\n");
  value=input("Enter the num ( 10 - 15 -20) for check |F(u,v)|< num :");
  
  if value==10
    %fix!
    cameraman=imread('cameraman.tif');
    imagesc(cameraman);
    title('arxikh eikona');
    colormap(gray);
    MSE=0;
    PSNR=0;
    dctcam=dct2(cameraman);
    checkzeros = 0;
    
	  i=1;
	  j=1;
	  while i<size(cameraman,1)
		while j<size(cameraman,2)
              check = abs(dctcam(i,j));
              if check<10
                  dctcam(i,j)=0;
                  checkzeros++;
              end
              j++;
		end
		  j=1;
		  i++;
	 end
      
    fprintf("midenismoi:");
    fprintf("%d\n",checkzeros);
    
    newpic=uint8(idct2(dctcam));
    imagesc(newpic);
    title("|F(u,v)|<10");
    colormap(gray);
    k=1;
    m=1;
    while k<size(cameraman,1)
      while m<size(cameraman,2)
         MSE += double((cameraman(k,m) - (newpic(k,m))).^2);
         m++;  
      end
      m=1;
      k++;
    end
    num1=size(cameraman,1)*size(cameraman,2);
    MSE = MSE/num1;
    fprintf("for input 10 , MSE = ");
    fprintf("%d\n",MSE);
    PSNR = 10*log10(num1/MSE);
    fprintf("for input 10 , PSNR = ");
    fprintf("%d\n",PSNR);
    
    
  end
  if value==15
    %fix
    cameraman=imread('cameraman.tif');
    imagesc(cameraman);
    title('arxikh eikona');
    colormap(gray);
    MSE=0;
    PSNR=0;
    dctcam=dct2(cameraman);
    checkzeros = 0;
    
	  i=1;
	  j=1;
	  while i<size(cameraman,1)
		while j<size(cameraman,2)
              check = abs(dctcam(i,j));
              if check<15
                  dctcam(i,j)=0;
                  checkzeros++;
              end
              j++;
		end
		  j=1;
		  i++;
	  end
      
    fprintf("midenismoi:");
    fprintf("%d\n",checkzeros);
    
    newpic=uint8(idct2(dctcam));
    imagesc(newpic);
    title("|F(u,v)|<15");
    colormap(gray);
    k=1;
    m=1;
    while k<size(cameraman,1)
      while m<size(cameraman,2)
         MSE += double((cameraman(k,m) - (newpic(k,m))).^2);
         m++;  
      end
      m=1;
      k++;
    end
    num1=size(cameraman,1)*size(cameraman,2);
    MSE = MSE/num1;
    fprintf("for input 15 , MSE = ");
    fprintf("%d\n",MSE);
    PSNR = 10*log10(num1/MSE);
    fprintf("for input 15 , PSNR = ");
    fprintf("%d\n",PSNR);
    
    
  end
    
  if value==20
    %fix
    cameraman=imread('cameraman.tif');
    imagesc(cameraman);
    title('arxikh eikona');
    colormap(gray);
    MSE=0;
    PSNR=0;
    dctcam=dct2(cameraman);
    checkzeros = 0;
    
	  i=1;
	  j=1;
	  while i<size(cameraman,1)
		while j<size(cameraman,2)
              check = abs(dctcam(i,j));
              if check<20
                  dctcam(i,j)=0;
                  checkzeros++;
              end
              j++;
		end
		  j=1;
		  i++;
	  end
      
    fprintf("midenismoi:");
    fprintf("%d\n",checkzeros);
    
    newpic=uint8(idct2(dctcam));
    imagesc(newpic);
    title("|F(u,v)|<20");
    colormap(gray);
    k=1;
    m=1;
    while k<size(cameraman,1)
      while m<size(cameraman,2)
         MSE += double((cameraman(k,m) - (newpic(k,m))).^2);
         m++;  
      end
      m=1;
      k++;
    end
    num1=size(cameraman,1)*size(cameraman,2);
    MSE = MSE/num1;
    fprintf("for input 20 , MSE = ");
    fprintf("%d\n",MSE);
    PSNR = 10*log10(num1/MSE);
    fprintf("for input 20 , PSNR = ");
    fprintf("%d\n",PSNR);
    
    
  end
    
  
  
end
