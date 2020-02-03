function [A_flag, B_flag, C_flag, Defect_A, Defect_B, Defect_C, Defect] = relay(P_A, P_B, P_C, P_D_A, P_D_B, P_D_C)
%relay function simulate one instance of simulating the manufacture of the relays. 
%The relay.m had 6 input parameters the probability of company A, B or C manufacturing
%relay and probability of a relay manufactured by these companies being defective and 
%returns 7 parameters: a series of flag (0 or 1) to indicate if the relay was manufactured
%in plant A, B or C and a flag to indicate the defective relay was manufactured in plant A, B or C.

Defect_A = 0; %True if the defective relay was made by plant A
Defect_B = 0; %True if the defective relay was made by plant B
Defect_C = 0; %True if the defective relay was made by plant C

%This section of code uses conditional statements to compare the random
%value generated to the input parameters (Probabilities)
m=rand;
if(m <= P_A)
    A_flag = 1;
else
    A_flag = 0;
end

if((m > P_A)&&(m <= (P_A+P_B)))
    B_flag = 1;
else
    B_flag = 0;
end

if(m > (P_A+P_B))
    C_flag = 1;
else
    C_flag = 0;
end

%This section of code checks all the flags then if true assign 1 to other flag 
n = rand;
if (A_flag)
    if(n<= P_D_A)
        Defect_A=1;
        Defect = 1;
    else
        Defect_A=0;
        Defect = 0;
    end
end

if (B_flag)
    if(n<= P_D_B)
        Defect_B=1;
        Defect = 1;
    else
        Defect_B=0;
        Defect = 0;
    end
end


if (C_flag)
    if(n<= P_D_C)
        Defect_C=1;
        Defect = 1;
    else
        Defect_C=0;
        Defect = 0;
    end
end

end
%End of the function