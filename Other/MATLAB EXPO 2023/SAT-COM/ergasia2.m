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
sat = satellite(sc, semiMajorAxis, eccentricity, inclination, rightAscensionOfAscendingNode, argumentOfPeriapsis, trueAnomaly, OrbitPropagator=orbProp, Name=satName);


% 4. Add Conical Sensor to Satellite
maxViewingAngle = 60;  % degrees in the range [0,180], name-value pair
csName = "Camera";     % name-value pair
camera = conicalSensor(sat, MaxViewAngle=maxViewingAngle, Name=csName);
fieldOfView(camera);

% 5. Add Ground Station to Scenario
latitude = 12.9;  % degrees, value-only argument
longitude = 77.7; % degrees, value-only argument
gsName = "Ground Station";  % name-value pair
gs = groundStation(sc,latitude,longitude, Name=gsName);

% 6. Point Satellite at Ground Station
pointAt(sat, gs);

% 7. Add Access Analysis and Visualize Scenario
ac = access(camera,gs);

% 8. Determine Times When Access Is Achieved, and Visualize Access
acinterval = accessIntervals(ac)
camLat = latitude;   % camera latitude, deg
camLon = longitude;  % camera longitude, deg
camAlt = 2e7;        % camera altitude, m
campos(vwr,camLat,camLon,camAlt);
speedMultiplier = 1000;  % name-value pair
play(sc, PlaybackSpeedMultiplier=speedMultiplier);


