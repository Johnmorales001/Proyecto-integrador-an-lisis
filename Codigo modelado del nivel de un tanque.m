% RANGO DE INTEGRACION
xi = 0;
xf = 300;

% VALORES INICIALES DE "y" y "u"
h = 1.5;
P1 = 150;
P3 = 101.3;

% PARAMETROS
D = 1;
P0 = 101.3;
RHO = 1000;
G = 9.81;
CV1 = 1.5E-3;
CV2 = 1.5E-3;

% SECCION DE INICIACION
% ---------------------------------------------------
dx = 0.001;
XPRINT = 5;     % INTERVALO DE IMPRESION DE DATOS
X = xi:dx:xf;
n = length(X);
Y = zeros(1, n);  % Preasignar el tamaño del vector Y
Y(1) = h;         % Asignar el valor inicial
% ---------------------------------------------------

for i = 1:n-1
    % SECCION DE ECUACIONES
    % ---------------------------------------------------
    r = D/2;
    A = pi() * r^2;
    PH = RHO * G * h / 1000;
    P2 = P0 + PH;
    F1 = CV1 * sqrt(P1 - P2);
    F2 = CV2 * sqrt(P2 - P3);
    dh = (1 / A) * (F1 - F2);

    % SECCION DE INTEGRACION
    % ---------------------------------------------------
    h = INT_EULER(h, dh, dx);
    Y(i + 1) = h;
end

% SECCION DE PRESENTACION DE RESULTADOS
% ---------------------------------------------------
% GRAFICA DE APROXIMACION DE EULER
plot(X, Y, 'b-', 'LineWidth', 1)
xlabel('x')
ylabel('y')
axis square
axis([0 xf 0 2])
ax = gca;
ax.FontName = 'Arial';
ax.FontSize = 12;
legend('Aprox. Euler') % Actualiza la leyenda
hold off

% FUNCION DE INTEGRACION
function y = INT_EULER(y, dy, dx)
    y = y + dy * dx;
end