// IntegersExploration.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

extern "C" char GlChar = 10; // Extern is needed to access globally.
extern "C" short GlShort = 20;
extern "C" int GlInt = 30;
extern "C" long long GlongLong = 344566;

extern "C" void IntegerAddition(char a, short b, int c, long long d);

int main()
{


	IntegerAddition(3, 5, -37, 11);

	printf("Int value %d \n", GlChar);
	printf("Int value %d \n", GlShort);
	printf("Int value %d \n", GlInt);
	printf("Int value %d \n", GlongLong);


	return 0;


}

