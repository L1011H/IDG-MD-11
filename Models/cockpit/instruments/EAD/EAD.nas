# MD-11 EAD

# Copyright (c) 2019 Joshua Davidson (it0uchpods)

var EAD_GE = nil;
var EAD_PW = nil;
var EAD_display = nil;
var eprFixed = 1.00;
var xeng_opt = nil;
var xrev1 = nil;
var xrev2 = nil;
var xrev3 = nil;
var xeng1egtmode = nil;
var xeng2egtmode = nil;
var xeng3egtmode = nil;
var xeng1n2mode = nil;
var xeng2n2mode = nil;
var xeng3n2mode = nil;
var xepract_1 = nil;
var xepract_2 = nil;
var xepract_3 = nil;
# getNodes
var EPRact_1 = props.globals.getNode("/engines/engine[0]/epr-actual", 1);
var EPRact_2 = props.globals.getNode("/engines/engine[1]/epr-actual", 1);
var EPRact_3 = props.globals.getNode("/engines/engine[2]/epr-actual", 1);
var EGTact_1 = props.globals.getNode("/engines/engine[0]/egt-actual", 1);
var EGTact_2 = props.globals.getNode("/engines/engine[1]/egt-actual", 1);
var EGTact_3 = props.globals.getNode("/engines/engine[2]/egt-actual", 1);
var N1act_1 = props.globals.getNode("/engines/engine[0]/n1-actual", 1);
var N1act_2 = props.globals.getNode("/engines/engine[1]/n1-actual", 1);
var N1act_3 = props.globals.getNode("/engines/engine[2]/n1-actual", 1);
var N2act_1 = props.globals.getNode("/engines/engine[0]/n2-actual", 1);
var N2act_2 = props.globals.getNode("/engines/engine[1]/n2-actual", 1);
var N2act_3 = props.globals.getNode("/engines/engine[2]/n2-actual", 1);
var rev1 = props.globals.getNode("/engines/engine[0]/reverser-pos-norm", 1);
var rev2 = props.globals.getNode("/engines/engine[1]/reverser-pos-norm", 1);
var rev3 = props.globals.getNode("/engines/engine[2]/reverser-pos-norm", 1);
var eng1eprmode = props.globals.getNode("/systems/fadec/eng1/epr", 1);
var eng2eprmode = props.globals.getNode("/systems/fadec/eng2/epr", 1);
var eng3eprmode = props.globals.getNode("/systems/fadec/eng3/epr", 1);
var eng1n1mode = props.globals.getNode("/systems/fadec/eng1/n1", 1);
var eng2n1mode = props.globals.getNode("/systems/fadec/eng2/n1", 1);
var eng3n1mode = props.globals.getNode("/systems/fadec/eng3/n1", 1);
var eng1n2mode = props.globals.getNode("/systems/fadec/eng1/n2", 1);
var eng2n2mode = props.globals.getNode("/systems/fadec/eng2/n2", 1);
var eng3n2mode = props.globals.getNode("/systems/fadec/eng3/n2", 1);
var eng1egtmode = props.globals.getNode("/systems/fadec/eng1/egt", 1);
var eng2egtmode = props.globals.getNode("/systems/fadec/eng2/egt", 1);
var eng3egtmode = props.globals.getNode("/systems/fadec/eng3/egt", 1);
var eng1ffmode = props.globals.getNode("/systems/fadec/eng1/ff", 1);
var eng2ffmode = props.globals.getNode("/systems/fadec/eng2/ff", 1);
var eng3ffmode = props.globals.getNode("/systems/fadec/eng3/ff", 1);
var ignition1 = props.globals.getNode("/controls/engines/ignition-1", 1);
var ignition2 = props.globals.getNode("/controls/engines/ignition-2", 1);
var ignition3 = props.globals.getNode("/controls/engines/ignition-3", 1);
var startsw1 = props.globals.getNode("/controls/engines/engine[0]/start-switch", 1);
var startsw2 = props.globals.getNode("/controls/engines/engine[1]/start-switch", 1);
var startsw3 = props.globals.getNode("/controls/engines/engine[2]/start-switch", 1);
var cutoff1 = props.globals.getNode("/controls/engines/engine[0]/cutoff");
var cutoff2 = props.globals.getNode("/controls/engines/engine[1]/cutoff");
var cutoff3 = props.globals.getNode("/controls/engines/engine[2]/cutoff");
var starter1 = props.globals.getNode("/controls/engines/engine[0]/starter");
var starter2 = props.globals.getNode("/controls/engines/engine[1]/starter");
var starter3 = props.globals.getNode("/controls/engines/engine[2]/starter");
var thrustlimit = props.globals.getNode("/controls/engines/thrust-limit");
var n1limit = props.globals.getNode("/controls/engines/n1-limit");
var eprlimit = props.globals.getNode("/controls/engines/epr-limit");
var eng_opt = props.globals.getNode("/options/eng", 1);
var ead_rate = props.globals.getNode("/systems/acconfig/options/ead-rate", 1);

