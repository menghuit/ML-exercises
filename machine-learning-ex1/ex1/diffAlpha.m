function diffAlpha(X, y, num_iters)
alphas=[0.1,0.3,1,3];
num_alphas = length(alphas);
m = length(y);

for i = 1:num_alphas

    fprintf('try alpha:%f \n',alphas(i));

    % Init Theta and Run Gradient Descent
    theta = zeros(size(X, 2), 1);
    [theta, J_History] = gradientDescentMulti(X, y, theta, alphas(i), num_iters);

    % Plot the convergence graph
    subplot(1,num_alphas,i);

    plot(1:numel(J_History), J_History, '-b', 'LineWidth', 2);
    xlabel('Number of iterations');
    ylabel('Cost J');

    theta
    fprintf("-----------------end--------------\n");

end

end
