module selector(din_0,din_1,din_2,din_3, sel_0,sel_1,en,dout);

    input din_0,din_1,din_2,din_3;
    input sel_0,sel_1;
    input en;
    output dout;

    and u1(f,a,b,d,din_0);
    and u2(g,a,d,b,din_1);
    and u3(h,a,c,d,din_2);
    and u4(i,a,c,e,din_3);

    or  u5(dout,f,g,h,i);

    not u6(a,en);
    not u7(c,b);
    not u8(e,d);
    not u9(b,sel_1);
    not u10(d,sel_0);

endmodule