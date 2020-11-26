%function [idxVisibleVertices]=visibility_isVisible(world,x)
%Returns the indexes of vertices in  @x   world that are visible from the point 
%@x   x. In practice, your function should iterate over polygon, and perform the
%following for each vertex in the current polygon: itemize  for self-occlusions
%using polygon_isSelfOcclusion with respect to the current polygon.  for
%edge-intersections using polygon_isCollisionEdge and iterating over all the
%edges defined by  @x   world.  both checks do not reveal occlusions, the index
%corresponding to the vertex should be added to  @x   idxVisibleVertices (using
%the information from  @x   world().indexes). itemize
function [idxVisibleVertices]=visibility_isVisible(world,x)
