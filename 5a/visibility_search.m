%function [xPath]=visibility_search(graphVector,xStart,xGoal,world)
%This function performs the following steps: enumerate  Check if  @x   xEnd is
%visible from  @x   xStart. In this case, return  @x   xPath=[xStart xEnd] and
%exit.  visibility_isVisible to add two nodes to the graph  @x   graphVector
%corresponding to  @x   xStart and  @x   xGoal.  Important note: In addition to
%adding two elements to  @x   graphVector, the function will have to modify the 
%@x   neighbors and  @x   neighborsCost fields that are already in the  @x  
%graphVector array to keep the graph symmetric.  graph_search to find and return
%a path from  @x   xStart to  @x   xGoal. enumerate
function [xPath]=visibility_search(graphVector,xStart,xGoal,world)
