#include <omp.h>
#include <cstdio>
#include <chrono>

void funcion1() {
	printf("[COMIENZO]\n");

	#pragma omp parallel num_threads(8)
	{
		int id = omp_get_thread_num();
		int num = omp_get_num_threads();		

		if (id == 0) {
			printf("Hola desde el hilo %d --- Soy el hilo maestro, somos %d\n", id, num);
		} else {
			printf("Hola desde el hilo %d\n", id);
		}
	}

	printf("[FINAL]\n");
}

void funcion2() {
	printf("[COMIENZO]\n");

	#pragma omp parallel num_threads(11)
	{
		int id = omp_get_thread_num();
		int num = omp_get_num_threads();

		double tinicial = omp_get_wtime();
		float res = 48.5;
		for (float i = 1; i < 15000000; i++) {
			res *= i * i * i * i * i;
		}
		double tfinal = omp_get_wtime();
		double tiempo = tfinal - tinicial;		

		printf("[Proceso %d] %4.8f s!, el resultado es %4.4f\n", id, tiempo, res);
	}

	printf("[FINAL]\n");
}

void funcion3(bool para) {
	const int size = 100;
	double* vect1 = new double[size];
	double* vect2 = new double[size];
	double* vect3 = new double[size];

	for (int i = 0; i < size; i++) {
		vect1[i] = (double)i;
		vect2[i] = 2.0 * (double)i;
	}	

	if (para) {
		#pragma omp parallel num_threads(4)
		{
			int id = omp_get_thread_num();
			int num = omp_get_num_threads();

			#define CHUNK 10
			#pragma omp for schedule(dynamic, CHUNK)
			for (int i = 0; i < size; i++) {				
				vect3[i] = vect1[i] + vect2[i];
				printf("[Proceso %d] He calculado %f (indice=%d)\n", id, vect3[i], i);
			}
		}

	} else {
		// const clock_t start = clock();
		for (int i = 0; i < size; i++) {
			vect1[i] = (double)i;
			vect2[i] = 2.0 * (double)i;
			vect3[i] = vect1[i] + vect2[i];
		}
		// double _time = (double) (clock() - start)/CLOCKS_PER_SEC;
	}
}

void funcion4() {

	for (int size = 100; size <= 100100; size += 1000) {
		double* vect1 = new double[size];
		double* vect2 = new double[size];
		double* vect3 = new double[size];

		for (int i = 0; i < size; i++) {
			vect1[i] = (double)i;
			vect2[i] = 2.0 * (double)i;
		}

		for (int chunk = 10; chunk <= 100010; chunk += 100) {
			double tinicial = omp_get_wtime();
			#pragma omp parallel num_threads(10)
			{
				int id = omp_get_thread_num();
				int num = omp_get_num_threads();

				#pragma omp for schedule(static, chunk)
				for (int i = 0; i < size; i++) {
					vect3[i] = vect1[i] + vect2[i];
				}
			}
			double tfinal = omp_get_wtime();
			double tiempo = tfinal - tinicial;

			printf("Tiempo que tarda con %d elementos y grupo de %d iteraciones: %f\n", size, chunk, tiempo);
		}
	}
}

void funcion5(bool para) {
	const int size = 100;
	double* vect1 = new double[size];
	double* vect2 = new double[size];
	double* suma = new double[size];
	double* mult = new double[size];

	for (int i = 0; i < size; i++) {
		vect1[i] = (double)i;
		vect2[i] = 2.0 * (double)i;
	}

	if (para) {

		#pragma omp parallel num_threads(2)
		{		
			int id = omp_get_thread_num();
			#pragma omp sections nowait
			{				
				#pragma omp section 
				{					
					for (int i = 0; i < size; i++) {
						suma[i] = vect1[i] + vect2[i];
						printf("[Proceso %d] (Suma) He calculado %f (indice=%d)\n", id, suma[i], i);
					}
				}
				#pragma omp section 
				{			
					for (int i = 0; i < size; i++) {
						mult[i] = vect1[i] * vect2[i];
						printf("[Proceso %d] (Multiplicacion) He calculado %f (indice=%d)\n", id, mult[i], i);
					}
				}
			}
		}

	} else {
		for (int i = 0; i < size; i++) suma[i] = vect1[i] + vect2[i];
		for (int i = 0; i < size; i++) mult[i] = vect1[i] * vect2[i];
	}
}

void funcion6() {
	const int size = 100;
	double* vect1 = new double[size];
	double* vect2 = new double[size];
	double* suma = new double[size];
	double* mult = new double[size];

	for (int i = 0; i < size; i++) {
		vect1[i] = (double)i;
		vect2[i] = 2.0 * (double)i;
	}

	#pragma omp parallel num_threads(4)
	{
		int id = omp_get_thread_num();
		#pragma omp sections nowait
		{
			#pragma omp section 
			{
				for (int i = 0; i < size/2; i++) {
					suma[i] = vect1[i] + vect2[i];
					printf("[Proceso %d] (Suma) He calculado %f (indice=%d)\n", id, suma[i], i);
				}
			}
			#pragma omp section 
			{
				for (int i = 0; i < size/2; i++) {
					mult[i] = vect1[i] * vect2[i];
					printf("[Proceso %d] (Multiplicacion) He calculado %f (indice=%d)\n", id, mult[i], i);
				}
			}
			#pragma omp section 
			{
				for (int i = size/2; i < size; i++) {
					suma[i] = vect1[i] + vect2[i];
					printf("[Proceso %d] (Suma) He calculado %f (indice=%d)\n", id, suma[i], i);
				}
			}
			#pragma omp section 
			{
				for (int i = size/2; i < size; i++) {
					mult[i] = vect1[i] * vect2[i];
					printf("[Proceso %d] (Multiplicacion) He calculado %f (indice=%d)\n", id, mult[i], i);
				}
			}
		}
	}
}

int main(int argc, char* argv[])
{
	//funcion1();
	//funcion2();
	//funcion3(true);
	//funcion4();
	//funcion5(true);
	funcion6();
	return 0;
}