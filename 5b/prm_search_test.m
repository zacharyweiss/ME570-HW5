%function prm_search_test()
%enumerate  the variables  @x   world,  @x   xStart and  @x   xEnd from the file 
%@x   sphereWorld.mat.  prm_buildGraph to build a probabilistic roadmap
%representation of the environment.  each starting location (column) in  @x  
%xStart, and each goal location (column) in  @x   xGoal, calls prm_search to find
%a path.  sphereworld_draw and then overimposes all the trajectories from the
%start locations to the goal location. enumerate
function prm_search_test()
