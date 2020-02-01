%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title: Lab 03 part 1
% Filename: lab03.m
% Author: Dixit Gurung
% Date: 1/30/2020
% Instructor: Prof. N Baine
% Description: This program uses the missile function to simulate one of the
% instance of the missile problem. In addition, it also calculate
% theoritical value and percentage difference between them.
%NOTE: I choose question 1.b for the simulation part which was finding the
%probability that the target is destroyed by a single misssile knowing that
%it is destroyed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all %Remove items from workspace, freeing up system memory
rng('shuffle') %seeds the random number generator based on the current time.
L = 200000; %no of time the experiment is repeated/ used in for loop below
Destroyed_1 = 0; %Stores the number of time the target was destroyed when hit by single missile
Destroyed = 0;   %Stores the number of time the target was destroyed when hit by 1 or 2 or 3 missiles

%Known values form the question
P_A = 0.52;    %probability of missile A hitting the target
P_B = 0.48;    %probability of missile B hitting the target
P_C = 0.375;   %probability of missile C hitting the target
P_D_H1 = 0.25; %probability of destroying the target when hit by 1 missile
P_D_H2 = 0.49; %probability of destroying the target when hit by 2 missile
P_D_H3 = 0.88; %probability of destroying the target when hit by 3 missile

%This for loop runs for L times and counts the number of times the target
%was destroyed by one missile and total no of time the target was destoryed
%using conditional statements
for i =1: L
    
[A_H, B_H, C_H, Destroyed_1_flag,Destroyed_2_flag, Destroyed_3_flag ] = missile(P_A, P_B, P_C, P_D_H1, P_D_H2, P_D_H3);
    if(Destroyed_1_flag)
        Destroyed_1 = Destroyed_1+1;
    end
    
    if(Destroyed_1_flag|| Destroyed_2_flag|| Destroyed_3_flag )
        Destroyed = Destroyed +1;
    end
end

%Probability that the target is destroyed by a single misssile knowing that
%it is destroyed can be calculated by dividing the total no of times the
%target was destroyed by one missile by total no of times the target was destroyed. 
P_H1_D_emp = Destroyed_1/Destroyed;



%Calculating theroitical value for question 
P_H1_D_theory = 0; %term we need to find, Probability that the target is
                   %destroyed by a single misssile knowing that it is hit.
               % P_D_H1 is given by the question
P_H1 = 0.4066; %Probability of hitting target by SINGLE missile
               %Calculated from theory as part of prelab
P_D = 0.35248; %Probability of DESTROYING the target
               %Calculated from theory as part of prelab

%Using baye's rule               
P_H1_D_theory = (P_D_H1 * P_H1)/P_D;

%Calculating percentage difference between Emperical and theoritical value
percentage_diff = 0; %Stores the percenage difference

percentage_diff = ((P_H1_D_theory - P_H1_D_emp)*100)/P_H1_D_theory;
percentage_diff = abs(percentage_diff);


%Printing the the percentage difference, Emperical and theoritical values
fprintf(' Simulation of 1.b from the missile problem\n');
fprintf('The probability that the target is destroyed by a single misssile knowing that it is destroyed.\n');
fprintf('\nEmpirical value: %.4f\n',P_H1_D_emp);
fprintf('Theoritical value: %.4f\n',P_H1_D_theory );
fprintf('Percentage difference: %0.2f%%\n',percentage_diff);


%PART 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L = 20000;
P_A = 0.33;
P_B = 0.42;
P_C = 0.25;
P_D_A = 0.01;
P_D_B = 0.005;
P_D_C = 0.03;

%Problem 2.a
%Checking probability of relay being defective
Damage = 0;
P_D_emp = 0;
P_D_theory = 0;

for i = 1:L
    [A_flag, B_flag, C_flag, Defect_A, Defect_B, Defect_C, Defect] = relay(P_A, P_B, P_C, P_D_A, P_D_B, P_D_C);
    
    if(Defect == 1)
        Damage = Damage +1;
    end
end
   
P_D_emp = Damage/L;
P_D_theory = (P_D_A*P_A)+(P_D_B*P_B)+(P_D_C*P_C);

%calculating %diff
percentage_diff = ((P_D_theory - P_D_emp)*100)/P_D_theory;
percentage_diff = abs(percentage_diff);

%Printing the the percentage difference, Emperical and theoritical values
fprintf('\n\nPART2\n');
fprintf('Simulation of Problem 2.a\n');
fprintf('\nEmpirical value: %.4f\n',P_D_emp);
fprintf('Theoritical value: %.4f\n',P_D_theory );
fprintf('Percentage difference: %0.2f%%\n',percentage_diff);

%--------------------------------------------------------------------------
%Problem 2.b
%Checking probability of relay was manufactured in 3rd plant(C) knowing it
%was defective
%In notation P_C_D

P_D = 0.0129; %Calculated from theory as part of prelab
Damage = 0;
Damage_C = 0;

for i = 1:L
    [A_flag, B_flag, C_flag,Defect_A, Defect_B,Defect_C, Defect] = relay(P_A, P_B, P_C, P_D_A, P_D_B, P_D_C);
    
    if(Defect == 1)
        Damage = Damage +1;
    end
    
    if(Defect_C == 1)
        Damage_C = Damage_C +1;
    end
    
end

P_C_D_emp = Damage_C/Damage;
P_C_D_theory = (P_D_C*P_C)/P_D;

%calculating %diff
percentage_diff = ((P_C_D_theory - P_C_D_emp)*100)/P_C_D_theory;
percentage_diff = abs(percentage_diff);

%Printing the the percentage difference, Emperical and theoritical values
fprintf('\nSimulation of Problem 2.b\n');
fprintf('\nEmpirical value: %.4f\n',P_C_D_emp);
fprintf('Theoritical value: %.4f\n',P_C_D_theory );
fprintf('Percentage difference: %0.2f%%\n',percentage_diff);