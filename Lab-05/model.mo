model Project
  parameter  Real a=0.15;
  parameter  Real b=0.044;
  parameter  Real c=0.35;
  parameter  Real d=0.032;
  
  Real x(start=9);
  Real y(start=14);
  
  equation
    der(x)= -a*x + b*x*y;
    der(y)= c*y - d*x*y;

  
  annotation(experiment(StartTime=0, StopTime=400, Tplerance=1e-06,Interval=0.05));

end Project;
