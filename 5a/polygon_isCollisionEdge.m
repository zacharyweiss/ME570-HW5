%function [flagIsCollision]=polygon_isCollisionEdge(edge,vertices)
%Uses the function [flagIsCollision]edge_isCollision from Homework 1 to check
%whether an edge is in collision with a polygon.
function [flagIsCollision]=polygon_isCollisionEdge(edge,vertices)
   nPairs = size(vertices,2)-1;
   
   flagIsCollision = edge_isCollision(edge,[vertices(:,nPairs+1) vertices(:,1)]);

   for iEdge = 1:nPairs
        flagIsCollision = any([edge_isCollision(edge,vertices(:,iEdge:iEdge+1)) flagIsCollision]);
   end
end