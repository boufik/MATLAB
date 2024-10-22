clear all
close all
clc

% 1. Create Satellite Scenario
startTime = datetime(2020,8,19,20,55,0); % 19 August 2020 8:55 PM UTC, value-only argument
stopTime = startTime + days(1);          % 20 August 2020 8:55 PM UTC, value-only argument
sampleTime = 60;                         % seconds, value-only argument
sc = satelliteScenario(startTime,stopTime,sampleTime);

% 2. Launch Satellite Scenario Viewer
vwr = satelliteScenarioViewer(sc);

% 3. Add Satellite to Scenario
semiMajorAxis = 1e7;               % meters, value-only argument
eccentricity = 0.2;                % unitless, value-only argument
inclination = 0;                   % degrees, value-only argument
rightAscensionOfAscendingNode = 0; % degrees, value-only argument
argumentOfPeriapsis = 0;           % degrees, value-only argument
trueAnomaly = 0;                   % degrees, value-only argument
orbProp = "two-body-keplerian";    % name-value pair
satName = "Satellite";             % name-value pair
sat = satellite(sc, semiMajorAxis, eccentricity, inclination, ...
      rightAscensionOfAscendingNode, argumentOfPeriapsis,trueAnomaly, ...
      OrbitPropagator=orbProp, Name=satName);

% 4. Add Gimbal to Satellite
gimbalSat = gimbal(sat, MountingLocation=[0;1;2]);  % meters

% 5. Add Transmitter to Satellite Gimbal
txMountLoc = [0;0;1];              % Zg meters, name-value pair
txFreq = 10e9;                     % Hz, name-value pair
txPower = 15;                      % dBW, name-value pair
txName = "Satellite Transmitter";  % name-value pair
satTx = transmitter(gimbalSat, MountingLocation=txMountLoc, ...
                    Frequency=txFreq, Power=txPower, Name=txName);
gimbalSat

% 6. Add Antenna to Satellite Transmitter
txDishDiam = 0.5;  % meters, name-value pair
gaussianAntenna(satTx, DishDiameter=txDishDiam)
satTx

% 7. Add Ground Station
latitude = 12.9;                    % degrees, value-only argument
longitude = 77.7;                   % degrees, value-only argument
gsName = "Ground Station";          % name-value pair
gs = groundStation(sc, latitude, longitude, Name=gsName);

% 8. Add Gimbal to the Ground Station
gimbalGs = gimbal(gs, MountingAngles=[0;180;0], MountingLocation=[0;0;-5]);


% 9. Add Receiver to Ground Station Gimbal
gsMountLoc = [0;0;1];  % Zg meters, name-value pair
GoverT = 3;            % dB/K, name-value pair
rqdEbNo = 1;           % dB, name-value pair
rxName = "Ground Station Receiver";  % name-value pair
gsRx = receiver(gimbalGs, MountingLocation=gsMountLoc, GainToNoiseTemperatureRatio=GoverT, RequiredEbNo=rqdEbNo, Name=rxName);
gimbalGs

% 10. Add Antenna to Ground Station receiver
rxDishDiam = 2;  % meters, name-value pair
gaussianAntenna(gsRx, DishDiameter=rxDishDiam);
gsRx

% 11. Set Tracking Targets for Gimbals
pointAt(gimbalSat,gs);
pointAt(gimbalGs, sat);

% 12. Add Link Analysis and Visualize Scenario
lnk = link(satTx,gsRx);
lnkIntervals = linkIntervals(lnk)

% 13. Set the viewer camera (not satellite camera) position for better scenario viewing
camLat = latitude;   % camera latitude, deg
camLon = longitude;  % camera longitude, deg
camAlt = 2e7;        % camera altitude, m
campos(vwr,camLat,camLon,camAlt);
speedMultiplier = 1000;  % name-value pair
play(sc, PlaybackSpeedMultiplier=speedMultiplier);
