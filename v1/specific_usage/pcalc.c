#include <stdio.h>
#include <string.h>

void multiply	(int a, int b) { printf("%i", a*b ); }
void divide	(int a, int b) { printf("%i", a/b ); }
void add	(int a, int b) { printf("%i", a+b ); }
void subtract	(int a, int b) { printf("%i", a-b ); }
void modulus	(int a, int b) { printf("%i", a%b ); }

int resolution(int input, char* op, int input2){
	int i;

	if(strcmp(op, "+")==0){ add		(input, input2); } else
	if(strcmp(op, "-")==0){ subtract	(input, input2); } else
	if(strcmp(op, "*")==0){ multiply	(input, input2); } else
	if(strcmp(op, "/")==0){ divide		(input, input2); } else
	if(strcmp(op, "%")==0){ modulus		(input, input2); } else
	printf("you entered an invalid operator :(");
}

//int parser( char* input ){
//	if(strcmp(op, "+")==0){ add		(input, input2); } else
//	if(strcmp(op, "-")==0){ subtract	(input, input2); } else
//	if(strcmp(op, "*")==0){ multiply	(input, input2); } else
//	if(strcmp(op, "/")==0){ divide		(input, input2); } else
//	if(strcmp(op, "%")==0){ modulus		(input, input2); } else
//
//}

int main(int argc, char* argv[]){

	//Error handling
	printf("%i\n", argc);
	int i=0;
	for(;i<argc;i++){
		printf("%s", argv[i]);
	}
	if( argc != 4 || argc != 2)  { printf("Please use the correct number of arguments\n"); return 0; }
	//if( argv[1]c != 4 )  { printf("The correct number of arguments is 3\n"); return 0; }

	int a=0, b=0;

	a = atoi(argv[1]);
		//catch{ printf("Please enter an integer value or expression."); }
	b = atoi(argv[3]);
		//catch{ printf("Please enter an integer value or expression."); } 

	printf("Attempting to calculate: %i%c%i\n", a, argv[2][0], b);
	resolution(a, argv[2], b);
	printf("\n");
	return 0;
}

