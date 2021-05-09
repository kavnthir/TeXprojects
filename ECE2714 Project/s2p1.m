nyquist = 3000;
quality = 35;
centerf = 240;
wo = centerf/nyquist; 
bw = wo/quality;
[b,a] = iirnotch(wo,bw);
fvtool(b,a)