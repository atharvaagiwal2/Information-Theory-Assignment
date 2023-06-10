clc
clear
close all
img_bitstream = '011001011010' 
  
dictionary = solve(img_bitstream)
 
enc = prefix_locations(dictionary)
  
compression_ratio = length(img_bitstream)/length(enc)
  
  
  
function enc = prefix_locations(dictionary)
    n = length(dictionary);
    num_bits = ceil(log2(n));%changed
    enc = [];%changed
    result = zeros(1, n);
    for i = 1:n
        if length(dictionary{i}) == 1
            result(i) = 0;
            enc = [enc dec2bin(result(i), num_bits) dictionary{i}(end)];%changed
        else
            prefix = dictionary{i}(1:end-1);
            matches = strcmp(prefix, dictionary);
            match_locs = find(matches);
            match_lengths = cellfun(@length, dictionary(matches));
            [~, idx] = max(match_lengths);
            result(i) = match_locs(idx);
            enc = [enc dec2bin(result(i), num_bits) dictionary{i}(end)];
        end
    end
end



function dictionary = solve(s)
    dictionary = {};
    n = length(s);
    start = 1;
    end_ = 1;
    while end_ <= n
        if ismember(s(start:end_), dictionary)
            end_ = end_ + 1;
            continue
        end
        match = find(strfind(s(start:end_), s(end_)), 1);
        if ~isempty(match) && match > 1
            loc = dec2bin(match-1, ceil(log2(end_-start+1))); % binary location of repeated digit
            bit = num2str(str2double(s(end_)) - str2double(s(end_-1))); % change in bit
            dictionary{end+1} = [loc bit]; % add new term to dictionary
            start = end_ + 1;
            end_ = start;
        else
            dictionary{end+1} = s(start:end_);
            start = end_ + 1;
            end_ = start;
        end
    end
end
