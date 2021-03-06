%function [graphVector]=visibility_graph(world)
%Uses visibility_isVisible to build a  @x   graphVector structure representing
%the visibility of each vertex in  @x   world with respect to all the others.
function [graphVector]=visibility_graph(world)
    allVerts = [world.vertices];
    allIdx = [world.indexes];
    
    nNodes = numel(allIdx);
    graphVector = repmat(struct('neighbors',[],'neighborsCost',[],'x',[]),nNodes,1);
    
    for iPoly = 1:numel(world)
        for iVert = 1:numel(world(iPoly).indexes)
            idx = world(iPoly).indexes(iVert);
            graphVector(idx).x = world(iPoly).vertices(:,iVert);
            graphVector(idx).neighbors = visibility_isVisible(world,graphVector(idx).x);
            
            nNeighbors = numel(graphVector(idx).neighbors);
            graphVector(idx).neighborsCost = zeros(nNeighbors,1);
            for iNeighbor = 1:nNeighbors
                neighborIdx = graphVector(idx).neighbors(iNeighbor);
                neighborX = allVerts(:,allIdx==neighborIdx);
                graphVector(idx).neighborsCost(iNeighbor) = norm(graphVector(idx).x-neighborX);
            end
        end
    end
end