function HuffmanEncoder(symsArray, codes, input)
% This function encodes the characters in the input text using the input 
%code and saves the encoded text in a file in the same directory.

fileID = fopen('encodedText.txt', 'w');
for i = input 
    for j = 1:length(symsArray)
        if i == symsArray(j)
            fprintf(fileID, codes{j}); 
        end
    end 
end 
fclose(fileID);
end 