# initNodes
var fuel_1 = props.globals.initNode("/engines/engine[0]/fuel-flow_actual", 0); # not sure why this way but its like this in a320
var fuel_2 = props.globals.initNode("/engines/engine[1]/fuel-flow_actual", 0);
var fuel_3 = props.globals.initNode("/engines/engine[2]/fuel-flow_actual", 0);
var EPR_1 = props.globals.initNode("/DU/EAD/EPR[0]", 0, "DOUBLE");
var EPR_2 = props.globals.initNode("/DU/EAD/EPR[1]", 0, "DOUBLE");
var EPR_3 = props.globals.initNode("/DU/EAD/EPR[2]", 0, "DOUBLE");
var EPRthr_1 = props.globals.initNode("/DU/EAD/EPRthr[0]", 0, "DOUBLE");
var EPRthr_1 = props.globals.initNode("/DU/EAD/EPRthr[1]", 0, "DOUBLE");
var EPRthr_1 = props.globals.initNode("/DU/EAD/EPRthr[2]", 0, "DOUBLE");
var EPRlim = props.globals.initNode("/DU/EAD/EPRLimit", 0, "DOUBLE");
var N1thr1 = props.globals.initNode("/DU/EAD/N1thr[0]", 0, "DOUBLE");
var N1thr2 = props.globals.initNode("/DU/EAD/N1thr[1]", 0, "DOUBLE");
var N1thr3 = props.globals.initNode("/DU/EAD/N1thr[2]", 0, "DOUBLE");
var N1lim = props.globals.initNode("/DU/EAD/N1Limit", 0, "DOUBLE");
var EGT1 = props.globals.initNode("/DU/EAD/EGT[0]", 0, "DOUBLE");
var EGT2 = props.globals.initNode("/DU/EAD/EGT[1]", 0, "DOUBLE");
var EGT3 = props.globals.initNode("/DU/EAD/EGT[2]", 0, "DOUBLE");
var N11 = props.globals.initNode("/DU/EAD/N1[0]", 0, "DOUBLE");
var N12 = props.globals.initNode("/DU/EAD/N1[1]", 0, "DOUBLE");
var N13 = props.globals.initNode("/DU/EAD/N1[2]", 0, "DOUBLE");
var N21 = props.globals.initNode("/DU/EAD/N2[0]", 0, "DOUBLE");
var N22 = props.globals.initNode("/DU/EAD/N2[1]", 0, "DOUBLE");
var N23 = props.globals.initNode("/DU/EAD/N2[2]", 0, "DOUBLE");

var canvas_EAD_base = {
	init: func(canvas_group, file) {
		var font_mapper = func(family, weight) {
			return "LiberationFonts/LiberationSans-Regular.ttf";
		};
		
		canvas.parsesvg(canvas_group, file, {"font-mapper": font_mapper});
		
		var svg_keys = me.getKeys();
		foreach(var key; svg_keys) {
			me[key] = canvas_group.getElementById(key);
			
			var clip_el = canvas_group.getElementById(key ~ "_clip");
			if (clip_el != nil) {
				clip_el.setVisible(0);
				var tran_rect = clip_el.getTransformedBounds();

				var clip_rect = sprintf("rect(%d,%d, %d,%d)", 
				tran_rect[1], # 0 ys
				tran_rect[2], # 1 xe
				tran_rect[3], # 2 ye
				tran_rect[0]); #3 xs
				#   coordinates are top,right,bottom,left (ys, xe, ye, xs) ref: l621 of simgear/canvas/CanvasElement.cxx
				me[key].set("clip", clip_rect);
				me[key].set("clip-frame", canvas.Element.PARENT);
			}
		}

		me.page = canvas_group;

		return me;
	},
	getKeys: func() {
		return [];
	},
	update: func() {
		if (systems.ELEC.Bus.lEmerAc.getValue() >= 110) {
			if (eng_opt.getValue() == "GE") {
				EAD_GE.page.show();
				EAD_PW.page.hide();
				EAD_GE.update();
			} else if (eng_opt.getValue() == "PW") {
				EAD_GE.page.hide();
				EAD_PW.page.show();
				EAD_PW.update();
			}
		} else {
			EAD_GE.page.hide();
			EAD_PW.page.hide();
		}
	},
	updateBase: func() {
		xeng_opt = eng_opt.getValue();
		xrev1 = rev1.getValue();
		xrev2 = rev2.getValue();
		xrev3 = rev3.getValue();
		
		# Reversers
		if (xrev1 == 1and xeng_opt == "GE" and eng1n1mode.getValue() == 1) {
			me["REV1"].show();
		} else if (xrev1 == 1and xeng_opt == "PW" and eng1eprmode.getValue() == 1) {
			me["REV1"].show();
		} else {
			me["REV1"].hide();
		}
		
		if (xrev1 >= 0.95) {
			me["REV1"].setColor(0,1,0);
		} else {
			me["REV1"].setColor(1,1,0);
		}
		
		if (xrev2 == 1 and xeng_opt == "GE" and eng2n1mode.getValue() == 1) {
			me["REV2"].show();
		} else if (xrev2 == 1 and xeng_opt == "PW" and eng2eprmode.getValue() == 1) {
			me["REV2"].show();
		} else {
			me["REV2"].hide();
		}
		
		if (xrev2 >= 0.95) {
			me["REV2"].setColor(0,1,0);
		} else {
			me["REV2"].setColor(1,1,0);
		}
		
		if (xrev1 == 3 and xeng_opt == "GE" and eng3n1mode.getValue() == 1) {
			me["REV3"].show();
		} else if (xrev3 == 1 and xeng_opt == "PW" and eng3eprmode.getValue() == 1) {
			me["REV3"].show();
		} else {
			me["REV3"].hide();
		}
		
		if (xrev3 >= 0.95) {
			me["REV3"].setColor(0,1,0);
		} else {
			me["REV3"].setColor(1,1,0);
		}
	},
};

