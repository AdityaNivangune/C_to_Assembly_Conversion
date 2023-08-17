#include <stdio.h>
#include <stdlib.h>

int arr[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

int main(void){
	int i;
	
	printf("Array before reverse : ");
	for(i = 0; i < 10; ++i){
		printf("%d ", arr[i]);
	}
	printf("\n");
	
	printf("Array after reverse :  ");
	for(i = 9; i >= 0; --i){
		printf("%d ", arr[i]);
	}
	printf("\n");
	
	exit(0);
}
