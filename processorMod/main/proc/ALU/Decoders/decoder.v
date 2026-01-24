module decode3bits(threeSelect, res);

	input [2:0] threeSelect;
	output [7:0] res;

    wire tempNot0, tempNot1, tempNot2;

    not firstNot(tempNot0, threeSelect[0]);
    not secondNot(tempNot1, threeSelect[1]);
    not thirdNot(tempNot2, threeSelect[2]);

    // decoding 8 possible outputs

	and anddec0(res[0], tempNot2, tempNot1, tempNot0);
	and anddec1(res[1], tempNot2, tempNot1, threeSelect[0]);
	and anddec2(res[2], tempNot2, threeSelect[1], tempNot0);
	and anddec3(res[3], tempNot2, threeSelect[1], threeSelect[0]);
	and anddec4(res[4], threeSelect[2], tempNot1, tempNot0);
	and anddec5(res[5], threeSelect[2], tempNot1, threeSelect[0]);
	and anddec6(res[6], threeSelect[2], threeSelect[1], tempNot0);
	and anddec7(res[7], threeSelect[2], threeSelect[1], threeSelect[0]);

endmodule