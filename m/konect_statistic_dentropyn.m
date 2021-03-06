%
% Compute the normalized edge distribution entropy [dentropyn].
%
% RESULT 
%	values	Column vector of results.  The first value is the global
%		entropy.  The next next ones are the left/right
%		entropies (only BIP and ASYM). 
%
% PARAMETERS 
%	A	Adjacency/biadjacency matrix
%	format
%	weights
%

function values = konect_statistic_dentropyn(A, format, weights)

consts = konect_consts(); 

A = A ~= 0; 

d1 = sum(A,2);
d2 = sum(A,1)'; 

if format == consts.BIP
    values = [ konect_dentropy([d1 ; d2], 'n'); konect_dentropy(d1, 'n'); konect_dentropy(d2, 'n')]; 
elseif format == consts.SYM
    values = konect_dentropy(d1 + d2, 'n'); 
elseif format == consts.ASYM
    values = [ konect_dentropy(d1 + d2, 'n'); konect_dentropy(d1, 'n'); konect_dentropy(d2, 'n')]; 
end

