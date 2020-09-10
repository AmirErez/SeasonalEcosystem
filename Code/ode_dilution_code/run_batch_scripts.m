clear;clc
%Test script for batch codes

%Specify variables
Bt = 1;
Ct = 1;
m = 3;
p = 2;
s = transpose(linspace(0,1,m));
s = [s , 1-s];
P = [0.3;0.7];
K = 1;
bo = 1/m;
chi = [0 0; 1 0];
variable_rc = 1e-1;
variable_K = [1;2];
variable_Y = [2;1];
plt = 1;

%Simulate
tic
[b,Nr,Bstore,Cstore,tstore] = multispeciesbatchMADAPT(bo,Bt,Ct,s,P,m,p,plt,K);
%[b,Nr,Bstore,Cstore,tstore] = multispeciesbatchMADAPT_troph(bo,Bt,Ct,s,P,m,p,plt,K,chi);
%[b,Nr,Bstore,Cstore,tstore] = multispeciesbatch_variable_end(bo,Bt,Ct,s,P,m,p,plt,K,variable_rc);
%[b,Nr,Bstore,Cstore,tstore] = multispeciesbatchMADAPT_variable_K_Y(bo,Bt,Ct,s,P,m,p,plt,variable_K,variable_Y);
toc

%Compute growth metrics
growth = s*transpose(Nr);
mult = exp(growth);
g = (Bt+Ct)/Bt;
