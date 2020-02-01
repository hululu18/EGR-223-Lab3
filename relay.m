function [A_flag, B_flag, C_flag, Defect_A, Defect_B, Defect_C, Defect] = relay(P_A, P_B, P_C, P_D_A, P_D_B, P_D_C)
%relay function 

Defect_A = 0;
Defect_B = 0;
Defect_C = 0;


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