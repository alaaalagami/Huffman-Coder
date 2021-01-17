function entropy = GetEntropy(probs)
% This function calculates the entropy using the provided probabilities.

entropy = 0;
for p = probs
    if p ~= 0
      entropy = entropy - p * log2(p);
    end
end
end