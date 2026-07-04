
#include <iostream>


extern "C" int CalcArraySquaresASM(int *y, int *x, int n);
int CalcArraySquaresCPP(int *y, int *x, int n);



int main()
{

	int x[] = { 1,2,3,4,5,6,7 };
	const int arrayLength = sizeof(x) / sizeof(int);


	int yCpp[arrayLength];
	int yAsm[arrayLength];
	int resultCPP, resultASM;

	resultCPP = CalcArraySquaresCPP(yCpp, x, arrayLength);
	resultASM = CalcArraySquaresASM(yAsm, x, arrayLength);

	for (int i = 0; i < arrayLength; i++)
	{
		std::printf("CPP result for yCPP i = %d, y = %d\n", i, yCpp[i]);
		std::printf("ASM result for yAsm i = %d, y = %d\n", i, yAsm[i]);
	}

	
}

int CalcArraySquaresCPP(int *y, int *x, int n)
{
	int sum = 0;
	for (int i = 0; i < n; i++)
	{
		y[i] = x[i] * x[i];
		sum += y[i];
	}

	return sum;
}