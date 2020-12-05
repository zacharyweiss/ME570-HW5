%function [flagIsCollision]=polygon_isCollisionEdge(edge,vertices)
%Uses the function [flagIsCollision]edge_isCollision from Homework 1 to check
%whether an edge is in collision with a polygon.
function [flagIsCollision]=polygon_isCollisionEdge(edge,vertices)
   nPairs = size(vertices,2)-1;
   flagIsCollision = zeros(1,nPairs);

   for iEdge = 1:nPairs
        flagIsCollision(iEdge) = edge_isCollision(edge,vertices(:,iEdge:iEdge+1));
   end
end