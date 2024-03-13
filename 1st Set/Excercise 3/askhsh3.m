function askhsh3
  pkg load image;
  pkg load signal;
  fprintf("AKSHSH 3 BEGINS NOW\n");
  fprintf("---------------------\n");  
  
  numbers=[7,0,4,0,2,3,0,0,2,4,0,1,0,0,0,1,0,0,-1,-1,0,1,0,0,0,1,0,0,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
  
  %to mikos ton sinteleston ston pinaka numbers einai 63 , to opoio einai gnosto apo ekfonish ths askhshs
  %opote
  
  checkzeros=0; % counter pou metraei posa midenika uparxoun prin apo kathe level
  i=1;
  while i<=length(numbers)
    casex=numbers(i);
    switch (casex)
      case 0
        %tote shmainei oti iparxoun midenika prin apo kapoio level ara auksano ton counter
      checkzeros=checkzeros+1;
    otherwise
      %shmainei oti epesa pano se kapoio level opote pao na ektiposo posa midenika vrika prin apo to level
      if checkzeros==0
        fprintf(" prin apo to level(%d) den exoume kanena (run) mideniko\n",numbers(i));
        checkzeros = 0; % enhmerosh tou counter gia ta midenika etsi oste na metrisei pali apo thn arxh otan vrei pali ena kainoyrgio level
      elseif checkzeros==1
        fprintf(" prin apo to level(%d) exoume (%d-(run)) mideniko\n",numbers(i),checkzeros);
        checkzeros = 0; % enhmerosh tou counter gia ta midenika etsi oste na metrisei pali apo thn arxh otan vrei pali ena kainoyrgio level
      else
        fprintf(" prin apo to level(%d) exoume (%d-(run)) midenika\n",numbers(i),checkzeros);
        checkzeros = 0; % enhmerosh tou counter gia ta midenika etsi oste na metrisei pali apo thn arxh otan vrei pali ena kainoyrgio level
      end
    endswitch
    i=i+1;
  end

end
