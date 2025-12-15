// MemoryAddressing.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>


extern "C" int MemoryAddressing(int i, int* v1, int *v2, int * v3, int *v4);
extern "C" int fibValuesCount;


int main()
{
	int v1 = 0, v2 = 0, v3 = 0, v4 = 0;
	int returnValues;

	for (int i = 0; i <= fibValuesCount; i++)
	{
		returnValues = MemoryAddressing(i, &v1, &v2, &v3, &v4);

		printf("Return Values:  %5d   v1:   %5d    v2:   %5d   v3:   %5d    v4:    %5d \n", returnValues, v1, v2, v3, v4);

	}

	return 0;


}

