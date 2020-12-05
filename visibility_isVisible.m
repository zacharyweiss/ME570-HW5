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
    idxVisibleVertices = [];
    
    for iPoly = 1:numel(world)
        nVert = numel(world(iPoly).indexes);
        
        %edge cases
        selfOccl = zeros(1,nVert);
        isColl = selfOccl;
        selfOccl(nVert) = polygon_isSelfOccluded(world(iPoly).vertices(:,nVert),world(iPoly).vertices(:,nVert-1),world(iPoly).vertices(:,1),x);
        selfOccl(1) = polygon_isSelfOccluded(world(iPoly).vertices(:,1),world(iPoly).vertices(:,nVert),world(iPoly).vertices(:,2),x);
        
        %remaining self-occlude verts
        for iVert = 2:nVert-1
            selfOccl(iVert) = polygon_isSelfOccluded(world(iPoly).vertices(:,iVert),world(iPoly).vertices(:,iVert-1),world(iPoly).vertices(:,iVert+1),x);
        end
        
        for iVert = 1:nVert
            for iPolyCollision = 1:numel(world)
                isColl(iVert) = any([isColl(iVert) polygon_isCollisionEdge([x world(iPoly).vertices(:,iVert)],world(iPolyCollision).vertices)]);
            end
        end
        
        idxVisibleVertices = [idxVisibleVertices; world(iPoly).indexes(not(selfOccl | isColl))'];
    end
    
end