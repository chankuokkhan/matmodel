x0 = 35000;//численность первой армии
y0 = 49000//численность второй армии
t0 = 0;//начальный момент времени
a = 0.55;//константа, характеризующая степень влияния различных факторов на потери армии х
b = 0.9;//эффективность боевых действий армии у
c = 0.8;//эффективность боевых действий армии х
h = 0.63;//константа, характеризующая степень влияния различных факторов на потери армии у
tmax = 1;//предельный момент времени
dt = 0.05;//шаг изменения времени
t = [t0:dt:tmax];
function p=P(t)//возможность подхода подкрепления к армии х
    p = abs(sin(t+1))+1;
endfunction
function q=Q(t)//возможность подхода подкрепления к армии у
    q = cos(13*t)+1;
endfunction
//Система дифференциальных уравнений
function dy=syst1(t, y)
    dy(1) = - a*y(1) - b*y(2) + P(t);//изменение численности первой армии
    dy(2) = - c*y(1) - h*y(2) + Q(t);//изменение численности второй армии
endfunction
v0 = [x0;y0];//Вектор начальных условий
//Решение системы
y = ode(v0,t0,t,syst1);
//Построение графиков решений
scf(0);
plot2d(t,y(1,:),style=2);//График изменения численности армии х (синий)
xtitle('Модель боевых действий № 1','Шаг','Численность армии');
plot2d(t,y(2,:), style = 5);//График изменения численности армии у (красный)
xgrid();
