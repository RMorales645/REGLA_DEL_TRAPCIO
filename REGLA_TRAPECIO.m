clc;
clear;

% Definir la función
f = @(x) 0.2 + 25.*x - 200.*x.^2 + 675.*x.^3 - 900.*x.^4 + 400.*x.^5;

% Límites de integración
a = 0;
b = 0.8;

% Valor exacto (dado en el enunciado)
I_exacto = 1.640533;

% Solicitar valor de n
n = input('Ingrese el número de subintervalos n (entero positivo): ');

% Verificar que n sea válido
if mod(n, 1) ~= 0 || n <= 0
    error('n debe ser un número entero positivo');
end

% Calcular el tamaño de paso
h = (b - a) / n;

% Crear los puntos x
x = linspace(a, b, n + 1);  % Garantiza n+1 puntos, incluyendo a y b

% Evaluar la función en esos puntos
y = f(x);

% Aplicar la regla del trapecio compuesta
I_aprox = (h/2) * (y(1) + 2*sum(y(2:end-1)) + y(end));

% Calcular errores
error_abs = abs(I_exacto - I_aprox);
error_porcentual = (error_abs / I_exacto) * 100;

% Mostrar resultados
fprintf('\n--- Resultado con n = %d ---\n', n);
fprintf('Aproximación por regla del trapecio: %.6f\n', I_aprox);
fprintf('Valor exacto: %.6f\n', I_exacto);
fprintf('Error absoluto: %.6f\n', error_abs);
fprintf('Error porcentual: %.4f%%\n', error_porcentual);
