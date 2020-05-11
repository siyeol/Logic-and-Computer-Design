// Modified by Minho Kim (9 Oct 2014)

load Encoder4Way.hdl,
output-file Encoder4Way.out,
compare-to Encoder4Way.cmp,
output-list in%B1.4.1 out%B2.2.2;

set in %B0001,
eval,
output;

set in %B0010,
eval,
output;

set in %B0100,
eval,
output;

set in %B1000,
eval,
output;
