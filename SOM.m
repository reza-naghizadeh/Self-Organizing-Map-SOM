clc
clear

% Reading the data from csv file
points = readmatrix("iris.csv");

% splitting the data to two dimension
for i = 1:length(points)
    x1(i) = points(i,1);
    x2(i) = points(i,2);
end

% Amount of rows and columns

rows = input('Enter rows amout : ');
columns = input('Enter columns amout : ');

%  Initial weight as random numbers
w = rand(rows, columns, 2);

% Splitting the weight to two (just to work with them easily)
w1 = w(:,:,1);
w2 = w(:,:,2);

% Lerning rate
lrMax = 0.9;
lrMin = 0.1;

% Max and min for sigma
qMax = 10;
qMin = 1;

% Epoch controllerx
epochs = input('Enter epochs amoutn : ');

for epoch = 1:epochs
    for i=1:length(points)
        % Finding the distance
        dist = sqrt((((x1(i)-w1).^2) + (x2(i)-w2).^2));
        % Finding the min distance
        % Setting a point 1,1 as min
        minx=1;
        miny=1;
        minDist = dist(minx,miny);
        % Checking other points and update the min
        for row = 1:rows
            for column = 1:columns
                if dist(row,column) < minDist
                    minDist = dist(row,column);
                    distx=row;
                    disty=column;
                end
            end
        end
        % Store the coordinate of winner into two variables
        xwinner = distx;
        ywinner = disty;

        % Compute the learning rate
        learningRate = (lrMax - lrMin) * ((epochs - epoch) / (epochs - 1)) + lrMin;
        % Compute the sigma
        sigma = (qMax - qMin) * ((epochs - epoch) / (epochs - 1)) + qMin;

        % Update the weights
        for row = 1:rows
            for column = 1:columns
                % Compute the neighbor function
                distance = (xwinner - row) ^2 + (ywinner - column) ^2;
                neighborfunc = exp(-distance / (2 * sigma ^2));
                w1(row,column) = w1(row,column) + learningRate * neighborfunc * (x1(i) - w1(row,column));
                w2(row,column) = w2(row,column) + learningRate * neighborfunc * (x2(i) - w2(row,column));
            end
        end
    end

    % Updating the figure for each epoch
    figure(1)
    % Plot the points
    plot(x1,x2,'.k')
    hold on
    % Plot the weight coordinate with black circle shape
    plot(w1,w2,'ok')
    % Connect the weights to each other with red line
    plot(w1,w2,'red')
    % Connect the elements of weights to each other with blue line
    plot(w1',w2','blue')
    hold off
    % Print out the epoch number as title
    title(['t=' num2str(epoch)]);
end

