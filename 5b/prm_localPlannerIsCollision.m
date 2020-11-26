%function [flag]=prm_localPlannerIsCollision(world,x1,x2,maxDistEdgeCheck)
%Generates  NPoints equispaced points on the line between  x1 and  x2, such that
%the maximum distance between two consecutive samples is less than 
%maxDistEdgeCheck.
function [flag]=prm_localPlannerIsCollision(world,x1,x2,maxDistEdgeCheck)
