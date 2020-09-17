%%% Co-orbital Rendezvous Simulator %%%
%% 
%Author: Marco Casanova Álvarez     -     University of Vigo
%Date: 17/09/2020
% The following script can be use to study the trade-off between TOF and
% DeltaV for a co-orbital rendezvouz for any orbit in any planet. DeltaV
% estimated is for Chemical Propulsion, using a Hohmann transfer, but can
% be change in the code for Electrical Propulsion (in that case it would be
% needed as well a change in the TOF of the maneuver).

%Script based on the equations of "Maneuvering In Space" - FAA

%% INPUTS 

SMA_target = 6792.4;     %Semi-major axis of the targeted orbit [km]
anomaly_ini = 0;         %Initial position of the spacecraft [rad]
ang_init = -pi;          %Initial angle between the vehicles [rad]
mu = 3.986e5;            %Standard gravitational parameter for Earth [km^3/s^2] 

%% Operations

ang_travel = 2*pi - ang_init;                                     %rad
omega_target = sqrt(mu/SMA_target^3);                             %rad/s
TOF = ang_travel/omega_target;                                    %s
SMA_phasing = (mu*(ang_travel/(2*pi*omega_target))^2)^(1/3);      %km
v_init = sqrt(mu/SMA_target);                                     %km/s
v_phasing = sqrt(mu/SMA_phasing);                                 %km/s
deltav = v_phasing-v_init;                                        %km/s


