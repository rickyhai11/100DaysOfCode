#include<stdio.h>

int main()
{

   int i=1;

   while(1)
   {
      /*if(i%1==0 && i%2==0 && i%3==0  //for testing.
         && i%4==0 && i%5==0 && i%6==0 
         && i%7==0 && i%8==0 && i%9==0 
         && i%10==0) */
         
        if(i%11==0 && i%12==0 && i%13==0 
         && i%14==0 && i%15==0 && i%16==0 
         && i%17==0 && i%18==0 && i%19==0 
         && i%20==0)
      {
          printf("%d\n", i);
          return 0;
      }

      i++;
   }

return 0;
}
