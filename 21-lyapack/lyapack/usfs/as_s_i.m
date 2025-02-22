function as_s_i(p)
%
%  Generates the data used in 'as_s'. Data are stored in global
%  variables.
%
%  NOTE that 'as_m_i' must be called before calling this routine.
% 
%  Calling sequence:
%
%    as_s_i(p)
%
%  Input:
%
%    p         vector containing the ADI shift parameters p(i).
%
%  Remarks:
% 
%    The matrix A, which has been provided as global data by 'as_m_i',
%    must be real, symmetric, negative definite. 
%
%    The entries of p must be real and negative.
%
%
%  LYAPACK 1.0 (Thilo Penzl, May 1999)

if nargin~=1
  error('Wrong number of input arguments.');
end

if any(imag(p))
  error('p must be real (Note that this is the symmetric case)!');
end

if any(p>=0)
  error('Entries of p must be negative!');
end

l = length(p);

global LP_A

if ~length(LP_A)
  error('This routine needs global data which must be generated by calling ''as_m_i'' first.');
end 

I = speye(size(LP_A));

for i = 1:l

  eval(lp_e( 'global LP_U',i ));

  eval(lp_e( 'LP_U',i,' = chol(-LP_A-p(',i,')*I);' ));      % Note the minus!

end

