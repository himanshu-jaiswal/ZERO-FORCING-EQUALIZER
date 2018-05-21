function [mod,demod] = fsk()
mod = comm.FSKModulator();
demod = comm.FSKDemodulator();
end
