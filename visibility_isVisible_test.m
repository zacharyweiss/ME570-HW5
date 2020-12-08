function visibility_isVisible_test()
%load polygonWorld
load('polygonWorld','world','xStart');
%initialize plot variables
nStart = size(xStart,2);
xStart(:,nStart) = world(3).vertices(:,1);
for iStart = 1:nStart
    %new figure for each starting point
    figure(iStart)
    hold on
    %check visibility for each starting point with all vertices in world
    x = xStart(:,iStart);
    polygonworld_draw(world,x)
    idxVisibleVertices = visibility_isVisible(world,x);
    nbVisible = numel(idxVisibleVertices);
    nbPoly = size(world,2);
    verticesList = [];
    for iPoly = 1:nbPoly
        verticesList = [verticesList, world(:,iPoly).vertices];
    end
    %plot lines to each visible point
    for iVisible = 1:nbVisible
        hold on
        points = [x verticesList(:,idxVisibleVertices(iVisible))];
        plot(points(1,:),points(2,:),'Color','g')
    end
    
end