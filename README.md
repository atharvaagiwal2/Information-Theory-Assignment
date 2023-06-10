## 1. Run-Length-Encoding
Run-length encoding (RLE) is a simple compression algorithm that is used to reduce the size of data by identifying and encoding long runs of repeated symbols. In RLE, a run of symbols is represented by a count followed by the symbol itself.

![image](https://user-images.githubusercontent.com/130425572/235819011-d2240154-d29b-4568-a0b2-1059f1265fd0.png)

Bose, R. (2017). Information theory, coding and cryptography (3rd ed.). Wiley.

## 2. Lempel-Ziv-Algorithm

The Lempel-Ziv (LZ) algorithm is a lossless data compression algorithm that was first introduced by Abraham Lempel and Jacob Ziv in 1977. The LZ algorithm belongs to a class of dictionary-based compression algorithms, which work by replacing repetitive sequences of data with references to a dictionary of previously seen patterns.

![image](https://user-images.githubusercontent.com/130425572/235818515-0bc3dbaf-1bae-4f53-9112-bdb2fb92acb2.png)

Bose, R. (2017). Information theory, coding and cryptography (3rd ed.). Wiley

## 3. Binary-Symmetric-Channel

The Binary Symmetric Channel (BSC) is a common model used to describe the behavior of a communication channel that introduces errors into transmitted data. The BSC is a type of channel where each transmitted bit has a probability p of being flipped or inverted. The channel can be visualized as a noise source that flips bits at random.

The operation of the BSC can be modeled by a simple process where each transmitted bit is randomly inverted with a probability p. The probability of receiving an error-free bit is therefore 1-p. A transmitted message of length n that experiences the BSC can be represented as a binary vector of length n, where each entry is either a 0 or 1. After transmission, some of the bits may have been inverted by the channel with probability p. The received message can be represented as another binary vector of length n, where some of the bits may have changed value.

Here three binary symmetric channels with probability of errors are {0.9, 0.5, 0.1} are created and we observe the received image if the image is transmitted over one of these three binary symmetric channels.

## 4. Parity-Encoder-and-Decoder


### Introduction
Error detection and correction is a crucial aspect of data transmission, especially when dealing with noisy channels. A simple way to detect and correct errors in binary data is by using parity encoding and decoding. In this project, we will design a simple parity encoder and decoder and observe its performance with different numbers of parity bits.

### Parity Encoding
Parity encoding is a technique that adds a parity bit to the binary data being transmitted. The parity bit is set to 1 or 0 depending on the parity scheme used. The two most common parity schemes are odd parity and even parity. In odd parity, the parity bit is set to 1 if the number of 1s in the data plus the parity bit is odd. In even parity, the parity bit is set to 1 if the number of 1s in the data plus the parity bit is even.

### Parity Decoding
Parity decoding is the process of detecting and correcting errors in the received parity-encoded data. To detect errors, we can count the number of 1s in the received data, including the parity bit, and compare it to the expected parity value based on the parity scheme used. If the number of 1s does not match the expected parity value, an error has occurred.

## 5. Huffman-Coding
Here a grayscale image will be analyzed using histogram and Huffman coding.
