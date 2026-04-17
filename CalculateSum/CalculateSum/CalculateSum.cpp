// The purpose of this program is to showcase the calculation of 3 integers in C++ and Intel x86 ASM.

#include <iostream>

extern "C" int AdderASM(int a, int b, int c);
int AdderCPP(int a, int b, int c); // Recall prototype is needed.

int main()
{
	int a = 10, b = 20, c = 30;

	int sumCPP = AdderCPP(a, b, c);
	printf("The CPP sum: %d\n", sumCPP);

	int sumASM = AdderASM(a, b, c);
	printf("The ASM sum: %d\n", sumASM);
	
	return 0;
}


int AdderCPP(int a, int b, int c)
{
	return a + b + c;
}