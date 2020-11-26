%function [graphVector,xSample]=sampleTree_extend(graphVector,radius,world)
%The function performs the following steps: enumerate  graph_degree to obtain the
%array of degrees @boxIvory2 deg of the nodes in the tree.  an array @boxIvory2
%fDistr such that @boxIvory2 fDistr(i) is proportional to @boxIvory2
%1/(deg(i)+1). it:sampleNode Use rand_discrete to sample a node with index
%@boxIvory2 idxSample according to @boxIvory2 fDistr. it:sampleState Use
%sphereworld_sample with the optional arguments to generate a sample location
%@boxIvory2 xSample around the location of @boxIvory2 idxSample according to a
%Gaussian distribution with variance @boxIvory2 radius.  graph_nearestNeighbors
%(with @boxIvory2 kNeighbors=1) to find the index @boxIvory2 idxNear of the
%single closest neighbor of @boxIvory2 xSample.  prm_localPlannerIsCollision to
%check whether @boxIvory2 xSample can be connected to the closest neighbor. If
%there is no collision, add @boxIvory2 xSample to @boxIvory2 graphVector, setting
%its backpointer to @boxIvory2 idxNear, and updating the @boxIvory2 neighbor and
%@boxIvory2 neighborCost fields of @boxIvory2 graphVector[idxNear].  the steps
%above from  it:sampleNode until a sample is successfully added, or up to 100
%times. enumerate
function [graphVector,xSample]=sampleTree_extend(graphVector,radius,world)
