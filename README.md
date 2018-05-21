# ZERO-FORCING-EQUALIZER
Zero Forcing Equalizer refers to a form of linear equalization algorithm used in communication systems which applies the inverse of the frequency response of the channel.
This program is Implementation of Zero Forcing Equalizer in Matlab and calculation of  the Bit Error Rate.

# THEORY 
 Zero Forcing Equalizer refers to a form of linear equalization algorithm used in communication systems which applies the inverse of the frequency response of the channel. 
Considering a channel with frequqncy reponse F(f), let the frequency response of the Equalizer be C(f). 
The Equalizer has to be constructed such that C(f)=1/F(f). 
When the signal is received at the end of the equalizer, the channel noise is removed since C(f)F(f)=1. 
 
# METHODOLOGY 
 
 The software used in this project is MATLAB. A random noise signal will be generated, which will be considered as the channel noise. 
The frequency response of the channel noise will be determined and will be passed through the zero forcing equalizer and BER will be calculated. 
 
 
# Algorithm 
• Number of bits or symbols is taken as input
• Input initialization is done by generating 0,1 with equal probability for N 
• The modulation techniques is selected as fsk ,bpsk and qpsk 
• Noise as white gaussian noise, 0dB variance is added through Rayleigh channel 
• Equalization of the signal is done 
• Calculation of the errors is done 
• Simulated BER and theoretical BER is calculated 
• Results are plotted 
