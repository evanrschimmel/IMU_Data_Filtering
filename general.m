clear all
close all
clc

%% Read in matrix
M = readmatrix('IMUdata.xlsx','Sheet','IMUdata','Range','A2:P147925');

%% Write time vectors
OrigTime = M(:,1);
CalTime = M(:,2);

%% Write telemetry vectors
Altitude_Orig = M(:,3);
RotW_Orig = M(:,4);
RotX_Orig = M(:,5);
RotY_Orig = M(:,6);
RotZ_Orig = M(:,7);
LowAccelX_Orig = M(:,8);
LowAccelY_Orig = M(:,9);
LowAccelZ_Orig = M(:,10);
HighAccelX_Orig = M(:,11);
HighAccelY_Orig = M(:,12);
HighAccelZ_Orig = M(:,13);
PosX_Orig = M(:,14);
PosY_Orig = M(:,15);
PosZ_Orig = M(:,16);

%% Calculate Butterworth coefficients
[b, a] = butter(4, 0.0005);

%% Filter data
Altitude_Filt = filtfilt(b,a,Altitude_Orig);
RotW_Filt = filtfilt(b,a,RotW_Orig);
RotX_Filt = filtfilt(b,a,RotX_Orig);
RotY_Filt = filtfilt(b,a,RotY_Orig);
RotZ_Filt = filtfilt(b,a,RotZ_Orig);
LowAccelX_Filt = filtfilt(b,a,LowAccelX_Orig);
LowAccelY_Filt = filtfilt(b,a,LowAccelY_Orig);
LowAccelZ_Filt = filtfilt(b,a,LowAccelZ_Orig);
HighAccelX_Filt = filtfilt(b,a,HighAccelX_Orig);
HighAccelY_Filt = filtfilt(b,a,HighAccelY_Orig);
HighAccelZ_Filt = filtfilt(b,a,HighAccelZ_Orig);
PosX_Filt = filtfilt(b,a,PosX_Orig);
PosY_Filt = filtfilt(b,a,PosY_Orig);
PosZ_Filt = filtfilt(b,a,PosZ_Orig);

%% Plot altitude
figure
hold on
plot(CalTime,Altitude_Orig,'Color','#c3c3c3')
plot(CalTime,Altitude_Filt,'Color','red')
title('Altitude')
hold off

%% Plot rotatation
figure
subplot(4,1,1)
hold on
plot(CalTime,RotW_Orig,'Color','#c3c3c3')
plot(CalTime,RotW_Filt,'Color','red')
hold off
title('RotW')

subplot(4,1,2)
hold on
plot(CalTime,RotX_Orig,'Color','#c3c3c3')
plot(CalTime,RotX_Filt,'Color','red')
hold off
title('RotX')

subplot(4,1,3)
hold on
plot(CalTime,RotY_Orig,'Color','#c3c3c3')
plot(CalTime,RotY_Filt,'Color','red')
hold off
title('RotY')

subplot(4,1,4)
hold on
plot(CalTime,RotZ_Orig,'Color','#c3c3c3')
plot(CalTime,RotZ_Filt,'Color','red')
hold off
title('RotZ')

%% Plot low accel
figure
subplot(3,1,1)
hold on
plot(CalTime,LowAccelX_Orig,'Color','#c3c3c3')
plot(CalTime,LowAccelX_Filt,'Color','red')
hold off
title('LowAccelX')

subplot(3,1,2)
hold on
plot(CalTime,LowAccelY_Orig,'Color','#c3c3c3')
plot(CalTime,LowAccelY_Filt,'Color','red')
hold off
title('LowAccelY')

subplot(3,1,3)
hold on
plot(CalTime,LowAccelZ_Orig,'Color','#c3c3c3')
plot(CalTime,LowAccelZ_Filt,'Color','red')
hold off
title('LowAccelZ')

%% Plot high accel
figure
subplot(3,1,1)
hold on
plot(CalTime,HighAccelX_Orig,'Color','#c3c3c3')
plot(CalTime,HighAccelX_Filt,'Color','red')
hold off
title('HighAccelX')

subplot(3,1,2)
hold on
plot(CalTime,HighAccelY_Orig,'Color','#c3c3c3')
plot(CalTime,HighAccelY_Filt,'Color','red')
hold off
title('HighAccelY')

subplot(3,1,3)
hold on
plot(CalTime,HighAccelZ_Orig,'Color','#c3c3c3')
plot(CalTime,HighAccelZ_Filt,'Color','red')
hold off
title('HighAccelZ')

%% Plot position
figure
subplot(3,1,1)
hold on
plot(CalTime,PosX_Orig,'Color','#c3c3c3')
plot(CalTime,PosX_Filt,'Color','red')
hold off
title('PosX')

subplot(3,1,2)
hold on
plot(CalTime,PosY_Orig,'Color','#c3c3c3')
plot(CalTime,PosY_Filt,'Color','red')
hold off
title('PosY')

subplot(3,1,3)
hold on
plot(CalTime,PosZ_Orig,'Color','#c3c3c3')
plot(CalTime,PosZ_Filt,'Color','red')
hold off
title('PosZ')
