#include <stdio.h>
#include <stdlib.h>

#define TRUE	1
#define FALSE	0

int is_perfect(int chk_num);
int num, result = FALSE;

int main(void){
	
	printf("Enter number : ");
	scanf("%d", &num);

	result = is_perfect(num);
	if(result == TRUE)
		printf("%d is a Perfect Number.\n", num);
	else
		printf("%d is not a Perfect Number.\n", num);

	return (0);
}

int is_perfect(int chk_num){
	int i, sum_of_div = 0;

	if(chk_num < 6)
		return FALSE;

	for(i = 1; i < chk_num; ++i){
		if(chk_num % i == 0){
			sum_of_div += i;
		}
	}

	if(chk_num == sum_of_div)
		return TRUE;
		
	return FALSE;
}
