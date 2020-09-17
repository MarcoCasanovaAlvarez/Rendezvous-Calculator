%%% Coplanar Rendezvous Simulator %%%
%% 
%Author: Marco Casanova Álvarez     -     University of Vigo
%Date: 17/09/2020
% The following script can be use to study the trade-off between wait time and
% DeltaV for a coplanar rendezvouz for any orbit in any planet. DeltaV
% estimated is for Chemical Propulsion, using a Hohmann transfer, but can
% be change in the code for Electrical Propulsion (in that case it would be
% needed as well a change in the TOF of the maneuver). 

% The input parameters are the orbit of the rendezvous, the orbit of the
% spacecrafts who wants to perform the rendezvous (or a range to study the
% variations of DeltaV and Wait time), the standard gravitational parameter
% of the planet and the initial angle between both vehicles.

% NOTE: Wait time for the same orbit is infinit. To represent well the wait
% time, a ylim in the plot was added.

%Script based on the equations of "Maneuvering In Space" - FAA

%% INPUTS

R_interceptor = linspace(7000,12000,1000); %Range or value of the radius of the orbit of the interceptor [km]
R_target = 8000;                           %Radius of the orbit of the target [km]
ang_init = pi;                              %Initial angle between spacecrafts [rad]
mu = 3.986e5;                              %Standard gravitational parameter for Earth [km^3/s^2] 

%% OPERATIONS

a_transfer = (R_interceptor + R_target) / 2;     %km
TOF = pi * sqrt(a_transfer.^3/mu);               %s
omega_interceptor = sqrt(mu./R_interceptor.^3);  %rad/s
omega_target = sqrt(mu/R_target.^3);             %rad/s
alpha = omega_target * TOF;                      %rad
ang_final = pi - alpha;                          %rad
Wait_time = (ang_final - ang_init)./(omega_target - omega_interceptor);
Wait_time_hr = Wait_time /1200;
Wait_time_day = Wait_time /(1200*24);
v_init = sqrt(mu./R_interceptor);                %km/s
v_target = sqrt(mu./R_target);                   %km/s
deltav = v_target-v_init;                        %km/s

%% PLOT
figure
set(gca,'FontSize',10);
plot(R_interceptor,deltav)
grid on
hold on
xlabel('Phasing Orbit Radius [km]')
ylabel('Delta-V  [km/s]')
title('Orbit Phasing trade-off')
yyaxis right
plot(R_interceptor, Wait_time_day)
ylim([-50 50])
ylabel('Wait time [days]')
xline(R_target)
legend('Delta-V','Wait Time','Target Orbit')
hold off

