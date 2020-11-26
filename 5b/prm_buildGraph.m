%function [graphVector]=prm_buildGraph(world,NSamples)
%This function performs the following steps: enumerate  the Matlab function rand
%to sample a random location  xSample in the rectangle  [-2.5,2.5]$ $[-2.5,2.5]. 
%sphereworld_isCollision on  xSample. If  x is not a collision, use prm_addSample
%to add that sample.  until  graphVector contains  NSamples, or has sampled a
%maximum of  1000 locations. enumerate
function [graphVector]=prm_buildGraph(world,NSamples)