var canvas_EAD_GE = {
	new: func(canvas_group, file) {
		var m = {parents: [canvas_EAD_GE, canvas_EAD_base]};
		m.init(canvas_group, file);

		return m;
	},
	getKeys: func() {
		return ["N11","N11-decpnt","N11-decimal","N11-box","N11-needle","N11-lim","N11-thr","N11-redline","EGT1","EGT1-needle","EGT1-redstart","EGT1-yline","EGT1-redline","EGT1-ignition","N21","N21-decpnt","N21-decimal","N21-needle","N21-cline","N21-redline",
		"FF1","FFOff1","N12","N12-decpnt","N12-decimal","N12-box","N12-needle","N12-lim","N12-thr","N12-redline","EGT2","EGT2-needle","EGT2-redstart","EGT2-yline","EGT2-redline","EGT2-ignition","N22","N22-decpnt","N22-decimal","N22-needle","N22-cline",
		"N22-redline","FF2","FFOff2","N13","N13-decpnt","N13-decimal","N13-box","N13-needle","N13-lim","N13-thr","N13-redline","EGT3","EGT3-needle","EGT3-redstart","EGT3-yline","EGT3-redline","EGT3-ignition","N23","N23-decpnt","N23-decimal","N23-needle",
		"N23-cline","N23-redline","FF3","FFOff3","N1Lim","N1Lim-decimal","N1LimMode","REV1","REV2","REV3"];
	},
	update: func() {
		# N1
		me["N11"].setText(sprintf("%s", math.floor(N1act_1.getValue() + 0.01)));
		me["N11-decimal"].setTranslation(0, math.round((10 * math.mod(N1act_1.getValue(), 1)) * 33.65, 0.1));
		me["N12"].setText(sprintf("%s", math.floor(N1act_2.getValue() + 0.01)));
		me["N12-decimal"].setTranslation(0, math.round((10 * math.mod(N1act_2.getValue(), 1)) * 33.65, 0.1));
		me["N13"].setText(sprintf("%s", math.floor(N1act_3.getValue() + 0.01)));
		me["N13-decimal"].setTranslation(0, math.round((10 * math.mod(N1act_3.getValue(), 1)) * 33.65, 0.1));
		
		xN1lim = N1lim.getValue();
		me["N11-needle"].setRotation((N1thr1.getValue() + 90) * D2R);
		me["N11-thr"].setRotation((N11.getValue() + 90) * D2R);
		me["N11-lim"].setRotation((xN1lim + 90) * D2R);
		me["N12-needle"].setRotation((N12.getValue() + 90) * D2R);
		me["N12-thr"].setRotation((N1thr2.getValue() + 90) * D2R);
		me["N12-lim"].setRotation((xN1lim + 90) * D2R);
		me["N13-needle"].setRotation((N13.getValue() + 90) * D2R);
		me["N13-thr"].setRotation((N1thr3.getValue() + 90) * D2R);
		me["N13-lim"].setRotation((xN1lim + 90) * D2R);
		
		if (eng1n1mode.getValue() == 1) {
			me["N11"].show();
			me["N11-decpnt"].show();
			me["N11-decimal"].show();
			me["N11-box"].show();
			me["N11-needle"].show();
			me["N11-redline"].show();
		} else {
			me["N11"].hide();
			me["N11-decpnt"].hide();
			me["N11-decimal"].hide();
			me["N11-box"].hide();
			me["N11-needle"].hide();
			me["N11-redline"].hide();
		}
		
		if (eng1n2mode.getValue() == 1) {
			me["N12"].show();
			me["N12-decpnt"].show();
			me["N12-decimal"].show();
			me["N12-box"].show();
			me["N12-needle"].show();
			me["N12-redline"].show();
		} else {
			me["N12"].hide();
			me["N12-decpnt"].hide();
			me["N12-decimal"].hide();
			me["N12-box"].hide();
			me["N12-needle"].hide();
			me["N12-redline"].hide();
		}
		
		if (eng1n2mode.getValue() == 1) {
			me["N13"].show();
			me["N13-decpnt"].show();
			me["N13-decimal"].show();
			me["N13-box"].show();
			me["N13-needle"].show();
			me["N13-redline"].show();
		} else {
			me["N13"].hide();
			me["N13-decpnt"].hide();
			me["N13-decimal"].hide();
			me["N13-box"].hide();
			me["N13-needle"].hide();
			me["N13-redline"].hide();
		}
		
		if (rev1.getValue() < 0.01 and eng1n1mode.getValue() == 1) {
			me["N11-thr"].show();
		} else {
			me["N11-thr"].hide();
		}
		
		if (rev2.getValue() < 0.01 and eng2n1mode.getValue() == 1) {
			me["N12-thr"].show();
		} else {
			me["N12-thr"].hide();
		}
		
		if (rev3.getValue() < 0.01 and eng3n1mode.getValue() == 1) {
			me["N13-thr"].show();
		} else {
			me["N13-thr"].hide();
		}
		
		# EGT
		me["EGT1"].setText(sprintf("%s", math.round(EGTact_1.getValue())));
		me["EGT2"].setText(sprintf("%s", math.round(EGTact_2.getValue())));
		me["EGT3"].setText(sprintf("%s", math.round(EGTact_3.getValue())));
		
		me["EGT1-needle"].setRotation(EGT1.getValue() + 90) * D2R);
		me["EGT2-needle"].setRotation(EGT2.getValue() + 90) * D2R);
		me["EGT3-needle"].setRotation(EGT3.getValue() + 90) * D2R);
		
		xeng1egtmode = eng1egtmode.getValue();
		xeng2egtmode = eng2egtmode.getValue();
		xeng3egtmode = eng3egtmode.getValue();
		
		if (xeng1egtmode == 1) {
			me["EGT1"].show();
			me["EGT1-needle"].show();
			me["EGT1-yline"].show();
			me["EGT1-redline"].show();
		} else {
			me["EGT1"].hide();
			me["EGT1-needle"].hide();
			me["EGT1-yline"].hide();
			me["EGT1-redline"].hide();
		}
		
		if (xeng2egtmode == 1) {
			me["EGT2"].show();
			me["EGT2-needle"].show();
			me["EGT2-yline"].show();
			me["EGT2-redline"].show();
		} else {
			me["EGT2"].hide();
			me["EGT2-needle"].hide();
			me["EGT2-yline"].hide();
			me["EGT2-redline"].hide();
		}
		
		if (xeng3egtmode == 1) {
			me["EGT3"].show();
			me["EGT3-needle"].show();
			me["EGT3-yline"].show();
			me["EGT3-redline"].show();
		} else {
			me["EGT3"].hide();
			me["EGT3-needle"].hide();
			me["EGT3-yline"].hide();
			me["EGT3-redline"].hide();
		}
		
		if (ignition1.getValue() == 1 and xeng1egtmode == 1) {
			me["EGT1-ignition"].show();
		} else {
			me["EGT1-ignition"].hide();
		}
		
		if (ignition2.getValue() == 1 and xeng2egtmode == 1) {
			me["EGT2-ignition"].show();
		} else {
			me["EGT2-ignition"].hide();
		}
		
		if (ignition3.getValue() == 1 and xeng3egtmode == 1) {
			me["EGT3-ignition"].show();
		} else {
			me["EGT3-ignition"].hide();
		}
		
		if (startsw1.getValue() == 1 and xeng1egtmode == 1) {
			me["EGT1-redstart"].show();
		} else {
			me["EGT1-redstart"].hide();
		}
		
		if (startsw2.getValue() == 1 and xeng2egtmode == 1) {
			me["EGT2-redstart"].show();
		} else {
			me["EGT2-redstart"].hide();
		}
		
		if (startsw3.getValue() == 1 and xeng3egtmode == 1) {
			me["EGT3-redstart"].show();
		} else {
			me["EGT3-redstart"].hide();
		}
		
		# N2
		me["N21"].setText(sprintf("%s", math.floor(N1act_1.getValue() + 0.05)));
		me["N21-decimal"].setText(sprintf("%s", int(10 * math.mod(N1act_1.getValue() + 0.05, 1))));
		me["N22"].setText(sprintf("%s", math.floor(N1act_2.getValue() + 0.05)));
		me["N22-decimal"].setText(sprintf("%s", int(10 * math.mod(N1act_2.getValue() + 0.05, 1))));
		me["N23"].setText(sprintf("%s", math.floor(N1act_3.getValue() + 0.05)));
		me["N23-decimal"].setText(sprintf("%s", int(10 * math.mod(N1act_3.getValue() + 0.05, 1))));
		
		me["N21-needle"].setRotation((N21.getValue() + 90) * D2R);
		me["N22-needle"].setRotation((N22.getValue() + 90) * D2R);
		me["N23-needle"].setRotation((N23.getValue() + 90) * D2R);
		
		xeng1n2mode = eng1n2mode.getValue();
		xeng2n2mode = eng2n2mode.getValue();
		xeng3n2mode = eng3n2mode.getValue();
		
		if (xeng1n2mode == 1) {
			me["N21"].show();
			me["N21-decpnt"].show();
			me["N21-decimal"].show();
			me["N21-needle"].show();
			me["N21-redline"].show();
		} else {
			me["N21"].hide();
			me["N21-decpnt"].hide();
			me["N21-decimal"].hide();
			me["N21-needle"].hide();
			me["N21-redline"].hide();
		}
		
		if (xeng2n2mode == 1) {
			me["N22"].show();
			me["N22-decpnt"].show();
			me["N22-decimal"].show();
			me["N22-needle"].show();
			me["N22-redline"].show();
		} else {
			me["N22"].hide();
			me["N22-decpnt"].hide();
			me["N22-decimal"].hide();
			me["N22-needle"].hide();
			me["N22-redline"].hide();
		}
		
		if (xeng3n2mode == 1) {
			me["N23"].show();
			me["N23-decpnt"].show();
			me["N23-decimal"].show();
			me["N23-needle"].show();
			me["N23-redline"].show();
		} else {
			me["N23"].hide();
			me["N23-decpnt"].hide();
			me["N23-decimal"].hide();
			me["N23-needle"].hide();
			me["N23-redline"].hide();
		}
		
		if (starter1.getValue() == 1 and cutoff1.getValue() == 1 and xeng1n2mode == 1) {
			me["N21-cline"].show();
		} else {
			me["N21-cline"].hide();
		}
		
		if (starter2.getValue() == 1 and cutoff2.getValue() == 1 and xeng2n2mode == 1) {
			me["N22-cline"].show();
		} else {
			me["N22-cline"].hide();
		}
		
		if (starter3.getValue() == 1 and cutoff3.getValue() == 1 and xeng3n2mode == 1) {
			me["N23-cline"].show();
		} else {
			me["N23-cline"].hide();
		}
		
		# FF
		me["FF1"].setText(sprintf("%s", math.round(fuel_1.getValue(), 10)));
		me["FF2"].setText(sprintf("%s", math.round(fuel_2.getValue(), 10)));
		me["FF3"].setText(sprintf("%s", math.round(fuel_3.getValue(), 10)));
		
		if (eng1ffmode.getValue() == 1) {
			me["FF1"].show();
		} else {
			me["FF1"].hide();
		}
		
		if (eng2ffmode.getValue() == 1) {
			me["FF2"].show();
		} else {
			me["FF2"].hide();
		}
		
		if (eng3ffmode.getValue() == 1) {
			me["FF3"].show();
		} else {
			me["FF3"].hide();
		}
		
		if (cutoff1.getValue() == 1) {
			me["FFOff1"].show();
		} else {
			me["FFOff1"].hide();
		}
		
		if (cutoff2.getValue() == 1) {
			me["FFOff2"].show();
		} else {
			me["FFOff2"].hide();
		}
		
		if (cutoff3.getValue() == 1) {
			me["FFOff3"].show();
		} else {
			me["FFOff3"].hide();
		}
		
		# N1 Limit
		me["N1LimMode"].setText(sprintf("%s", thrustlimit.getValue()));
		me["N1Lim"].setText(sprintf("%s", math.floor(n1limit.getValue() + 0.05)));
		me["N1Lim-decimal"].setText(sprintf("%s", int(10 * math.mod(n1limit.getValue() + 0.05, 1))));
		
		me.updateBase();
	},
};

