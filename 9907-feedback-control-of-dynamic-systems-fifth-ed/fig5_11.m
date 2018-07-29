% Fig. 5.11   Feedback Control of Dynamic Systems, 5e 
%             Franklin, Powell, Emami
np=[1 1];
dp=[1 12 0 0];
rlocus(np,dp)
axis([-6 2 -3 3])
grid on
Title('Root locus for Figure 5.11')
z=0:.1:.9;
 wn= .5:.5:6;
 sgrid(z, wn)
 hold off
