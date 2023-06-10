clc
clear 
close all
img = imread('lena.tif');
imshow(img), title('Original Image');

img_double = im2double(img);
img_uint8 = uint8(img_double * 255);
img_vector = reshape(img_uint8, 1, []);
img_bits = dec2bin(img_vector, 8);
img_bitstream = reshape(img_bits.', 1, []);
input = str2num(img_bitstream')';
output1 = bsc(input, 0.9); %0.9
output2= bsc(input, 0.5);
output3= bsc(input, 0.1);  %0.1
                
op_bitstream1 = num2str(output1')';
op_bits1 = reshape(op_bitstream1, 8, [])';
op_vector1 = bin2dec(op_bits1);
op_uint81 = reshape(op_vector1, 256,256);
op_double1 = im2double(op_uint81) / 255;
imshow(op_double1)
title('Received Image (p=0.1)')
                        
op_bitstream2 = num2str(output2')';
op_bits2 = reshape(op_bitstream2, 8, [])';
op_vector2 = bin2dec(op_bits2);
op_uint82 = reshape(op_vector2, 256,256);
op_double2 = im2double(op_uint82) / 255;
imshow(op_double2)
title('Received Image (p=0.5)')
                        
op_bitstream3 = num2str(output3')';
op_bits3 = reshape(op_bitstream3, 8, [])';
op_vector3 = bin2dec(op_bits3);
op_uint83 = reshape(op_vector3, 256,256);
op_double3 = im2double(op_uint83) / 255;
imshow(op_double3)
title('Received Image (p=0.9)')
