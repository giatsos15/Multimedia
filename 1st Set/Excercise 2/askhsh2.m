
function askhsh2 
  pkg load image;
  pkg load signal;
  fprintf("AKHSH 2 BEGINS HERE!!\n");
  
  fprintf("------------------------\n");
  
  cameraman=imread('cameraman.tif');
  imagesc(cameraman);
  colormap(gray);
  title("Arxikh Eikona");
    
    %ypologismos entropias
  en=entropy(cameraman);
  fprintf("Entrapia Arxikhs eikonas =");
  fprintf("%d\n",en);
  
  fprintf("If you want the program to run Q=Q1     press 1.\n");
  fprintf("If you want the program to run Q=3*Q1   press 2.\n");
  fprintf("If you want the program to run Q=4*Q1   press 3.\n");
  value=input("Enter your answer here :");
  
  Q=[[16 11 10 16 24 40 51 61];
    [12 12 14 19 26 58 60 55];
    [14 13 16 24 40 57 69 56];
    [14 17 22 29 51 87 80 62];
    [18 22 37 56 68 109 103 77];
    [24 35 55 64 81 104 113 92];
    [49 64 78 87 103 121 120 101];
    [72 92 95 98 112 100 103 99]];
  
  
  
  if value==1
    
    %xorismos tis eikonas se kommatia ton 8 kai pairnoume to dct ths eikonas 
    i=1;
    while i<size(cameraman,1) 
      for j=1:8:size(cameraman,2)
          newblock(i:(i+7),j:(j+7))=dct2(cameraman(i:(i+7),j:(j+7)));
      end
      i=i+8;
    end
    k=1;
    while k<=size(cameraman,1)
         for j=1:8:size(cameraman,2)
          dctblock(k:(k+7),j:(j+7))=round(newblock(k:(k+7),j:(j+7))./Q); %opou to Q einai o pinakas mas 
      end
      k=k+8;
        
    end
    apoliti_timh=entropy(uint8(abs(dctblock)));
    fprintf("Entropia kvantismenon sineleston gia Q=Q1:");
    fprintf("%f\n",apoliti_timh);    
    
    %tora oso anafora to erothma 7 pou kanei antistrofh kvantish ousiastika einai to idio me prin aplos anti gia ./Q tha ginei .*Q
    i=1;
    while i<=size(cameraman,1)
      for j=1:8:size(cameraman,2)
          antistrofhkvantish(i:(i+7),j:(j+7))=dctblock(i:(i+7),j:(j+7)).*Q;
      end
      
      i=i+8;
    end
    %erotima 8 kai 9 mazi 
    i=1;
    while i<=size(cameraman,1)
      for j=1:8:size(cameraman,2)
          idctimage(i:(i+7),j:(j+7))=uint8(idct2(antistrofhkvantish(i:(i+7),j:(j+7))));
      end
      i=i+8;
    end
    %ypologismos MSE
	  
    %ypologismos MSE
    
    MSE= sum(sum((double(cameraman)-double(idctimage)).^2));
    MSE=MSE/(size(cameraman,1)*size(cameraman,2));
    PSNR= 10*log10((size(cameraman,1)*size(cameraman,2))/MSE) 
    fprintf("for input Q=Q1 , MSE = ");
    fprintf("%d\n",MSE);
    fprintf("for input Q=Q1 ,  PSNR = ");
    fprintf("%d\n",PSNR);
    title("Q=Q1");
    
    
  end
  
  if value==2
    
   choice=3*Q;
    
    %xorismos tis eikonas se kommatia ton 8 kai pairnoume to dct ths eikonas 
    i=1;
    while i<size(cameraman,1) 
      for j=1:8:size(cameraman,2)
          newblock(i:(i+7),j:(j+7))=dct2(cameraman(i:(i+7),j:(j+7)));
      end
      i=i+8;
    end
    k=1;
    while k<=size(cameraman,1)
         for j=1:8:size(cameraman,2)
          dctblock(k:(k+7),j:(j+7))=round(newblock(k:(k+7),j:(j+7))./choice); %opou to Q einai o pinakas mas 
      end
      k=k+8;
        
    end
    apoliti_timh=entropy(uint8(abs(dctblock)));
    fprintf("Entropia kvantismenon sineleston gia Q=3Q1:");
    fprintf("%f\n",apoliti_timh);    
    
    %tora oso anafora to erothma 7 pou kanei antistrofh kvantish ousiastika einai to idio me prin aplos anti gia ./Q tha ginei .*Q
    i=1;
    while i<=size(cameraman,1)
      for j=1:8:size(cameraman,2)
          antistrofhkvantish(i:(i+7),j:(j+7))=dctblock(i:(i+7),j:(j+7)).*choice;
      end
      
      i=i+8;
    end
    %erotima 8 kai 9 mazi 
    i=1;
    while i<=size(cameraman,1)
      for j=1:8:size(cameraman,2)
          idctimage(i:(i+7),j:(j+7))=uint8(idct2(antistrofhkvantish(i:(i+7),j:(j+7))));
      end
      i=i+8;
    end
    %ypologismos MSE
    
    MSE= sum(sum((double(cameraman)-double(idctimage)).^2));
    MSE=MSE/(size(cameraman,1)*size(cameraman,2));
    PSNR= 10*log10((size(cameraman,1)*size(cameraman,2))/MSE) 
    fprintf("for input Q=3Q1 , MSE = ");
    fprintf("%d\n",MSE);
    fprintf("for input Q=3Q1 ,  PSNR = ");
    fprintf("%d\n",PSNR);
    
    %emfanish epeksergasmenhs eikonas 
    imagesc(idctimage);
    colormap(gray);
    title("Q=3Q1");
    
    
  end
  
  if value==3
    
    choice=4*Q;
    MSE=0;
    %xorismos tis eikonas se kommatia ton 8 kai pairnoume to dct ths eikonas 
    i=1;
    while i<size(cameraman,1) 
      for j=1:8:size(cameraman,2)
          newblock(i:(i+7),j:(j+7))=dct2(cameraman(i:(i+7),j:(j+7)));
      end
      i=i+8;
    end
    k=1;
    while k<=size(cameraman,1)
         for j=1:8:size(cameraman,2)
          dctblock(k:(k+7),j:(j+7))=round(newblock(k:(k+7),j:(j+7))./choice); %opou to Q einai o pinakas mas 
      end
      k=k+8;
        
    end
    apoliti_timh=entropy(uint8(abs(dctblock)));
    fprintf("Entropia kvantismenon sineleston gia Q=4Q1:");
    fprintf("%f\n",apoliti_timh);    
    
    %tora oso anafora to erothma 7 pou kanei antistrofh kvantish ousiastika einai to idio me prin aplos anti gia ./Q tha ginei .*Q
    i=1;
    while i<=size(cameraman,1)
      for j=1:8:size(cameraman,2)
          antistrofhkvantish(i:(i+7),j:(j+7))=dctblock(i:(i+7),j:(j+7)).*choice;
      end
      
      i=i+8;
    end
    %erotima 8 kai 9 mazi 
    i=1;
    while i<=size(cameraman,1)
      for j=1:8:size(cameraman,2)
          idctimage(i:(i+7),j:(j+7))=uint8(idct2(antistrofhkvantish(i:(i+7),j:(j+7))));
      end
      i=i+8;
    end
    k=1;
    m=1;
    while k<size(cameraman,1)
      while m<size(cameraman,2)
         MSE += double((cameraman(k,m) - (idctimage(k,m))).^2);
         m++;  
      end
      m=1;
      k++;
    end
     %ypologismos MSE
    
    MSE= sum(sum((double(cameraman)-double(idctimage)).^2));
    MSE=MSE/(size(cameraman,1)*size(cameraman,2));
    PSNR= 10*log10((size(cameraman,1)*size(cameraman,2))/MSE) 
    fprintf("for input Q=4Q1 , MSE = ");
    fprintf("%d\n",MSE);
    fprintf("for input Q=4Q1 ,  PSNR = ");
    fprintf("%d\n",PSNR);
    title("Q=4Q1");
    
    
    
  end
 
  
end
