% Electrical Stimulation and FFT Analysis

% Parameters
fs = 100000; % Sampling frequency (Hz)
t = 0:1/fs:0.1; % Time vector (0.1 seconds duration)
amplitude = 5; % Stimulation amplitude (mA)
frequency = 50; % Stimulation frequency (Hz)

% Generate Waveforms
sin_wave = amplitude * sin(2 * pi * frequency * t); % Sinusoidal waveform
rect_wave = amplitude * square(2 * pi * frequency * t); % Rectangular waveform
tri_wave = amplitude * (2 * sawtooth(2 * pi * frequency * t, 0.5) - 1); % Triangular waveform

% FFT Analysis
n = length(t); % Number of samples
f = (0:n-1) * (fs / n); % Frequency vector

fft_sin = abs(fft(sin_wave)) / n; % Normalized FFT for sine wave
fft_rect = abs(fft(rect_wave)) / n; % Normalized FFT for rectangular wave
fft_tri = abs(fft(tri_wave)) / n; % Normalized FFT for triangular wave

% Plot Time-Domain Waveforms
figure;

subplot(3,2,1);
plot(t, sin_wave, 'r', 'LineWidth', 2);
title('Sinusoidal Waveform (Time Domain)');
xlabel('Time (s)');
ylabel('Amplitude (mA)');
xlim([0 0.02]); % Zoom in for better visualization
grid on;

subplot(3,2,3);
plot(t, rect_wave, 'b', 'LineWidth', 2);
title('Rectangular Waveform (Time Domain)');
xlabel('Time (s)');
ylabel('Amplitude (mA)');
xlim([0 0.02]);
grid on;

subplot(3,2,5);
plot(t, tri_wave, 'g', 'LineWidth', 2);
title('Triangular Waveform (Time Domain)');
xlabel('Time (s)');
ylabel('Amplitude (mA)');
xlim([0 0.02]);
grid on;

% Plot FFT Results
subplot(3,2,2);
plot(f(1:n/2), fft_sin(1:n/2), 'r', 'LineWidth', 2);
title('FFT of Sinusoidal Waveform');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0 500]); % Focus on key frequencies
grid on;

subplot(3,2,4);
plot(f(1:n/2), fft_rect(1:n/2), 'b', 'LineWidth', 2);
title('FFT of Rectangular Waveform');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0 500]);
grid on;

subplot(3,2,6);
plot(f(1:n/2), fft_tri(1:n/2), 'g', 'LineWidth', 2);
title('FFT of Triangular Waveform');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([0 500]);
grid on;

% Display Message
disp('Waveforms and FFT analysis have been successfully plotted.');

