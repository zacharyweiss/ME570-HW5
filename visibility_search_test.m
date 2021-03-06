%function visibility_search_test()
%enumerate  the variables  @x   world,  @x   xStart and  @x   xGoal from the file
% @x   polygonalWorld.mat.  visibility_graph to build a visibility graph
%representation of the environment.  each starting location (column) in  @x  
%xStart, calls visibility_search to find a path to  @x   xGoal. 
%polygonworld_draw and then overimposes all the trajectories from the start
%locations to the goal location. enumerate
function visibility_search_test()
    load('polygonWorld.mat','world','xStart','xGoal')
    
    graphVector = visibility_graph(world);
    for iStart = 1:size(xStart,2)
        xPath = visibility_search(graphVector,xStart(:,iStart),xGoal,world);
        
        figure(iStart)
        hold on
        axis equal
        polygonworld_draw(world,xGoal)
        plot(xPath(1,:),xPath(2,:),'Color','g')
    end
end