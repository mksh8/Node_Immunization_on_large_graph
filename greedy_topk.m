% MUKESH KUMAR
% computes the best k according to the greedy algorithm
% returns best k and the score
% requires graph adj, k
% graph is undirected
function [S, prev] = greedy_topk(graph, k)

[u, lambda] = eigs(graph, 1);
if lambda < 0
		lambda = lambda * -1;
end
% make sure u is all positive
if u(3) < 0
	u = u * -1;
end

lambda
u(2)

S = [];
N = length(graph);
flag = zeros(1, N);
prev = 0;
for i=1:k
	score = ones(1, N) * -99999;
	for j=1:N
		if mod(j, 100000) == 0
			[i j]
		end
		if flag(j) == 0
			% new node
			 neighbors = find(graph(:, j) == 1);
			 score(j) = compute_score(S, neighbors, u(neighbors), u(j), lambda, prev);
		end
	end
	[a ii] = max(score);
	S(i) = ii;
	flag(ii) = 1;
	prev = a;
end
