// Replication of: Corsetti, G, and Muller, G., (2006),
// "Twin Deficits: Squaring Theory, Evidence and Common Sense",
// European Policy, pp. 597-638 (Web Appendix)
// Incomplete Markets
// Log-linearized equations

var y1 y2 a1 a2 b1 b2 g1 g2 z1 z2 k1 k2 n1 n2 f1 f2 c1 c2 x1 x2 q1a q1b q2a q2b bet1 bet2 lambda1 lambda2 t1 t2 w1 w2 r1 r2 Q B1 B2 T1 T2 rx p nx x;

varexo ez1 ez2 eg1 eg2 et1 et2;

parameters beta_bar theta sigma omega mu gam delta rho_z rho_g rho_t gss_yss xss_yss css_yss Tss_yss tss nss wss rss yss kss_yss;

beta_bar=0.99;
theta=0.36;
sigma=0.3;     // Set to 1 for Figure 1 replication (appendix sensitivity: sigma in {0.3,1,3})
omega=0.875;
mu=0.34;
gam=2;
delta=0.025;
rho_g=0.9;
rho_z=0.9;
rho_t=0.9;

// Steady-state values
gss_yss=0.2;
tss=0;
yss=1;
kss_yss=(theta*beta_bar*(1-tss))/(1-beta_bar*(1-delta));
xss_yss=delta*kss_yss;
css_yss=1-gss_yss-delta*kss_yss;
nss=(mu*(1-tss)*(1-theta)*(1/css_yss))/(1+mu*((1-tss)*(1-theta)*(1/css_yss)-1));
wss=(1-theta)*yss/nss;
rss= theta/kss_yss;
Tss_yss=tss-gss_yss;

// Shocks
sig=1;

model(linear);
// (A1)-(A2) Market Clearing Intermediate Goods
y1=omega*(1-gss_yss)*a1+(1-omega)*(1-gss_yss)*a2+gss_yss*g1;
y2=omega*(1-gss_yss)*b2+(1-omega)*(1-gss_yss)*b1+gss_yss*g2;

// (A3)-(A4) Market Clearing Final Goods
(1-gss_yss)*f1=css_yss*c1+xss_yss*x1;
(1-gss_yss)*f2=css_yss*c2+xss_yss*x2;

// (A5)-(A6) Production Function of Intermediate Goods
y1=z1+theta*k1+(1-theta)*n1;
y2=z2+theta*k2+(1-theta)*n2;

// (A7)-(A8) Production Function Final Goods (Country 1)
f1=omega*a1+(1-omega)*b1;
f2=omega*b2+(1-omega)*a2;

// (A9)-(A12) Demand for Domestic Intermediate Goods
a1=(-sigma)*q1a+f1;
b1=(-sigma)*q1b+f1;
b2=(-sigma)*q2b+f2;
a2=(-sigma)*q2a+f2;

// (A13)-(A14) Discount Factor
bet1=(-mu)*(1-beta_bar)*c1+(((1-mu)*nss)/(1-nss))*(1-beta_bar)*n1;
bet2=(-mu)*(1-beta_bar)*c2+(((1-mu)*nss)/(1-nss))*(1-beta_bar)*n2;

// (A15)-(A16) FOC Consumption
lambda1=(mu*(1-gam)-1)*c1-(nss/(1-nss))*(1-mu)*(1-gam)*n1;
lambda2=(mu*(1-gam)-1)*c2-(nss/(1-nss))*(1-mu)*(1-gam)*n2;

// (A17)-(A18) FOC Labor
lambda1+q1a-(tss/(1-tss))*t1+w1=mu*(1-gam)*c1+((nss/(1-nss))*(gam*(1-mu)+mu))*n1;
lambda2+q2b-(tss/(1-tss))*t2+w2=mu*(1-gam)*c2+((nss/(1-nss))*(gam*(1-mu)+mu))*n2;

// (A19)-(A20) FOC Capital
lambda1-bet1=(1-beta_bar*(1-delta))*(q1a(+1)-(tss/(1-tss))*t1(+1)+r1(+1))+lambda1(+1);
lambda2-bet2=(1-beta_bar*(1-delta))*(q2b(+1)-(tss/(1-tss))*t2(+1)+r2(+1))+lambda2(+1);

// (A21)-(A24) FOC i-firm
r1=y1-k1;
r2=y2-k2;
w1=y1-n1;
w2=y2-n2;

// (A25)-(A26) Law of Motion of Capital
k1=(1-delta)*k1(-1)+delta*x1;
k2=(1-delta)*k2(-1)+delta*x2;

// (A27)-(A28) FOC for Bonds
lambda1(+1)-lambda1=q1a+Q-q1a(+1)-bet1;
lambda2(+1)-lambda2=q2b+Q-q2a(+1)-bet2;

// (A29) Budget Constraint -- Country 1 only
// A-30 (country 2) is dropped: redundant by Walras' law (Web Appendix, footnote 5)
(1-tss)*q1a+(1-tss)*wss*(nss/yss)*(w1+n1)+(1-tss)*rss*kss_yss*(r1+k1)-tss*t1+B1(-1)+Tss_yss*T1=css_yss*c1+xss_yss*x1+beta_bar*B1;

// (A31) Bond Market Clearing
B1=B2;

// (A32)-(A33) Arbitrage Condition
rx=q1b-q2b;
rx=q1a-q2a;

// (A34)-(A35) Government
gss_yss*g1=tss*t1+tss*y1-Tss_yss*T1;
gss_yss*g2=tss*t2+tss*y2-Tss_yss*T2;

// (A36) Terms of Trade
p=q1b-q1a;

// (A37) Trade Balance  (eq. A-37: coefficient is (1-omega)*(1-g_y), not divided)
nx=(1-omega)*(1-gss_yss)*(a2-b1-p);

// (A38) Relative Investment
x=x1-x2;

// (A39)-(A44) Exogenous Shock Processes
z1=rho_z*z1(-1)+ez1;
z2=rho_z*z2(-1)+ez2;
g1=rho_g*g1(-1)+eg1;
g2=rho_g*g2(-1)+eg2;
t1=rho_t*t1(-1)+et1;
t2=rho_t*t2(-1)+et2;
end;

steady;
check;

// Only activate government spending shock in country 1 (replicates Figure 4 of Web Appendix)
shocks;
var ez1; stderr 0;
var ez2; stderr 0;
var eg1; stderr sig;
var eg2; stderr 0;
var et1; stderr 0;
var et2; stderr 0;
end;

// irf=40 matches the 40-quarter horizon in the paper's figures
// Variables: g1=gov spending, k1=capital, p=terms of trade, x=rel. investment, q1a=price good a, nx=net exports
stoch_simul(order=1, irf=40, graph_format=pdf) g1 k1 p x q1a nx;