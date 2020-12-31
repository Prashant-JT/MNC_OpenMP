clc;
clear;

tam = [10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000];
iter10 = [0.0006045, 6e-06, 7e-06, 1.58e-05, 0.000308, 0.0050594, 0.0452629, 0.536126];
iter100 = [0.0003177, 2.04e-05, 1.16e-05, 1.56e-05, 0.0001002, 0.00283, 0.0259107, 0.28812];
iter1000 = [0.0007084, 6e-06, 8.6e-06, 1.13e-05, 6.78e-05, 0.0021816, 0.0220225, 0.221415];
iter10000 = [0.0005599, 9.3e-06, 9.3e-06, 2.21e-05, 4.69e-05, 0.0022083, 0.021026, 0.210557];
iter100000 = [0.0005451, 6e-06, 6.3e-06, 2.21e-05, 0.000195, 0.0019312, 0.0212302, 0.20872];
iter1000000 = [0.0005936, 5.8e-06, 5e-06, 6.59e-05, 0.0001947, 0.002246, 0.0216357, 0.206577];
iter10000000 = [0.0003739, 7.4e-06, 5.8e-06, 3.44e-05, 0.0002023, 0.0021484, 0.0232137, 0.210441];
iter100000000 = [0.0004526, 1.07e-05, 1.08e-05, 2.6e-05, 0.0003525, 0.0022729, 0.0236772, 0.240586];

subplot(4,2,1);
plot(iter10, (1:8));
hold on
title("Tiempo empleado para 10 conjunto de iteraciones");
ylabel("Tamaño del vector");
xlabel("Tiempo (segundos)");
ylim([1 9]);
yticklabels(tam);
grid on;
hold off

subplot(4,2,2);
plot(iter100, (1:8));
hold on
title("Tiempo empleado para 100 conjunto de iteraciones");
ylabel("Tamaño del vector");
xlabel("Tiempo (segundos)");
ylim([1 9]);
yticklabels(tam);
grid on;
hold off

subplot(4,2,3);
plot(iter1000, (1:8));
hold on
title("Tiempo empleado para 1000 conjunto de iteraciones");
ylabel("Tamaño del vector");
xlabel("Tiempo (segundos)");
ylim([1 9]);
yticklabels(tam);
grid on;
hold off

subplot(4,2,4);
plot(iter10000, (1:8));
hold on
title("Tiempo empleado para 10000 conjunto de iteraciones");
ylabel("Tamaño del vector");
xlabel("Tiempo (segundos)");
ylim([1 9]);
yticklabels(tam);
grid on;
hold off

subplot(4,2,5);
plot(iter100000, (1:8));
hold on
title("Tiempo empleado para 100000 conjunto de iteraciones");
ylabel("Tamaño del vector");
xlabel("Tiempo (segundos)");
ylim([1 9]);
yticklabels(tam);
grid on;
hold off

subplot(4,2,6);
plot(iter1000000, (1:8));
hold on
title("Tiempo empleado para 1000000 conjunto de iteraciones");
ylabel("Tamaño del vector");
xlabel("Tiempo (segundos)");
ylim([1 9]);
yticklabels(tam);
grid on;
hold off

subplot(4,2,7);
plot(iter10000000, (1:8));
hold on
title("Tiempo empleado para 10000000 conjunto de iteraciones");
ylabel("Tamaño del vector");
xlabel("Tiempo (segundos)");
ylim([1 9]);
yticklabels(tam);
grid on;
hold off

subplot(4,2,8);
plot(iter100000000, (1:8));
hold on
title("Tiempo empleado para 100000000 conjunto de iteraciones");
ylabel("Tamaño del vector");
xlabel("Tiempo (segundos)");
ylim([1 9]);
yticklabels(tam);
grid on;
hold off