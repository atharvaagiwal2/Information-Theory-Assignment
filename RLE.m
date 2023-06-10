clc
clear
close all
img = imread('lena.tif');

img_bitstream = '11111111111111100000000000000000001111' 

input = str2num(img_bitstream')';
             
max_rep = find_max_consecutive_repetition(input);
bit_len = ceil(log2(max_rep));
rle = rle_encode_bitstream(input,bit_len);

compression_ratio = size(input)/size(rle)
                

                
function max_rep = find_max_consecutive_repetition(bitstream)
    maxCount = 0;
    currentCount = 0;
    previousBit = NaN; % initialize with NaN to handle the case where the bitstream starts with a NaN value

    for i = 1:length(bitstream)
        bit = bitstream(i);
        if bit == previousBit
            currentCount = currentCount + 1;
        else
            maxCount = max([maxCount, currentCount]);
            currentCount = 1;
            previousBit = bit;
        end
    end

    max_rep = max([maxCount, currentCount]);
end



function rle = rle_encode_bitstream(bitstream,bit_len)
    % Initialize variables
    rle = [];
    current = bitstream(1);
    count = 1;
    
    % Loop through the bitstream
    for i = 2:length(bitstream)
        if bitstream(i) == current
            % If the current bit is the same as the previous one, increment count
            count = count + 1;
        else
            % If the current bit is different, add the previous bit and its count to the output
            rle = [rle dec2bin(count,bit_len) num2str(current)];
            current = bitstream(i);
            count = 1;
        end
    end
    
    % Add the last bit and its count to the output
    rle = [rle dec2bin(count,bit_len)];
    rle = [rle num2str(current)];
end
