function [s] = compute_score(S, neighbors, un, uj, lambda, prev)

s = prev;

for i=1:length(neighbors)
	if sum(S == neighbors(i)) == 1
		% its there in the set S
		s = s - (un(i)*uj);
	end
end

s = s + (2*lambda*uj^2);
