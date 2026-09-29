// CalcArrayCube.cpp.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>

//int x[3][2] are stored in memory as follows: x[0][0], x[0][1], x[1][0], x[1][1], x[2][0], and x[2][1]


void CalcArrayCube(int *y, const int *x, int nRows, int nCols)
{
	for (int i = 0; i < nRows; i++)
	{
		for (int j = 0; j < nCols; j++)
		{
			int k = i * nCols + j;
			y[k] = x[k] * x[k] * x[k];
		}
	}
}



int main()
{
	const int nRows = 4;
	const int nCols = 3;
	int x[nRows][nCols] = {{1,2,3},{4,5,6},{7,8,9},{10,11,12}};
	int y[nRows][nCols];

	CalcArrayCube(&y[0][0], &x[0][0], nRows, nCols);

	
	for (int i = 0; i < nRows; i++)
	{
		for (int j = 0; j < nCols; j++)
		{
				printf("(%2d, %2d) : %6d, %6d\n", i, j, x[i][j], y[i][j]);
		}
	}

	return 0;
}

