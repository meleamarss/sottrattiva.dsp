import("stdfaust.lib");
//fcut = vslider("freq CUt [style:knob] [scale:exp], 880, 20, 10000,");
//order = 32;
//f1 = no.noise : fi.highpass(order,fcut) : fi.lowpass(order,fcut);
//f2 = no.noise : fi.highpass(order,fcut*2) : fi.lowpass(order,fcut*2);
Ebassf1 = fi.highpass(order,fcut) : fi.lowpass(order,fcut) : *(gain) : mater 
with{
order = 128;
fcut = 600;
f1group(x) = hgroup("[01] f1", x);
gain = f1group(vslider("[01] GAIN", -20, -96, 0, 0.1)) : ba.db2linear : si.smoo; 
mater(x) = f1group(attach(x, an.amp_follower(0.5, x) :ba.linear2db : vbargraph("[02] METER [unit:dB]", -70, +5)));
};
Ebassf2 = fi.highpass(order,fcut) : fi.lowpass(order,fcut) : *(gain) : mater 
with{
order = 64;
fcut = 1040;
f2group(x) = hgroup("[02] f2", x);
gain = f2group(vslider("[01] GAIN", 12, -96, +12, 0.1)) : ba.db2linear : si.smoo; 
mater(x) = f2group(attach(x, an.amp_follower(0.5, x) :ba.linear2db : vbargraph("[02] METER [unit:dB]", -70, +5)));
};
Ebassf3 = fi.highpass(order,fcut) : fi.lowpass(order,fcut) : *(gain) : mater 
with{
order = 48;
fcut = 2250;
f3group(x) = hgroup("[03] f3", x);
gain = f3group(vslider("[01] GAIN", 8.8, -96, +6, 0.1)) : ba.db2linear : si.smoo; 
mater(x) = f3group(attach(x, an.amp_follower(0.5, x) :ba.linear2db : vbargraph("[02] METER [unit:dB]", -70, +5)));
};
Ebassf4 = fi.highpass(order,fcut) : fi.lowpass(order,fcut) : *(gain) : mater 
with{
order = 32;
fcut = 2450;
f4group(x) = hgroup("[04] f4", x);
gain = f4group(vslider("[01] GAIN", 3.5, -96, +6, 0.1)) : ba.db2linear : si.smoo; 
mater(x) = f4group(attach(x, an.amp_follower(0.5, x) :ba.linear2db : vbargraph("[02] METER [unit:dB]", -70, +5)));
};
Ebassf5 = fi.highpass(order,fcut) : fi.lowpass(order,fcut) : *(gain) : mater 
with{
order = 32;
fcut = 2750;
f5group(x) = hgroup("[05] f5", x);
gain = f5group(vslider("[01] GAIN", -3.7, -96, +6, 0.1)) : ba.db2linear : si.smoo; 
mater(x) = f5group(attach(x, an.amp_follower(0.5, x) :ba.linear2db : vbargraph("[02] METER [unit:dB]", -70, +5)));
};

process = no.noise <: hgroup("E FORMANTICO", Ebassf1, Ebassf2, Ebassf3, Ebassf4, Ebassf5 :>_);

// vocale E di basso 
// 400 1620 2400 2800 3100
// 40 80 100 120
// 0 -12 -9 -12 -18
// -8 -20 -17 -20 -26
