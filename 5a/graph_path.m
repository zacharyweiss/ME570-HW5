%function [xPath]=graph_path(graphVector,idxStart,idxGoal)
%This function follows the backpointers from the node with index  @x   idxGoal in
% @x   graphVector to the one with index  @x   idxStart node, and returns the 
%coordinates (not indexes) of the sequence of traversed elements.
function [xPath]=graph_path(graphVector,idxStart,idxGoal)
    idx = idxGoal;
    xPath = graphVector(idxGoal).x;
    while idx ~= idxStart
        idx = graphVector(idx).backpointer;
        xPath = [graphVector(idx).x xPath];
    end
end