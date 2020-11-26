%function [graphVector]=prm_addSample(graphVector,xSample,kNeighbors,world)
%enumerate  graph_nearestNeighbors that was provided in Homework 4 to find the 
%kNeighbors nearest neighbors in the graph. You can start with  kNeighbors=3, but
%you might want to test different values (see also Question  q:prm-graph-test). 
%a node at location  xSample to  graphVector.  over the neighbors using
%prm_localPlannerIsCollision to check if there is an edge between  x and each
%neighbor. If an edge is found, it is added to  graphVector (remember to modify
%the entries relative to both  x and the neighbor to keep the graph symmetric).
%You can start with  maxDistEdgeCheck=0.1, but you might want to test different
%values (see also Question  q:prm-graph-test). enumerate
function [graphVector]=prm_addSample(graphVector,xSample,kNeighbors,world)
