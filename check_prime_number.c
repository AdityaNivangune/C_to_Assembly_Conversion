#include <stdio.h>
#include <stdlib.h>

#define TRUE	1
#define FALSE	0

int is_prime(int);

int num , result = FALSE;

int main(void){

	printf("Enter number : ");
	scanf("%d", &num);

	result = is_prime(num);

	if(result == TRUE){
		printf("%d is a Prime Number\n", num);
	}else{
		printf("%d is not a Prime Number\n", num);
	}

	return (0);
}

int is_prime(int chk_num){

	int i;

	if(chk_num <= 1)
		return FALSE;
	else if(chk_num == 2)
		return TRUE;

	for(i = 2; i < chk_num; ++i){
		if(chk_num % i == 0)
			return FALSE;
	}

	return TRUE;
}
