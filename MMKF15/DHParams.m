%% Example Title
% Summary of example objective

%ai: the constant link length,
%?i: the constant link twist,
%di: the link offset 
%?i: the link angle 
% Link_i = [ai alphai di thetai]

% Link_1 = [0 pi/2 0 theta1]
% Link_2 = [0 pi/2 0 theta2]
% Link_3 = [L1 0 L1 theta3]
% Link_4 = [L2 0 L2 theta4]
% Link_5 = [0 -pi/2 0 theta5]
% Link_6 = [0 -pi/2 0 theta6]
% Link_7 = [EndAffector 0 0 theta7]


%3) Depending on the alignment of the axis there can either be infinite
%amount of solutions or 1.
%When 2 joints are aligned there are an infinite amount of solutions. I.e
%when the first motor is aligned with the 7th motor there can be a rotation
%of +3 of the first motor and -3 on the 7th motor but the tool will have
%the same rotation.

%There is also the case when the robot can have the "elbow" up or down, but
%the toolattatchment keep it's position and orientation. I believe this is
%the same case as above, the 1st and 7th motors z axis is aligned.

%% Section 1 Title
% Description of first code block
clear all;
L1 = 0.275;  % The first "bone".
L2 = 0.25;
Link1 = Link('d',0, 'a',0, 'alpha', pi/2);
Link2 = Link('d',0, 'a',0, 'alpha', pi/2);
Link3 = Link('d',0, 'a',L1, 'alpha', 0);
Link4 = Link('d',0, 'a',L2, 'alpha', 0);
Link5 = Link('d',0, 'a',0, 'alpha', -pi/2);
Link6 = Link('d',0, 'a',0, 'alpha', -pi/2);
Link7 = Link('d',0, 'a',0,  'alpha',0);

armrobotL = SerialLink([Link1 Link2 Link3 Link4 Link5 Link6 Link7], 'name', 'Arm L');
%armrobotR = SerialLink([Link1 Link2 Link3 Link4 Link5 Link6 Link7], 'name', 'Arm R');

%armrobot.plot([0.1 0.2 0.3 0.4 0.5 0.6 0.7]);
t = [0:0.05:4];
armLqz = [0,0,0,0,0,0,0];
armLqr = [3,1,3,1,3,1,0];
armRqz = [];% [0,0,0,0,0,0,0];
armRqr = [];%[0,0,0,3,0,0,0];
robotqz = [armLqz ];
robotqr = [armLqr ];
q = jtraj(robotqz, robotqr, t);
robot = armrobotL;%*armrobotR;
robot.plot(q);
% armrobot.teach(); % Jogging the robot manually

%% Section 2 Title
% Description of second code block
a=2;

