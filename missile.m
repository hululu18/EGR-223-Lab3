function [A_H, B_H, C_H, Destroyed_1_flag, Destroyed_2_flag, Destroyed_3_flag ] = missile(P_A, P_B, P_C, P_D_H1, P_D_H2, P_D_H3)
%This is missile function
%meaning behind the names of function arguments
%P_A means probability of A
%P_D_H1 means probability of destroying target knowing it was hit by 1
%missile
Destroyed_1_flag = 0;%True if target is destroyed by one hit
Destroyed_2_flag = 0;%True if target is destroyed by two hit
Destroyed_3_flag = 0;%True if target is destroyed by three hit

if (rand <= P_A)
    A_H = 1;
else 
    A_H = 0;
end

if (rand <= P_B)
    B_H = 1;
else 
    B_H = 0;
end

if (rand <= P_C)
    C_H = 1;
else 
    C_H = 0;
end

%Code for checking one missile hit
%First if statementtrue if only one(A|B|C) missile hit
%Second if statement is true when rand is <= 0.25  
if((A_H==1 && B_H==0 && C_H==0) || (A_H==0 && B_H==1 && C_H==0) || (A_H==0 && B_H==0 && C_H==1)) 
if(rand <= P_D_H1)
    Destroyed_1_flag = 1;
end
end

%Code for checking two missile hit
if((A_H==1 && B_H==1 && C_H==0) || (A_H==0 && B_H==1 && C_H==1) || (A_H==1 && B_H==0 && C_H==1))
if(rand <= P_D_H2)
    Destroyed_2_flag = 1;
end 
end

%Code for checking all three missile hit
if (A_H && B_H && C_H)
    if (rand <= P_D_H3)
        Destroyed_3_flag = 1;
    end
end
end