var canvas_EAD_PW = {
	new: func(canvas_group, file) {
		var m = {parents: [canvas_EAD_PW, canvas_EAD_base]};
		m.init(canvas_group, file);

		return m;
	},
	getKeys: func() {
		return ["EPR1","EPR1-decpnt","EPR1-T","EPR1-H","EPR1-box","EPR1-needle","EPR1-lim","EPR1-thr","N11","N11-decpnt","N11-decimal","N11-needle","N11-redline","EGT1","EGT1-needle","EGT1-redstart","EGT1-yline","EGT1-redline","EGT1-ignition","N21","N21-decpnt",
		"N21-decimal","N21-needle","N21-cline","N21-redline","FF1","FFOff1","EPR2","EPR2-decpnt","EPR2-T","EPR2-H","EPR2-box","EPR2-needle","EPR2-lim","EPR2-thr","N12","N12-decpnt","N12-decimal","N12-needle","N12-redline","EGT2","EGT2-needle","EGT2-redstart",
		"EGT2-yline","EGT2-redline","EGT2-ignition","N22","N22-decpnt","N22-decimal","N22-needle","N22-cline","N22-redline","FF2","FFOff2","EPR3","EPR3-decpnt","EPR3-T","EPR3-H","EPR3-box","EPR3-needle","EPR3-lim","EPR3-thr","N13","N13-decpnt","N13-decimal",
		"N13-needle","N13-redline","EGT3","EGT3-needle","EGT3-redstart","EGT3-yline","EGT3-redline","EGT3-ignition","N23","N23-decpnt","N23-decimal","N23-needle","N23-cline","N23-redline","FF3","FFOff3","EPRLim","EPRLim-decimal","EPRLimMode","REV1","REV2",
		"REV3"];
	},
	update: func() {
		# EPR
		xepract_1 = EPRact_1.getValue();
		xepract_2 = EPRact_2.getValue();
		xepract_3 = EPRact_3.getValue();
		me["EPR1"].setText(sprintf("%s", math.floor(xepract_1 + 0.0001)));
		me["EPR1-T"].setText(sprintf("%01d", math.floor((xepract_1 - int(xepract_1)) * 10)));
		me["EPR1-H"].setTranslation(0, math.round((10 * math.mod(xepract_1 * 10, 1)) * 33.65, 0.1));
		me["EPR2"].setText(sprintf("%s", math.floor(xepract_2 + 0.0001)));
		me["EPR2-T"].setText(sprintf("%01d", math.floor((xepract_2 - int(xepract_2)) * 10)));
		me["EPR2-H"].setTranslation(0, math.round((10 * math.mod(xepract_2 * 10, 1)) * 33.65, 0.1));
		me["EPR3"].setText(sprintf("%s", math.floor(xepract_3 + 0.0001)));
		me["EPR3-T"].setText(sprintf("%01d", math.floor((xepract_3 - int(xepract_3)) * 10)));
		me["EPR3-H"].setTranslation(0, math.round((10 * math.mod(xepract_3 * 10, 1)) * 33.65, 0.1));
		
		me["EPR1-needle"].setRotation((getprop("/DU/EAD/EPR[0]") + 90) * D2R);
		me["EPR1-thr"].setRotation((getprop("/DU/EAD/EPRthr[0]") + 90) * D2R);
		me["EPR1-lim"].setRotation((getprop("/DU/EAD/EPRLimit") + 90) * D2R);
		me["EPR2-needle"].setRotation((getprop("/DU/EAD/EPR[1]") + 90) * D2R);
		me["EPR2-thr"].setRotation((getprop("/DU/EAD/EPRthr[1]") + 90) * D2R);
		me["EPR2-lim"].setRotation((getprop("/DU/EAD/EPRLimit") + 90) * D2R);
		me["EPR3-needle"].setRotation((getprop("/DU/EAD/EPR[2]") + 90) * D2R);
		me["EPR3-thr"].setRotation((getprop("/DU/EAD/EPRthr[2]") + 90) * D2R);
		me["EPR3-lim"].setRotation((getprop("/DU/EAD/EPRLimit") + 90) * D2R);
		
		if (eng1eprmode.getValue() == 1) {
			me["EPR1"].show();
			me["EPR1-decpnt"].show();
			me["EPR1-T"].show();
			me["EPR1-H"].show();
			me["EPR1-box"].show();
			me["EPR1-needle"].show();
		} else {
			me["EPR1"].hide();
			me["EPR1-decpnt"].hide();
			me["EPR1-T"].hide();
			me["EPR1-H"].hide();
			me["EPR1-box"].hide();
			me["EPR1-needle"].hide();
		}
		
		if (eng2eprmode.getValue() == 1) {
			me["EPR2"].show();
			me["EPR2-decpnt"].show();
			me["EPR2-T"].show();
			me["EPR2-H"].show();
			me["EPR2-box"].show();
			me["EPR2-needle"].show();
		} else {
			me["EPR2"].hide();
			me["EPR2-decpnt"].hide();
			me["EPR2-T"].hide();
			me["EPR2-H"].hide();
			me["EPR2-box"].hide();
			me["EPR2-needle"].hide();
		}
		
		if (eng3eprmode.getValue() == 1) {
			me["EPR3"].show();
			me["EPR3-decpnt"].show();
			me["EPR3-T"].show();
			me["EPR3-H"].show();
			me["EPR3-box"].show();
			me["EPR3-needle"].show();
		} else {
			me["EPR3"].hide();
			me["EPR3-decpnt"].hide();
			me["EPR3-T"].hide();
			me["EPR3-H"].hide();
			me["EPR3-box"].hide();
			me["EPR3-needle"].hide();
		}
		
		if (rev1.getValue() < 0.01 and eng1eprmode.getValue() == 1) {
			me["EPR1-thr"].show();
		} else {
			me["EPR1-thr"].hide();
		}
		
		if (rev2.getValue() < 0.01 and eng2eprmode.getValue() == 1) {
			me["EPR2-thr"].show();
		} else {
			me["EPR2-thr"].hide();
		}
		
		if (rev3.getValue() < 0.01 and eng3eprmode.getValue() == 1) {
			me["EPR3-thr"].show();
		} else {
			me["EPR3-thr"].hide();
		}
		
		# N1
		me["N11"].setText(sprintf("%s", math.floor(N1act_1.getValue() + 0.05)));
		me["N11-decimal"].setText(sprintf("%s", int(10 * math.mod(N1act_1.getValue() + 0.05, 1))));
		me["N12"].setText(sprintf("%s", math.floor(N1act_2.getValue() + 0.05)));
		me["N12-decimal"].setText(sprintf("%s", int(10 * math.mod(N1act_2.getValue() + 0.05, 1))));
		me["N13"].setText(sprintf("%s", math.floor(N1act_3.getValue() + 0.05)));
		me["N13-decimal"].setText(sprintf("%s", int(10 * math.mod(N1act_3.getValue() + 0.05, 1))));
		
		me["N11-needle"].setRotation((N11.getValue() + 90) * D2R);
		me["N12-needle"].setRotation((N12.getValue() + 90) * D2R);
		me["N13-needle"].setRotation((N13.getValue() + 90) * D2R);
		
		if (eng1n1mode.getValue() == 1) {
			me["N11"].show();
			me["N11-decpnt"].show();
			me["N11-decimal"].show();
			me["N11-needle"].show();
			me["N11-redline"].show();
		} else {
			me["N11"].hide();
			me["N11-decpnt"].hide();
			me["N11-decimal"].hide();
			me["N11-needle"].hide();
			me["N11-redline"].hide();
		}
		
		if (eng2n1mode.getValue() == 1) {
			me["N12"].show();
			me["N12-decpnt"].show();
			me["N12-decimal"].show();
			me["N12-needle"].show();
			me["N12-redline"].show();
		} else {
			me["N12"].hide();
			me["N12-decpnt"].hide();
			me["N12-decimal"].hide();
			me["N12-needle"].hide();
			me["N12-redline"].hide();
		}
		
		if (eng3n1mode.getValue() == 1) {
			me["N13"].show();
			me["N13-decpnt"].show();
			me["N13-decimal"].show();
			me["N13-needle"].show();
			me["N13-redline"].show();
		} else {
			me["N13"].hide();
			me["N13-decpnt"].hide();
			me["N13-decimal"].hide();
			me["N13-needle"].hide();
			me["N13-redline"].hide();
		}
		
		# EGT
		me["EGT1"].setText(sprintf("%s", math.round(EGTact_1.getValue())));
		me["EGT2"].setText(sprintf("%s", math.round(EGTact_2.getValue())));
		me["EGT3"].setText(sprintf("%s", math.round(EGTact_3.getValue())));
		
		me["EGT1-needle"].setRotation((EGT1.getValue() + 90) * D2R);
		me["EGT2-needle"].setRotation((EGT2.getValue() + 90) * D2R);
		me["EGT3-needle"].setRotation((EGT3.getValue() + 90) * D2R);
		
		xeng1egtmode = eng1egtmode.getValue();
		xeng2egtmode = eng2egtmode.getValue();
		xeng3egtmode = eng3egtmode.getValue();
		
		if (xeng1egtmode == 1) {
			me["EGT1"].show();
			me["EGT1-needle"].show();
			me["EGT1-yline"].show();
			me["EGT1-redline"].show();
		} else {
			me["EGT1"].hide();
			me["EGT1-needle"].hide();
			me["EGT1-yline"].hide();
			me["EGT1-redline"].hide();
		}
		
		if (xeng2egtmode == 1) {
			me["EGT2"].show();
			me["EGT2-needle"].show();
			me["EGT2-yline"].show();
			me["EGT2-redline"].show();
		} else {
			me["EGT2"].hide();
			me["EGT2-needle"].hide();
			me["EGT2-yline"].hide();
			me["EGT2-redline"].hide();
		}
		
		if (xeng3egtmode == 1) {
			me["EGT3"].show();
			me["EGT3-needle"].show();
			me["EGT3-yline"].show();
			me["EGT3-redline"].show();
		} else {
			me["EGT3"].hide();
			me["EGT3-needle"].hide();
			me["EGT3-yline"].hide();
			me["EGT3-redline"].hide();
		}
		
		if (ignition1.getValue() == 1 and xeng1egtmode == 1) {
			me["EGT1-ignition"].show();
		} else {
			me["EGT1-ignition"].hide();
		}
		
		if (ignition2.getValue() == 1 and xeng2egtmode == 1) {
			me["EGT2-ignition"].show();
		} else {
			me["EGT2-ignition"].hide();
		}
		
		if (ignition3.getValue() == 1 and xeng3egtmode == 1) {
			me["EGT3-ignition"].show();
		} else {
			me["EGT3-ignition"].hide();
		}
		
		if (startsw1.getValue() == 1 and xeng1egtmode == 1) {
			me["EGT1-redstart"].show();
		} else {
			me["EGT1-redstart"].hide();
		}
		
		if (startsw2.getValue() == 1 and xeng2egtmode == 1) {
			me["EGT2-redstart"].show();
		} else {
			me["EGT2-redstart"].hide();
		}
		
		if (startsw3.getValue() == 1 and xeng3egtmode == 1) {
			me["EGT3-redstart"].show();
		} else {
			me["EGT3-redstart"].hide();
		}
		
		# N2
		me["N21"].setText(sprintf("%s", math.floor(N2act_1.getValue() + 0.05)));
		me["N21-decimal"].setText(sprintf("%s", int(10 * math.mod(N2act_1.getValue() + 0.05, 1))));
		me["N22"].setText(sprintf("%s", math.floor(N2act_2.getValue() + 0.05)));
		me["N22-decimal"].setText(sprintf("%s", int(10 * math.mod(N2act_2.getValue() + 0.05, 1))));
		me["N23"].setText(sprintf("%s", math.floor(N2act_3.getValue() + 0.05)));
		me["N23-decimal"].setText(sprintf("%s", int(10 * math.mod(N2act_3.getValue() + 0.05, 1))));
		
		me["N21-needle"].setRotation((N21.getValue() + 90) * D2R);
		me["N22-needle"].setRotation((N22.getValue() + 90) * D2R);
		me["N23-needle"].setRotation((N23.getValue() + 90) * D2R);
		
		xeng1n2mode = eng1n2mode.getValue();
		xeng2n2mode = eng2n2mode.getValue();
		xeng3n2mode = eng3n2mode.getValue();
		
		if (xeng1n2mode == 1) {
			me["N21"].show();
			me["N21-decpnt"].show();
			me["N21-decimal"].show();
			me["N21-needle"].show();
			me["N21-redline"].show();
		} else {
			me["N21"].hide();
			me["N21-decpnt"].hide();
			me["N21-decimal"].hide();
			me["N21-needle"].hide();
			me["N21-redline"].hide();
		}
		
		if (xeng2n2mode == 1) {
			me["N22"].show();
			me["N22-decpnt"].show();
			me["N22-decimal"].show();
			me["N22-needle"].show();
			me["N22-redline"].show();
		} else {
			me["N22"].hide();
			me["N22-decpnt"].hide();
			me["N22-decimal"].hide();
			me["N22-needle"].hide();
			me["N22-redline"].hide();
		}
		
		if (xeng3n2mode == 1) {
			me["N23"].show();
			me["N23-decpnt"].show();
			me["N23-decimal"].show();
			me["N23-needle"].show();
			me["N23-redline"].show();
		} else {
			me["N23"].hide();
			me["N23-decpnt"].hide();
			me["N23-decimal"].hide();
			me["N23-needle"].hide();
			me["N23-redline"].hide();
		}
		
		if (starter1.getValue() == 1 and cutoff1.getValue() == 1 and xeng1n2mode == 1) {
			me["N21-cline"].show();
		} else {
			me["N21-cline"].hide();
		}
		
		if (starter2.getValue() == 1 and cutoff2.getValue() == 1 and xeng2n2mode == 1) {
			me["N22-cline"].show();
		} else {
			me["N22-cline"].hide();
		}
		
		if (starter3.getValue() == 1 and cutoff3.getValue() == 1 and xeng3n2mode == 1) {
			me["N23-cline"].show();
		} else {
			me["N23-cline"].hide();
		}
		
		# FF
		me["FF1"].setText(sprintf("%s", math.round(getprop("/engines/engine[0]/fuel-flow_actual"), 10)));
		me["FF2"].setText(sprintf("%s", math.round(getprop("/engines/engine[1]/fuel-flow_actual"), 10)));
		me["FF3"].setText(sprintf("%s", math.round(getprop("/engines/engine[2]/fuel-flow_actual"), 10)));
		
		if (eng1ffmode.getValue() == 1) {
			me["FF1"].show();
		} else {
			me["FF1"].hide();
		}
		
		if (eng2ffmode.getValue() == 1) {
			me["FF2"].show();
		} else {
			me["FF2"].hide();
		}
		
		if (eng3ffmode.getValue() == 1) {
			me["FF3"].show();
		} else {
			me["FF3"].hide();
		}
		
		if (cutoff1.getValue() == 1) {
			me["FFOff1"].show();
		} else {
			me["FFOff1"].hide();
		}
		
		if (cutoff2.getValue() == 1) {
			me["FFOff2"].show();
		} else {
			me["FFOff2"].hide();
		}
		
		if (cutoff3.getValue() == 1) {
			me["FFOff3"].show();
		} else {
			me["FFOff3"].hide();
		}
		
		# EPR Limit
		eprFixed = eprlimit.getValue() + 0.003;
		me["EPRLimMode"].setText(sprintf("%s", thrustlimit.getValue()));
		me["EPRLim"].setText(sprintf("%1.0f", math.floor(eprFixed)));
		me["EPRLim-decimal"].setText(sprintf("%02d", math.round(eprFixed - int(eprFixed), 0.01) * 100));
		
		me.updateBase();
	},
};

setlistener("sim/signals/fdm-initialized", func {
	EAD_display = canvas.new({
		"name": "EAD",
		"size": [1024, 1024],
		"view": [1024, 1024],
		"mipmapping": 1
	});
	EAD_display.addPlacement({"node": "ead.screen"});
	var group_EAD_GE = EAD_display.createGroup();
	var group_EAD_PW = EAD_display.createGroup();

	EAD_GE = canvas_EAD_GE.new(group_EAD_GE, "Aircraft/IDG-MD-11X/Models/cockpit/instruments/EAD/res/ge.svg");
	EAD_PW = canvas_EAD_PW.new(group_EAD_PW, "Aircraft/IDG-MD-11X/Models/cockpit/instruments/EAD/res/pw.svg");

	EAD_update.start();
	if (ead_rate.getValue() > 1) {
		rateApply();
	}
});

var rateApply = func {
	EAD_update.restart(0.05 * ead_rate.getValue());
}

var EAD_update = maketimer(0.05, func {
	canvas_EAD_base.update();
});

var showEAD = func {
	var dlg = canvas.Window.new([512, 512], "dialog").set("resize", 1);
	dlg.setCanvas(EAD_display);
}
