function r = ge(p,q)
% MEAS/GE  Implement p >= q for meas.

% find the difference between the two
diff = meas();
diff = p - q;

% see if p >= q at the 1-sigma level
if (diff.value > diff.error) | (abs(diff.value) < diff.error)
    r = 1;
else
    r = 0;
end