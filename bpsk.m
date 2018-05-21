function [mod,demod] = bpsk()
mod = comm.BPSKModulator();
demod = comm.BPSKDemodulator();
end
