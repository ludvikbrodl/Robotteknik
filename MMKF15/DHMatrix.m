function [ A ] = DHMatrix( ai, alphai, di, thetai )
%DHMATRIX Summary of this function goes here
%   Detailed explanation goes here


A=([cos(thetai) -sin(thetai)*cos(alphai) sin(thetai)*sin(alphai) ai*cos(thetai);
             sin(thetai) cos(thetai)*cos(alphai) -cos(thetai)*sin(alphai) ai*sin(thetai);
             0 sin(alphai) cos(alphai) di;
             0 0 0 1]);
end

