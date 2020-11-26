%function [xPath]=prm_search(graphVector,world,xStart,xEnd)
%This function performs the following two steps: enumerate  prm_addSample to add
%two nodes to the graph  graphVector corresponding to  xStart and  xEnd (note
%that here you don't necessarily have to use the same value of  kNeighbors). 
%graph_planner from Homework 4 to find and return a path from  xStart to  xEnd.
%enumerate
function [xPath]=prm_search(graphVector,world,xStart,xEnd)
