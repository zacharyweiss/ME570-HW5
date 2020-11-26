%function [flag]=prm_localPlannerIsCollision(world,x1,x2,maxDistEdgeCheck)
%Generates @boxIvory2 NPoints equispaced points on the line between @boxIvory2 x1
%and @boxIvory2 x2, such that the maximum distance between two consecutive
%samples is less than @boxIvory2 maxDistEdgeCheck. Note that the value of
%@boxIvory2 NPoints is determined by the distance between the two points and
%@boxIvory2 maxDistEdgeCheck.
function [flag]=prm_localPlannerIsCollision(world,x1,x2,maxDistEdgeCheck)

%This function returns an ``all-or-nothing'' result, meaning that the edge
%between @boxIvory2 x1 and @boxIvory2 x2 even if only one of the samples is in
%collision.
