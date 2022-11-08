%---------------------------
% deformedplot.m
% Programmed by Ebru Baglan
%---------------------------

clc,clear,close all

% Given
nnods = 6;
ndofn = 1;
coords = [0 2 4 6 8 10];
cordsn = [0 2.4 4.8 7.2 9.6 12];
plotx(:,1) = [0 2 2 4 4 6 6 8 8 10 ]';
ploty = zeros(10,1);

grayColor = [.7 .7 .7];
plot(plotx,ploty,'b-o','Color', grayColor,'LineWidth',8);
hold on

% Output result
plotx(:,1) = [0 2.4 2.4 4.8 4.8 7.2 7.2 9.6 9.6 12]';
plot(plotx,ploty,'b-o','LineWidth',1) ;

xmin = 0; xmax = 15; ymin = -0.5; ymax = 0.5;
xlim([ xmin, xmax ]);
ylim([ ymin, ymax ]);
title('Deformation profile');
xlabel('x-coordinate') ;
ylabel('y-coordinate') ;

for inod = 2: nnods
    for idof = 1: ndofn
        ii = (inod-1)*ndofn + idof;
        % old coordinates written
        textString = sprintf('%.1f', coords(ii));
        text(coords(ii)-0.7, -0.04, textString,...
            'FontSize', 10,'Color',grayColor);
        % new coordinates written
        textStringn = sprintf('%.1f', cordsn(ii));
        text(cordsn(ii)+0.05, 0.05, textStringn,...
            'FontSize', 10,'Color','b','FontWeight','bold');
        hold on;
    end
end

% Grid
grid on
ax = gca;
ax.XGrid = 'on';
ax.XMinorGrid = 'on';
ax.GridColor = grayColor;

legend('Initial','Deformed')

% Get HQ picture
exportgraphics(ax,'outpic.png','Resolution',300)
