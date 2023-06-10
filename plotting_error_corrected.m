clc
clear
close all
img = imread('lena.tif');
img_double = im2double(img);
img_uint8 = uint8(img_double * 255);
img_vector = reshape(img_uint8, 1, []);
img_bits = dec2bin(img_vector, 8);
img_bitstream = reshape(img_bits.', 1, []);
input = str2num(img_bitstream')';
M = length(input);
parity_added = zeros(1,13);
error_corrected = zeros(1,13);
a = 1;
for m = 14:-1:2
 n = 2^m-1;
 k = 2^m - 1 - m;
 z = floor(M/k);
 L = z*k;
 H = hammgen(m);
 trt = syndtable(H);

 code = encode(input(1:L),n,k,'hamming/binary');
 output1 = bsc(code, 0.1);
 num_parity_bits = m*z
 parity_added(a) = num_parity_bits;
 error_count = 0;
 N = length(output1);
 for i = 1:n:N
 in = code(i:min(i+n-1, N));
 recd = output1(i:min(i+n-1, N));
 syndrome = rem(recd * H',2);
 s = bit2int(syndrome',m); %convert to decimal
 corrvect = trt(1+s,:);
 corr_code = rem(corrvect+recd,2);
 e1 = countUnequal(recd,in);
 e2 = countUnequal(corr_code,in);
 if (e1-e2)>0
 error_count = error_count + 1;
 end
 end
 error_count
 error_corrected(a) = error_count;
 a = a + 1;
end
plot(parity_added(1:5), error_corrected(1:5), '-ok');
xlabel('Parity bits used');
ylabel('Error Corrected');
