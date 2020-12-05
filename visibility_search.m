%function [xPath]=visibility_search(graphVector,xStart,xGoal,world)
%This function performs the following steps: enumerate  Check if  @x   xEnd is
%visible from  @x   xStart. In this case, return  @x   xPath=[xStart xEnd] and
%exit.  visibility_isVisible to add two nodes to the graph  @x   graphVector
%corresponding to  @x   xStart and  @x   xGoal.  Important note: In addition to
%adding two elements to  @x   graphVector, the function will have to modify the 
%@x   neighbors and  @x   neighborsCost fields that are already in the  @x  
%graphVector array to keep the graph symmetric.  graph_search to find and return
%a path from  @x   xStart to  @x   xGoal. enumerate
function [xPath]=visibility_search(graphVector,xStart,xGoal,world)
    nVerticesTotal = numel(graphVector);
    allVerts = [world.vertices];
    allIdx = [world.indexes];
    
    idxStart = nVerticesTotal+1;
    idxGoal = nVerticesTotal+2;
    graphVector(idxStart).x = xStart;
    graphVector(idxStart).neighbors = visibility_isVisible(world,xStart);
    graphVector(idxGoal).x = xGoal;
    graphVector(idxGoal).neighbors = visibility_isVisible(world,xGoal);
    
    for iAddlPts = 1:numel(graphVector)-nVerticesTotal
        idx = nVerticesTotal+iAddlPts;
        nNeighbors = numel(graphVector(idx).neighbors);
        for iNeighbor = 1:nNeighbors
            % calculate neighborsCost for start/goal positions
            neighborIdx = graphVector(idx).neighbors(iNeighbor);
            neighborX = allVerts(:,allIdx==neighborIdx);
            graphVector(idx).neighborsCost(iNeighbor) = norm([graphVector(idx).x neighborX]);
            
            % add symmetrical entries to neighbors
            graphVector(neighborIdx).neighbors = [graphVector(neighborIdx).neighbors; idx];
            graphVector(neighborIdx).neighborsCost = [graphVector(neighborIdx).neighborsCost; graphVector(idx).neighborsCost(iNeighbor)];
        end
    end
    
    [xPath,~] = graph_search(graphVector,idxStart,idxGoal);
end