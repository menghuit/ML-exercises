%% Initialization
clear ; close all; clc

data = load('ex2data2.txt');
X = data(:, [1, 2]); y = data(:, 3);

plotData(X, y);

X = mapFeature(X(:,1), X(:,2));

lambdas = [0,1,10,100];
num_lambdas = length(lambdas);

for i = 1 : num_lambdas
    % Initialize fitting parameters
	initial_theta = zeros(size(X, 2), 1);

	% Set regularization parameter lambda to 1 (you should vary this)
	lambda = lambdas(i);

	% Set Options
	options = optimset('GradObj', 'on', 'MaxIter', 400);

	% Optimize
	[theta, J, exit_flag] = ...
		fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

    hold on;
	% Plot Boundary
	plotDecisionBoundary(theta, X, y);
	
    title(sprintf('lambda = %g', lambda))

	% Labels and Legend
	xlabel('Microchip Test 1')
	ylabel('Microchip Test 2')

	legend('y = 1', 'y = 0', 'Decision boundary')
	hold off;
end    

