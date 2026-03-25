
`timescale 1ns/1ps

module HA(input wire X, input wire Y, output wire S, output wire C);
    xor (S, X, Y);
    and (C, X, Y);
endmodule

module FA(input wire X, input wire Y, input wire Cin, output wire S, output wire C);
    wire t1, t2, t3;
    xor (t1, X, Y);
    xor (S,  t1, Cin);
    and (t2, X, Y);
    and (t3, t1, Cin);
    or  (C, t2, t3);
endmodule

module Dadda8x8(input wire [7:0] a, input wire [7:0] b, output wire [15:0] prod);

    wire P00, P10, P20, P30, P40, P50, P60, P70,
         P01, P11, P21, P31, P41, P51, P61, P71,
         P02, P12, P22, P32, P42, P52, P62, P72,
         P03, P13, P23, P33, P43, P53, P63, P73,
         P04, P14, P24, P34, P44, P54, P64, P74,
         P05, P15, P25, P35, P45, P55, P65, P75,
         P06, P16, P26, P36, P46, P56, P66, P76,
         P07, P17, P27, P37, P47, P57, P67, P77;

    and (P00, a[0], b[0]); and (P10, a[1], b[0]); and (P20, a[2], b[0]); and (P30, a[3], b[0]);
    and (P40, a[4], b[0]); and (P50, a[5], b[0]); and (P60, a[6], b[0]); and (P70, a[7], b[0]);

    and (P01, a[0], b[1]); and (P11, a[1], b[1]); and (P21, a[2], b[1]); and (P31, a[3], b[1]);
    and (P41, a[4], b[1]); and (P51, a[5], b[1]); and (P61, a[6], b[1]); and (P71, a[7], b[1]);

    and (P02, a[0], b[2]); and (P12, a[1], b[2]); and (P22, a[2], b[2]); and (P32, a[3], b[2]);
    and (P42, a[4], b[2]); and (P52, a[5], b[2]); and (P62, a[6], b[2]); and (P72, a[7], b[2]);

    and (P03, a[0], b[3]); and (P13, a[1], b[3]); and (P23, a[2], b[3]); and (P33, a[3], b[3]);
    and (P43, a[4], b[3]); and (P53, a[5], b[3]); and (P63, a[6], b[3]); and (P73, a[7], b[3]);

    and (P04, a[0], b[4]); and (P14, a[1], b[4]); and (P24, a[2], b[4]); and (P34, a[3], b[4]);
    and (P44, a[4], b[4]); and (P54, a[5], b[4]); and (P64, a[6], b[4]); and (P74, a[7], b[4]);

    and (P05, a[0], b[5]); and (P15, a[1], b[5]); and (P25, a[2], b[5]); and (P35, a[3], b[5]);
    and (P45, a[4], b[5]); and (P55, a[5], b[5]); and (P65, a[6], b[5]); and (P75, a[7], b[5]);

    and (P06, a[0], b[6]); and (P16, a[1], b[6]); and (P26, a[2], b[6]); and (P36, a[3], b[6]);
    and (P46, a[4], b[6]); and (P56, a[5], b[6]); and (P66, a[6], b[6]); and (P76, a[7], b[6]);

    and (P07, a[0], b[7]); and (P17, a[1], b[7]); and (P27, a[2], b[7]); and (P37, a[3], b[7]);
    and (P47, a[4], b[7]); and (P57, a[5], b[7]); and (P67, a[6], b[7]); and (P77, a[7], b[7]);

    wire H1S,H1C,H2S,H2C,H3S,H3C,H4S,H4C,H5S,H5C,H6S,H6C,H7S,H7C;
    wire F1S,F1C,F2S,F2C,F3S,F3C,F4S,F4C,F5S,F5C,F6S,F6C,F7S,F7C,F8S,F8C,F9S,F9C,
         F10S,F10C,F11S,F11C,F12S,F12C,F13S,F13C,F14S,F14C,F15S,F15C,F16S,F16C,F17S,F17C,
         F18S,F18C,F19S,F19C,F20S,F20C,F21S,F21C,F22S,F22C,F23S,F23C,F24S,F24C,
         F25S,F25C,F26S,F26C,F27S,F27C,F28S,F28C,F29S,F29C,F30S,F30C,F31S,F31C,F32S,F32C,
         F33S,F33C,F34S,F34C,F35S,F35C;

    wire C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14;

    HA H1 (.X(P60), .Y(P51), .S(H1S), .C(H1C));
    FA F1 (.X(P70), .Y(P61), .Cin(P52), .S(F1S), .C(F1C));
    HA H2 (.X(P43), .Y(P34), .S(H2S), .C(H2C));
    FA F2 (.X(P71), .Y(P62), .Cin(P53), .S(F2S), .C(F2C));
    HA H3 (.X(P44), .Y(P35), .S(H3S), .C(H3C));
    FA F3 (.X(P72), .Y(P63), .Cin(P54), .S(F3S), .C(F3C));
    
    HA H4 (.X(P40), .Y(P31), .S(H4S), .C(H4C));
    FA F4 (.X(P50), .Y(P41), .Cin(P32), .S(F4S), .C(F4C));
    HA H5 (.X(P23), .Y(P14), .S(H5S), .C(H5C));
    FA F5 (.X(P42), .Y(P33), .Cin(P24), .S(F5S), .C(F5C));
    FA F6 (.X(P15), .Y(P06), .Cin(H1S), .S(F6S), .C(F6C));
    FA F7 (.X(P25), .Y(P16), .Cin(P07), .S(F7S), .C(F7C));
    FA F8 (.X(F1S), .Y(H2S), .Cin(H1C), .S(F8S), .C(F8C));
    FA F9 (.X(P26), .Y(P17), .Cin(H3S), .S(F9S), .C(F9C));
    FA F10 (.X(F2S), .Y(F1C), .Cin(H2C), .S(F10S), .C(F10C));
    FA F11 (.X(P45), .Y(P36), .Cin(P27), .S(F11S), .C(F11C));
    FA F12 (.X(F2C), .Y(H3C), .Cin(F3S), .S(F12S), .C(F12C));
    FA F13 (.X(P73), .Y(P64), .Cin(P55), .S(F13S), .C(F13C));
    FA F14 (.X(P46), .Y(P37), .Cin(F3C), .S(F14S), .C(F14C));
    FA F15 (.X(P74), .Y(P65), .Cin(P56), .S(F15S), .C(F15C));
    
    
    HA H6 (.X(P30), .Y(P21), .S(H6S), .C(H6C));
    FA F16 (.X(P22), .Y(P13), .Cin(P04), .S(F16S), .C(F16C));
    FA F17 (.X(P05), .Y(F4S), .Cin(H5S), .S(F17S), .C(F17C));
    FA F18 (.X(F6S), .Y(F5S), .Cin(F4C), .S(F18S), .C(F18C));
    FA F19 (.X(F8S), .Y(F7S), .Cin(F5C), .S(F19S), .C(F19C));
    FA F20 (.X(F10S), .Y(F9S), .Cin(F7C), .S(F20S), .C(F20C));
    FA F21 (.X(F11S), .Y(F12S), .Cin(F9C), .S(F21S), .C(F21C));
    FA F22 (.X(F14S), .Y(F13S), .Cin(F11C), .S(F22S), .C(F22C));
    FA F23 (.X(F15S), .Y(F13C), .Cin(F14C), .S(F23S), .C(F23C));
    FA F24 (.X(P75), .Y(P66), .Cin(P57), .S(F24S), .C(F24C));
    
    HA H7 (.X(P20), .Y(P11), .S(H7S), .C(H7C));
    FA F25 (.X(H6S), .Y(P12), .Cin(P03), .S(F25S), .C(F25C));
    FA F26 (.X(F16S), .Y(H4S), .Cin(H6C), .S(F26S), .C(F26C));
    FA F27 (.X(F17S), .Y(F16C), .Cin(H4C), .S(F27S), .C(F27C));
    FA F28 (.X(F18S), .Y(F17C), .Cin(H5C), .S(F28S), .C(F28C));
    FA F29 (.X(F19S), .Y(F6C), .Cin(F18C), .S(F29S), .C(F29C));
    FA F30 (.X(F20S), .Y(F19C), .Cin(F8C), .S(F30S), .C(F30C));
    FA F31 (.X(F21S), .Y(F10C), .Cin(F20C), .S(F31S), .C(F31C));
    FA F32 (.X(F22S), .Y(F12C), .Cin(F21C), .S(F32S), .C(F32C));
    FA F33 (.X(F23S), .Y(F22C), .Cin(P47), .S(F33S), .C(F33C));
    FA F34 (.X(F24S), .Y(F23C), .Cin(F15C), .S(F34S), .C(F34C));
    FA F35 (.X(F24C), .Y(P76), .Cin(P67), .S(F35S), .C(F35C));

    assign prod[0] = P00;

    HA H8 (.X(P10), .Y(P01), .S(prod[1]), .C(C1));
    FA F36 (.X(H7S), .Y(P02), .Cin(C1), .S(prod[2]), .C(C2));
    FA F37 (.X(F25S), .Y(H7C), .Cin(C2), .S(prod[3]), .C(C3));
    FA F38 (.X(F26S), .Y(F25C), .Cin(C3), .S(prod[4]), .C(C4));
    FA F39 (.X(F27S), .Y(F26C), .Cin(C4), .S(prod[5]), .C(C5));
    FA F40 (.X(F28S), .Y(F27C), .Cin(C5), .S(prod[6]), .C(C6));
    FA F41 (.X(F29S), .Y(F28C),  .Cin(C6), .S(prod[7]), .C(C7));
    FA F42 (.X(F30S), .Y(F29C),  .Cin(C7), .S(prod[8]), .C(C8));
    FA F43 (.X(F31S), .Y(F30C),  .Cin(C8), .S(prod[9]), .C(C9));
    FA F44 (.X(F32S), .Y(F31C),  .Cin(C9), .S(prod[10]), .C(C10));
    FA F45 (.X(F33S), .Y(F32C),  .Cin(C10), .S(prod[11]), .C(C11));
    FA F46 (.X(F34S), .Y(F33C), .Cin(C11), .S(prod[12]), .C(C12));
    FA F47 (.X(F35S), .Y(F34C), .Cin(C12), .S(prod[13]), .C(C13));
    FA F48 (.X(P77), .Y(F35C), .Cin(C13), .S(prod[14]), .C(C14));

    assign prod[15] = C14;

endmodule
