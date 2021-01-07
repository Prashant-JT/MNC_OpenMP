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

figure(1);
subplot(4,1,1);
plot((1:8), iter10);
hold on
title("Tiempo empleado para 10 conjunto de iteraciones");
xlabel("Tamaño del vector");
ylabel("Tiempo (segundos)");
xlim([1 9]);
ylim([-0.1 0.6]);
xticklabels(tam);
grid on;
hold off

subplot(4,1,2);
plot((1:8), iter100);
hold on
title("Tiempo empleado para 100 conjunto de iteraciones");
xlabel("Tamaño del vector");
ylabel("Tiempo (segundos)");
xlim([1 9]);
ylim([-0.1 0.6]);
xticklabels(tam);
grid on;
hold off

subplot(4,1,3);
plot((1:8), iter1000);
hold on
title("Tiempo empleado para 1000 conjunto de iteraciones");
xlabel("Tamaño del vector");
ylabel("Tiempo (segundos)");
xlim([1 9]);
ylim([-0.1 0.6]);
xticklabels(tam);
grid on;
hold off

subplot(4,1,4);
plot((1:8), iter10000);
hold on
title("Tiempo empleado para 10000 conjunto de iteraciones");
xlabel("Tamaño del vector");
ylabel("Tiempo (segundos)");
xlim([1 9]);
ylim([-0.1 0.6]);
xticklabels(tam);
grid on;
hold off

figure(2);
subplot(4,1,1);
plot((1:8), iter100000);
hold on
title("Tiempo empleado para 100000 conjunto de iteraciones");
xlabel("Tamaño del vector");
ylabel("Tiempo (segundos)");
xlim([1 9]);
ylim([-0.1 0.6]);
xticklabels(tam);
grid on;
hold off

subplot(4,1,2);
plot((1:8), iter1000000);
hold on
title("Tiempo empleado para 1000000 conjunto de iteraciones");
xlabel("Tamaño del vector");
ylabel("Tiempo (segundos)");
xlim([1 9]);
ylim([-0.1 0.6]);
xticklabels(tam);
grid on;
hold off

subplot(4,1,3);
plot((1:8), iter10000000);
hold on
title("Tiempo empleado para 10000000 conjunto de iteraciones");
xlabel("Tamaño del vector");
ylabel("Tiempo (segundos)");
xlim([1 9]);
ylim([-0.1 0.6]);
xticklabels(tam);
grid on;
hold off

subplot(4,1,4);
plot((1:8), iter100000000);
hold on
title("Tiempo empleado para 100000000 conjunto de iteraciones");
xlabel("Tamaño del vector");
ylabel("Tiempo (segundos)");
xlim([1 9]);
ylim([-0.1 0.6]);
xticklabels(tam);
grid on;
hold off

figure(3)
plot((1:8), iter10);
hold on
plot((1:8), iter100, 'Color',[0 0 0]);
plot((1:8), iter1000, 'Color',[0 0 1]);
plot((1:8), iter10000, 'Color',[0 1 0]);
plot((1:8), iter100000, 'Color',[0 1 1]);
plot((1:8), iter1000000, 'Color',[1 0 0]);
plot((1:8), iter10000000, 'Color',[1 1 0]);
plot((1:8), iter100000000, 'Color',[1 0.5 0.5]);
title("Tiempo empleado para según el conjunto de iteraciones");
xlabel("Tamaño del vector");
ylabel("Tiempo (segundos)");
xlim([1 9]);
ylim([-0.1 0.6]);
xticklabels(tam);
legend('CHUNK 10','CHUNK 100', 'CHUNK 1000', 'CHUNK 10000', 'CHUNK 100000', ...
'CHUNK 1000000', 'CHUNK 10000000', 'CHUNK 100000000', 'Location', 'northwest');
grid on;
hold off;

