% ============================================
% SIMULACIÓN Y ANÁLISIS DE SEÑALES CON FOURIER
% Autor: Elssye Elizabeth Canizales Martinez
% ============================================

clc;
clear;
close all;

% --------------------------------------------
% 1. Parámetros de tiempo
% --------------------------------------------

fs = 1000;              % Frecuencia de muestreo (Hz)
t = -1:1/fs:1-1/fs;    % Vector de tiempo

% --------------------------------------------
% 2. Crear señales
% --------------------------------------------

% Señal senoidal
f = 5;  
senal_seno = sin(2*pi*f*t);

% Pulso rectangular
pulso = double(abs(t) < 0.2);

% Función escalón
escalon = double(t >= 0);

% --------------------------------------------
% 3. Graficar señales en el tiempo
% --------------------------------------------

figure;
plot(t, senal_seno);
title('Señal senoidal en el dominio del tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

figure;
plot(t, pulso);
title('Pulso rectangular en el dominio del tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

figure;
plot(t, escalon);
title('Función escalón en el dominio del tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

% --------------------------------------------
% 4. Transformada de Fourier
% --------------------------------------------

fft_seno = fft(senal_seno);
fft_pulso = fft(pulso);
fft_escalon = fft(escalon);

n = length(t);
frecuencia = (-n/2:n/2-1)*(fs/n);

% Centrar espectro
fft_seno_shift = fftshift(fft_seno);
fft_pulso_shift = fftshift(fft_pulso);
fft_escalon_shift = fftshift(fft_escalon);

% --------------------------------------------
% 5. Magnitud del espectro
% --------------------------------------------

figure;
plot(frecuencia, abs(fft_seno_shift));
title('Espectro de frecuencia - Señal senoidal');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
grid on;

figure;
plot(frecuencia, abs(fft_pulso_shift));
title('Espectro de frecuencia - Pulso rectangular');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
grid on;

figure;
plot(frecuencia, abs(fft_escalon_shift));
title('Espectro de frecuencia - Función escalón');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
grid on;

% --------------------------------------------
% 6. Fase del espectro
% --------------------------------------------

figure;
plot(frecuencia, angle(fft_seno_shift));
title('Fase - Señal senoidal');
xlabel('Frecuencia (Hz)');
ylabel('Fase');
grid on;

% --------------------------------------------
% 7. Propiedad de linealidad
% --------------------------------------------

senal_combinada = senal_seno + pulso;

fft_combinada = fftshift(fft(senal_combinada));

figure;
plot(frecuencia, abs(fft_combinada));
title('Espectro de señal combinada (Propiedad de linealidad)');
xlabel('Frecuencia (Hz)');
ylabel('Magnitud');
grid on;