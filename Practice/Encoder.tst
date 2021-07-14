// Modified by Minho Kim (9 Oct 2014)

load Encoder.hdl,
output-file Encoder.out,
compare-to Encoder.cmp,
output-list in%B2.2.2 out%B2.1.2;

set in %B01,
eval,
output;

set in %B10,
eval,
output;
