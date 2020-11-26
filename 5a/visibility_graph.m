%function [graphVector]=visibility_graph(world)
%Uses visibility_isVisible to build a  @x   graphVector structure representing
%the visibility of each vertex in  @x   world with respect to all the others.
function [graphVector]=visibility_graph(world)
