clear; clc;

%Read the text file
fileID = fopen('Test_text_file.txt','r');
input = fscanf(fileID, '%c');

%Calculate probability of each character
%Order: a-z ().,/-
characters = ['a':'z', ' ', '(', ')', '.', ',', '/', '-'];
probs = GetProbabilities(input, characters);

%Calculate the entropy
entropy = GetEntropy(probs);
fprintf("Entropy = %f\n\n", entropy);

%Calculate number of bits/symbol for fixed length coding
numBits_fixedLength = ceil(log2(length(characters)));

%Calculate efficiency of fixed length coding
efficiency_fixedLength = entropy / numBits_fixedLength;

fprintf("For fixed length coding:\n");
fprintf("-Number of bits/symbols = %f\n-Efficiency = %f\n\n", numBits_fixedLength, efficiency_fixedLength);

%% Huffman Encoding

%Create Huffman code for each character
fprintf("Initiating Huffman encoding...\n\n");
codes = HuffmanCreator(characters, probs); 

%Encode test file
HuffmanEncoder(characters, codes, input);

%% Huffman Decoding

%Decode test file
fileID_Encoded = fopen('encodedText.txt','r');
inputEncoded = fscanf(fileID_Encoded, '%c');
fclose(fileID_Encoded);
fprintf("\nInitiating Huffman decoding...\n\n");
decoded = HuffmanDecoder(characters, codes, inputEncoded);

%Check if the input and the decoded texts are identical
if isequal(input, decoded)
    fprintf("Success!\n\n");
else
    fprintf("I don't think you are passing this course...\n\n");
end

%Write the decoded text to a separate file
fileID_Decoded = fopen('decodedText.txt', 'w');
fprintf(fileID_Decoded, decoded);

%Calculate efficiency of Huffman coding
numBits_Huffman = 0;
for i = 1:length(codes)
    numBits_Huffman = numBits_Huffman + probs(i) * length(codes{i});
end
efficiency_Huffman = entropy / numBits_Huffman;

fprintf("For Huffman coding:\n");
fprintf("-Number of bits/symbols = %f\n-Efficiency = %f\n\n", numBits_Huffman, efficiency_Huffman);

%% Entropy Function
% <include>GetEntropy.m</include>
%% Probabilities Function
% <include>GetProbabilities.m</include>
%% The Mixup Function
% <include>mixup.m</include>
%% Huffman Code Creator
% <include>HuffmanCreator.m</include>
%% Huffman Encoder
% <include>HuffmanEncoder.m</include>
%% Huffman Decoder
% <include>HuffmanDecoder.m</include>