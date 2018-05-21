function [mod,demod] = qpsk()
mod = comm.QPSKModulator();
mod.BitInput = true;
demod = comm.QPSKDemodulator();
demod.BitOutput = true;
end