#include <stdio.h>
#include <stdlib.h>

int collatz(int n, int k)
{
    // Exit case.
    if(n==1)
    {
        return k;
    }
    // Case where n is even.
    else if(n%2==0)
    {
        k = k+1;
        n = n/2;
        printf("%d\n", n);
        collatz(n,k);
    }
    // Case where n is odd.
    else
    {
        k = k+1;
        n = 3*n+1;
        printf("%d\n", n);
        collatz(n,k);
    }
}
 
// Main body.
int main()
{
    // Declare the variable n.
    int n;
    // Set the counter to 0.
    int k=0;
    // Message to user requesting input.
    printf("Enter an integer greater than 1: ");
    scanf("%d", &n);
    // Clear the screen.
    system("clear");
    // Display the starting integer.
    printf("%d\n", n);
    // Run the recursion and
    // Display the number of iterations.
    printf("Conjecture verified in %d iterations\n", collatz(n,k));
 
    //End
    return 0;
}
