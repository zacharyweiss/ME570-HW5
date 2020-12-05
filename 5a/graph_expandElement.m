%function [graphVector,pqOpen]=graph_expandElement(graphVector,idxNBest,idxX,idxGoal,pqOpen)
%This function expands the vertex with index  @x   idxX (which is a neighbor of
%the one with index  @x   idxNBest) and returns the updated versions of  @x  
%graphVector and  @x   pqOpen.
function [graphVector,pqOpen]=graph_expandElement(graphVector,idxNBest,idxX,idxGoal,pqOpen)
    cNBestX = graphVector(idxNBest).neighborsCost(graphVector(idxNBest).neighbors==idxX);
    
    if ~priority_isMember(pqOpen, idxX)
        graphVector(idxX).g = graphVector(idxNBest).g + cNBestX;
        graphVector(idxX).backpointer = idxNBest;
        pqOpen = priority_insert(pqOpen,idxX,graphVector(idxX).g+graph_heuristic(graphVector,idxX,idxGoal));
    elseif graphVector(idxNBest).g + cNBestX < graphVector(idxX).g
        graphVector(idxX).g = graphVector(idxNBest).g + cNBestX;
        graphVector(idxX).backpointer = idxNBest;
    end
end

%This function corresponds to lines  it:expansion-start-- it:expansion-end in
%Algorithm  alg:astar.
