%function [xPath,graphVector]=graph_search(graphVector,idxStart,idxGoal)
%Implements the  @x   A* algorithm, as described by the pseudo-code in Algorithm 
%alg:astar.
function [xPath,graphVector]=graph_search(graphVector,idxStart,idxGoal)
    % initialization of queue and backpointer
    pqO = priority_prepare();
    pqO = priority_insert(pqO,idxStart,0+graph_heuristic(graphVector,idxStart,idxGoal));
    idxClosed = [];
    graphVector(idxStart).backpointer = [];
    graphVector(idxStart).g = 0;
    
    % loop until queue is empty, max iterations hit,
    % or the best neighbor is the goal
    iter = 1;
    iMax = 10000;
    while ~isempty(pqO)
        % pick nbest, remove from O
        [pqO,idxNBest,~] = priority_minExtract(pqO);
        
        % add nbest to C
        idxClosed = [idxClosed idxNBest];
        
        %if best is goal, exit
        if idxNBest==idxGoal
            break
        end
        
        % find all non-closed neighbors of nbest (expand)
        % iterate through list of neigbors and update backpointers / 
        starNBest = graph_getExpandList(graphVector,idxNBest,idxClosed);
        for iStarNBest=1:numel(starNBest) 
            [graphVector,pqO] = graph_expandElement(graphVector,idxNBest,starNBest(iStarNBest),idxGoal,pqO);
        end
        
        % exit if exceeds iteration maximum
        if iter>=iMax
            break
        end
        iter = iter + 1;
    end
    
    % reconstruct path from backpointers
    xPath = graph_path(graphVector,idxStart,idxGoal);
end
% Set a maximum limit of iterations in the main  @x   A* loop on line 
%it:astar-main-loop of Algorithm  alg:astar. This will prevent the algorithm from
%remaining stuck on malformed graphs (e.g., graphs containing a node as a
%neighbor of itself), or if you make some mistake during development.
