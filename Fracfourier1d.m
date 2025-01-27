% Programa FracFourier1d que muestra
% la derivada fraccional de alpha orden
% de una función.

% El orden de la derivada está definido
% en la línea XX (parámetro alpha) y la
% función correspondiente se define en la
% línea XX (y). 
% 
% Programa elaborado para el paper: 
% "Una -fraccional- introducción al cálculo
% fraccional en la física", por 
% Pedro Oliva-Sanchez, Ruben Aguilar-Marquez,
% Javier Alejandro Pérez-Garza, Arath Maldonado-Traconis y
% Servando López-Aguayo, REV.MEX Física.
%***********************************
% Parámetros iniciales
% Paso 1
L = 10; % Longitud del espacio real
N = 256; % Número de puntos
%****************************************
alpha = 1.5; % Orden fraccional de la derivada
%*****************************************

% Calcular dx y dk
dx = L / N;
dk = 2 * pi / L;
%***********************************
%Paso #2
% Definir el vector s
s = -N/2 :1: (N/2 - 1);

% Generar los espacios x y k
x = s * dx; % Espacio real
k = s * dk; % Espacio de Fourier

%***********************************
%Paso #3
% Definir la función y(x) (ejemplo: Gaussiana)
y = exp(-x.^2);

% Calcular la transformada de Fourier de y(x)
F_y = fftshift(fft(y));

%***********************************
% Paso #4

% Multiplicar por (ik)^alpha para obtener la derivada fraccional en Fourier
ik_alpha = (1i * k).^alpha; % Vector complejo (ik)^alpha
DF = ik_alpha .* F_y; % Derivada fraccional en el espacio de Fourier

%***********************************
% Paso #5
% Transformada inversa para obtener la derivada fraccional en x
df = ifft(ifftshift(DF));


%***********************************
% Visualización de los resultados
% Graficar la función original y su derivada fraccional
figure;
subplot(2, 1, 1);
plot(x, y, 'b', 'LineWidth', 1.5);
title('Función original y(x)');
xlabel('x'); ylabel('y(x)'); grid on;

subplot(2, 1, 2);
plot(x, real(df), 'r', 'LineWidth', 1.5);
title(['Derivada fraccional de orden \alpha = ', num2str(alpha)]);
xlabel('x'); ylabel('Real(df)'); grid on;
