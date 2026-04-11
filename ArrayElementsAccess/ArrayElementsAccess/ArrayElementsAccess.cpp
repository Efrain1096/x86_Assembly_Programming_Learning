// ArrayElementsAccess.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>


// Remember to do function prototypes.

extern "C" int CalcArraySumASM(int *x, int n);


int CalcArraySumCPP(int *x, int n)
{

	int sum = 0;
	for (int i = 0; i < n; i++)
	{
		sum += *x++;
	}

	return sum;
}


int main()
{
	int index = 10;
	int x[] = { 1,3,5,7,9,11 };
	int n = sizeof(x) / sizeof(int);
	int assembly_sum, cpp_sum;
	assembly_sum = CalcArraySumASM(x, n);
	cpp_sum = CalcArraySumCPP(x, n);

	printf("Assembly sum = %d\n", assembly_sum);
	printf("C++ sum = %d\n", cpp_sum);

	return 0;

}
