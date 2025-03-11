clc; clear; close all;

%% FACTS Devices for Power System Stability Simulation
% This script simulates the impact of Flexible AC Transmission System (FACTS) devices, such as SVC and STATCOM, on power system stability.

%% System Parameters
V_nominal = 230; % Nominal AC voltage (V)
S_base = 100e6; % Base power (MVA)
X_line = 0.1; % Transmission line reactance (pu)
load_variation = linspace(0.5, 1.5, 100); % Load variation range

%% SVC Parameters
X_svc = 0.05; % SVC reactance (pu)
Q_svc = (V_nominal^2) / X_svc; % Reactive power compensation (VAR)

%% STATCOM Parameters
X_statcom = 0.03; % STATCOM reactance (pu)
Q_statcom = (V_nominal^2) / X_statcom; % Reactive power compensation (VAR)

%% System Stability Analysis
P_load = S_base * load_variation; % Load power (MW)
V_svc = V_nominal + (Q_svc ./ P_load); % Voltage with SVC
V_statcom = V_nominal + (Q_statcom ./ P_load); % Voltage with STATCOM

%% Visualization
figure;
subplot(2,1,1);
plot(load_variation, V_svc, 'r', load_variation, V_statcom, 'b');
legend('SVC', 'STATCOM');
title('Voltage Stability with FACTS Devices');
xlabel('Load Variation (pu)'); ylabel('Voltage (V)'); grid on;

subplot(2,1,2);
plot(load_variation, Q_svc*ones(size(load_variation)), 'r', load_variation, Q_statcom*ones(size(load_variation)), 'b');
legend('SVC Compensation', 'STATCOM Compensation');
title('Reactive Power Compensation');
xlabel('Load Variation (pu)'); ylabel('Reactive Power (VAR)'); grid on;

%% Display Results
disp(['SVC Reactive Power Compensation: ', num2str(Q_svc), ' VAR']);
disp(['STATCOM Reactive Power Compensation: ', num2str(Q_statcom), ' VAR']);
