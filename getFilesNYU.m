switch which_session
	case 1
		% September 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\BackF5\Sep3_2014_1012';
		Electrodes = { %[1, 2, 3, 4, 9, 10, 11, 12];
		        [1, 2, 3, 4, 9, 10, 11, 12];%[general_path,'aibehavphys_Mod3p0_Passive_1012_Sep32014_BackF5_p4_extracted'];...
		        [1, 2, 3, 4, 9, 10, 11, 12];%[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep32014_BackF5_p3_extracted'];...
		        [1, 2, 3, 4, 9, 10, 11, 12];%[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep32014_BackF5_p3_extracted'];...
		        [1, 3, 4, 9, 10, 11, 12];%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep32014_BackF5_p3_extracted'];...
		        [1, 2, 3, 4, 9, 10, 11, 12];%[general_path,'aibehavphysPureTones_Passive_1012_Sep32014_BackF5_p3_extracted'];...
		        [1, 3, 4, 9, 10, 11, 12];%[general_path,'aibehavphysPureTones_Passive_1012_Sep32014_BackF5_p4_extracted'];...
				};

		ExcludeTrial =  {[32, 26, 24, 25, 80:111, 116, 269];...%[general_path,'aibehavphys_Mod3p0_Passive_1012_Sep32014_BackF5_p4_extracted'];...
			[30, 36, 40, 49, 51, 61, 83, 88, 89, 93, 112, 114, 123, 126, 141, 143, 144, 148, 156, 158, 180, 182, 186];...%[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep32014_BackF5_p3_extracted.hd5'];...
			[9, 10, 11, 15, 16, 22, 34, 35, 49, 62, 83, 84, 94, 101, 102, 111, 115, 137, 157, 192];...%[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep32014_BackF5_p3_extracted'];...
			[28, 54, 63, 74:77, 93, 95, 99, 106, 107, 109, 123, 124, 128, 130, 141, 145, 157, 166, 167, 184, 192. ];...% [general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep32014_BackF5_p3_extracted.hd5'];...
			[3, 11, 13, 24, 38, 45:46, 70, 86, 96, 99, 104:105, 111, 112, 126, 130:134, 141:145, 152, 155, 157, 163, 174, 176];...%[general_path,'aibehavphysPureTones_Passive_1012_Sep32014_BackF5_p3_extracted.hd5'];...
			[2:6, 8, 10:12, 15, 17, 20, 27, 30:34, 39, 55, 61:63, 68, 71, 119:120, 136:139, 140, 141, 156, 158: 160, 170, 172, 235, 257:262, 264:268, 270, 279:280, 285, 290:293, 318, 338:340, 348, 421, 423, 436:443];...% [general_path,'aibehavphysPureTones_Passive_1012_Sep32014_BackF5_p4_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p0_Passive_1012_Sep32014_BackF5_p4_extracted'];...
			[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep32014_BackF5_p3_extracted'];...
			[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep32014_BackF5_p3_extracted'];...
			[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep32014_BackF5_p3_extracted'];...
			[general_path,'aibehavphysPureTones_Passive_1012_Sep32014_BackF5_p3_extracted'];...
			[general_path,'aibehavphysPureTones_Passive_1012_Sep32014_BackF5_p4_extracted'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Sept 3rd 2014'};
		ANIMAL = {'BackF5'};
		MaskNr =  [];
		ActPass = [];
	case 2
		% September 4
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\BackF5\Sep4_2014_1012';% this is the second analysis
		Electrodes =  { % [1, 2, 3, 4, 9, 10, 11, 16];
		        [1, 3, 4, 9, 10, 11];%[general_path,'aiMixbehavphys_Passive_1012_Sep42014_BackF5_p1_extracted'];...
		        [1, 2, 3, 4, 9, 10, 11, 16];%[general_path,'aiMixbehavphys_Passive_1012_Sep42014_BackF5_p2_extracted'];...
		        [1, 2, 3, 4, 9, 10, 11, 12];%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep42014_BackF5_p1_extracted'];...
		        [1, 3, 4, 9, 10, 11, 12];%[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep42014_BackF5_p1_extracted'];...
		        [1, 2, 3, 4, 9, 10, 11, 12];%[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep42014_BackF5_p1_extracted'];...
		        [1, 2, 3, 4, 9, 10, 11, 16];%[general_path,'aibehavphys_Audiometry_Passive_1012_Sep42014_BackF5_p1_extracted'];...
				};
			
		ExcludeTrial =  {[9, 19, 31, 42, 68:70, 72, 79, 84, 91, 97:98, 102, 120, 123:130, 152, 154, 178:179, 183, 185:186, 189, 191, 193, 194, 197, 223];...%[general_path,'aiMixbehavphys_Passive_1012_Sep42014_BackF5_p1_extracted'];...
			[62:67, 73, 75, 82, 84, 86, 90, 92, 93, 96, 97, 99, 103, 104, 108:111, 121, 122, 129:130, 132, 133, 134, 153:154, 157, 182, 232, 233, 240, 241:243, 252, 329, 330, 331];...%[general_path,'aiMixbehavphys_Passive_1012_Sep42014_BackF5_p2_extracted'];...
			[1, 2, 36, 72, 79, 90, 91, 93:96, 98, 100, 102, 105, 108, 111, 129, 181, 190, 192, 203, 219, 223, 230];...%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep42014_BackF5_p1_extracted'];...
			[6, 36, 73:78, 124, 127, 138, 144, 146, 153, 155, 160, 165, 169, 172, 178, 183:186, 192, 200, 209, 213, 219, 230, 231, 242:245, 250: 252];...%[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep42014_BackF5_p1_extracted'];...
			[31, 34, 57, 58, 110, 115, 118:131, 142, 152:171, 175:177, 181, 192:196, 202, 221:221, 226, 228:230, 234, 237, 243, 246, 250, 252];...%[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep42014_BackF5_p1_extracted'];...
			[33, 61, 132, 139, 283, 507:509, 652, 654, 667, 677, 681, 685, 686, 693, 702, 709, 758, 760, 773, 774, 788, 793, 801, 804, 807, 813];...%[general_path,'aibehavphys_Audiometry_Passive_1012_Sep42014_BackF5_p1_extracted'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Sep42014_BackF5_p1_extracted.hd5'];...
			[general_path,'aiMixbehavphys_Passive_1012_Sep42014_BackF5_p2_extracted.hd5'];...
			[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep42014_BackF5_p1_extracted.hd5'];...
			[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep42014_BackF5_p1_extracted.hd5'];...
			[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep42014_BackF5_p1_extracted.hd5'];...
			[general_path,'aibehavphys_Audiometry_Passive_1012_Sep42014_BackF5_p1_extracted.hd5'];...
			};
		TASK = {'ModActive_part1of2';...
			'ModActive_part1of2';...
			'ModPassive_part1of2';...
			'ModPassive_part2of2';...
			'Mod5Passive';...
			'Unmod2Passive';...
			'Unmod1Passive';...
			'Unmod1Active';...
			'Mod4Passive';...
			};
		sortedspike_filenames =  {{[general_path,'spikesHeadMod3active_part1_E1.mat'];[general_path,'spikesHeadMod3active_part1_E2.mat']};...
			[general_path,'spikesHeadMod3active_part2_E1.mat'];...
			[general_path,'spikesHeadMod3passive_E1.mat'];...
			[general_path,'spikesHeadMod4_E1.mat5'];...
			[general_path,'spikesHeadMod5_E1.mat'];...
			[general_path,'spikesHeadPassivePureToneResponse_E1.mat'];...
			[general_path,'spikesHeadUnmod1passive_E1.mat5'];...
			[general_path,'spikesHeadUnmod2passive_E1.mat'];...
			[general_path,'spikesHeadUnmodactive_E1.mat'];...
			};

		DAY = {'September 4'};
		ANIMAL = {'BackF5'};
		MaskNr =  [];
		ActPass = [];

	case 3
		% September 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\BackF5\Sep5_2014_1012';% this is the second analysis
		Electrodes =  { %[1, 2, 3, 4, 6, 7, 9, 10, 12];
		    [1, 2, 3, 4, 6, 7, 9, 10, 12];%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep52014_BackF5_p1_extracted'];...
		    [1,2, 3, 4, 6, 7, 9, 10, 12];%[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep52014_BackF5_p1_extracted'];...
		    [1,2, 3, 4, 6, 7, 9, 10, 12];%[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep52014_BackF5_p2_extracted'];...
		    [1,2, 3, 4, 6, 7, 9, 10, 12];%[general_path,'aibehavphys_Audiometry_Passive_1012_Sep52014_BackF5_p1_extracted'];...
			};
		
		ExcludeTrial =  {[217, 234];...%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep52014_BackF5_p1_extracted'];...
			[29, 56, 82, 83, 176, 192:199, 222];...%[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep52014_BackF5_p1_extracted'];...
			[16, 61, 120, 130, 139];...%[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep52014_BackF5_p2_extracted'];...
			[10, 15:16, 21, 61:62, 65, 71:73, 77, 89, 91, 93, 102, 107, 109, 118, 122, 123, 129, 130,...
			132, 134, 141, 148, 155, 161:163, 164, 176, 178, 180, 198, 204, 205, 221, 222, 231, 233, 235:237,...
			239, 242, 259:260, 263:266, 269, 272, 280, 282, 283, 287:289, 292, 293, 301:302, 401, 410, 414,...
			415, 425:428, 432, 466, 471, 503, 512, 534, 555, 572, 566, 575, 584, 596, 600, 601, 609, 611, 614:615, 621];...%[general_path,'aibehavphys_Audiometry_Passive_1012_Sep52014_BackF5_p1_extracted'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep52014_BackF5_p1_extracted.hd5'];...
			[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep52014_BackF5_p1_extracted.hd5'];...
			[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep52014_BackF5_p2_extracted.hd5'];...
			[general_path,'aibehavphys_Audiometry_Passive_1012_Sep52014_BackF5_p1_extracted.hd5'];...
			};
		TASK = {'ModActive_part1of2';...
			'ModActive_part1of2';...
			'ModPassive_part1of2';...
			'ModPassive_part2of2';...
			'Mod5Passive';...
			'Unmod2Passive';...
			'Unmod1Passive';...
			'Unmod1Active';...
			'Mod4Passive';...
			};
		sortedspike_filenames =  {{[general_path,'spikesHeadMod3active_part1_E1.mat'];[general_path,'spikesHeadMod3active_part1_E2.mat']};...
			[general_path,'spikesHeadMod3active_part2_E1.mat'];...
			[general_path,'spikesHeadMod3passive_E1.mat'];...
			[general_path,'spikesHeadMod4_E1.mat5'];...
			[general_path,'spikesHeadMod5_E1.mat'];...
			[general_path,'spikesHeadPassivePureToneResponse_E1.mat'];...
			[general_path,'spikesHeadUnmod1passive_E1.mat5'];...
			[general_path,'spikesHeadUnmod2passive_E1.mat'];...
			[general_path,'spikesHeadUnmodactive_E1.mat'];...
			};

		DAY = {'September 5'};
		ANIMAL = {'BackF5'};
		MaskNr =  [];
		ActPass = [];

	case 4
		% September 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\BackF5\Sep8_2014_1012';
		Electrodes = { %[2, 3, 4, 5, 9, 10, 11, 12, 14, 16];
		    [2, 3, 5, 9, 10, 11, 12, 14];%[general_path,'aibehavphys_Audiometry_Passive_1012_Sep82014_BackF5_p1_extracted'];...
		    [2, 3, 4, 5, 9, 10, 11, 12, 14, 16];%[general_path,'aiMixbehavphys_Passive_1012_Sep82014_BackF5_p1_extracted'];...
			};
		
		ExcludeTrial =  {[34, 41:42, 236:237, 278:279, 283:284, 358, 384, 407, 430, 431, 433, 468];...%[general_path,'aibehavphys_Audiometry_Passive_1012_Sep82014_BackF5_p1_extracted.hd5'];...
			[23:30, 38, 67:69, 71, 73, 87, 94, 101, 108, 114, 119, 123, 147:160, 162, 165:185, 208:210, 252, 254, 285:319, 321, 330:333, 339:342, 344, 346, 347, 350:357];...%[general_path,'aiMixbehavphys_Passive_1012_Sep82014_BackF5_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Sep82014_BackF5_p1_extracted'];...
			[general_path,'aiMixbehavphys_Passive_1012_Sep82014_BackF5_p1_extracted'];...          % Fix by Nima
			%[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep32014_BackF5_p3_extracted'];...   % Fix by Nima
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Sept 8th 2014'};
		ANIMAL = {'BackF5'};
		MaskNr =  [];
		ActPass = [];

	case 5
		% September 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\BackF5\Sep10_2014_1012';
		Electrodes = {[3, 9, 10, 11]};%[general_path,'aibehavphys_Audiometry_Passive_1012_Sep102014_BackF5_p1_extracted'];...

		ExcludeTrial =  {[4:22, 37, 39:44, 46:51, 56, 57, 65, 69, 73, 80, 88, 94:100, 104:105, 109:111, 125, 126, 129, 131:135, 140:149, 153:157, 164];...%[general_path,'aibehavphys_Audiometry_Passive_1012_Sep102014_BackF5_p1_extracted.hd5'];...

		};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Sep102014_BackF5_p1_extracted'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Sept 10 2014'};
		ANIMAL = {'BackF5'};
		MaskNr =  [];
		ActPass = [];

	case 6
		% September 11
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\BackF5\Sep11_2014_1012';
		Electrodes = { % [2, 7, 10, 11, 12, 16];
		        [2, 5, 7, 10, 12];%[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep112014_BackF5_p1_extracted'];...
		        [2, 7, 10, 11, 12, 16];%[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep52014_BackF5_p1_raw'];...
				};

		ExcludeTrial =  {[32, 26, 24, 25, 80:111, 116, 259];...%[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep112014_BackF5_p1_extracted'];...
			[30, 36, 40, 49, 51, 61, 83, 88, 89, 93, 112, 114, 123, 126, 141, 143, 144, 148, 156, 158, 180, 182, 186];...%[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep52014_BackF5_p1_raw.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep112014_BackF5_p1_extracted'];...
			[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep52014_BackF5_p1_raw'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Sept 11th 2014'};
		ANIMAL = {'BackF5'};
		MaskNr =  [];
		ActPass = [];

	case 7
		% September 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\BackF5\Sep16_2014_1012';
		Electrodes = {[4, 5, 7, 9];%[general_path,'aibehavphysPT_extracted.hd5'];...
		[9, 10, 11];%[general_path,'aibehavphysPTp2_extracted.hd5'];...
			};

		% trial numbers don't match the files (NA)
% 		ExcludeTrial =  {[32, 26, 24, 25, 80:111, 116, 269];...%[general_path,'aibehavphysPT_extracted.hd5'];...
% 			[22, 30, 36:40, 50, 52, 54, 58, 60, 64, 71, 75, 97, 99, 105, 117, 141, 147, 148, 153, 155, 162, 172,...
% 			174:176, 178, 203, 205, 311, 212:213, 234, 236, 243, 248, 252, 271:274, 278, 280, 307, 308, 313, ...
% 			332, 339, 363, 365, 369, 386:392, 400:416];...%[general_path,'aibehavphysPTp2_extracted.hd5'];...
% 			};

		ExcludeTrial =  {
			[22, 30, 36:40, 50, 52, 54, 58, 60, 64, 71, 75, 97, 99, 105, 117, 141, 147, 148, 153, 155, 162, 172,...
			174:176, 178, 203, 205, 311, 212:213, 234, 236, 243, 248, 252, 271:274, 278, 280, 307, 308, 313, ...
			332, 339, 363, 365, 369, 386:392, 400:416];...%[general_path,'aibehavphysPT_extracted.hd5'];...
			[];
			};

		extracted_filenames = { [general_path,'aibehavphysPT_extracted.hd5'];...
			[general_path,'aibehavphysPTp2_extracted.hd5'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Sept 16th 2014'};
		ANIMAL = {'BackF5'};
		MaskNr =  [];
		ActPass = [];

	case 8
		% September 19
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\BackF5\Sep19_2014_1012';
		Electrodes = {[4, 7, 9, 10];%[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep192014_BackF5_p2_extracted.hd5'];...
		[4, 7, 9, 10];%[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep192014_BackF5_p2_extracted.hd5'];...
		[1, 4, 6, 7, 9, 10];%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep192014_BackF5_p2_extracted.hd5'];...
		[2, 4, 6, 7, 9, 10];%[general_path,'aiMixbehavphys_Passive_1012_Sep192014_BackF5_p1_extracted.hd5'];... 
		[4, 6, 7, 9, 10];%[general_path,'aiMixbehavphys_Unmod1m5_Passive_1012_Sep192014_BackF5_p1_ranunderMixed_extracted.hd5'];... 
		};

		ExcludeTrial =  {[20, 25, 51, 52, 97:98, 100:101, 123:125, 128:129, 131, 135:136, 139:140, 144];...%[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep192014_BackF5_p2_extracted.hd5'];...
			[2, 4, 13, 15, 36, 43, 54, 57, 111, 141];...%[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep192014_BackF5_p2_extracted.hd5'];...
			[9, 16, 47:51];...%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep192014_BackF5_p2_extracted.hd5'];...
			[2, 7:29, 32, 34:35, 37:41, 43:49, 52:53, 60, 63:70, 76, 82:83];...%[general_path,'aiMixbehavphys_Passive_1012_Sep192014_BackF5_p1_extracted.hd5'];...
			[17, 88];...%[general_path,'aiMixbehavphys_Unmod1m5_Passive_1012_Sep192014_BackF5_p1_ranunderMixed_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep192014_BackF5_p2_extracted.hd5'];...
			[general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep192014_BackF5_p2_extracted.hd5'];...
			[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep192014_BackF5_p2_extracted.hd5'];...
			[general_path,'aiMixbehavphys_Passive_1012_Sep192014_BackF5_p1_extracted.hd5'];...
			[general_path,'aiMixbehavphys_Unmod1m5_Passive_1012_Sep192014_BackF5_p1_ranunderMixed_extracted.hd5'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Sept 19th 2014'};
		ANIMAL = {'BackF5'};
		MaskNr =  [];
		ActPass = [];

	case 9
		% October 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct_15_2014_1012';
		Electrodes = {[4,9, 10, 12, 13, 14, 15, 16];%[general_path,'aibehavphys_extracted.hd5'];...
		[3, 4, 9, 10, 11, 12, 13, 14, 15];%[general_path,'aibehavphys_Mod3p5_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			};

		ExcludeTrial =  {[40, 43 48, 66, 67, 77, 78, 79, 81, 85, 90, 91, 95, 96, 101, 102, 106, 117, 124:125, 159, 160, 162, 181, 193, 210, 214, 216, 235:236, 239, 241];...%[general_path,'aibehavphys_extracted.hd5'];...
			[5, 9, 11, 19, 22, 32, 52:53, 85, 113, 122, 123, 127, 162, 173, 174, 176, 178];...%[general_path,'aibehavphys_Mod3p5_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_extracted.hd5'];...
			[general_path,'aibehavphys_Mod3p5_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Oct 15 2014'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];
		ActPass = [];

	case 10
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct3_2014_1012';
		Electrodes = {[1, 2, 6, 9, 12, 14];%[general_path,'aibehavphys_Mod5p5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		ExcludeTrial =  {[3:5, 54, 105:106, 131];...%[general_path,'aibehavphys_Mod5p5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod5p5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Oct 3 2014'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];
		ActPass = [];

	case 11
		% October 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct10_2014_1012';
		Electrodes = {[3, 5, 9, 11 12, 13, 14, 15];%[general_path,'aibehavphys_Mod5p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
		[1, 5, 6, 9, 11 12, 13, 14, 15];%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		ExcludeTrial =  {[6, 9, 13, 44, 46, 49, 65, 70, 77, 84, 88, 91:92, 106, 112, 113, 123, 130, 132, 134, 156, 158, 165, 172, 179, 180, 187, 190, 201, 202, 206, 212];...%[general_path,'aibehavphys_Mod5p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			[11, 48, 57, 66, 85, 128, 139, 140];...%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod5p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			[general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Oct 10 2014'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];
		ActPass = [];

	case 12
		% October 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct20_2014_1012';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 14];%[general_path,'aibehavphys_Unmod1p0_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
		[1, 2, 3, 4, 6, 7, 9, 10, 11, 14];%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			};

		ExcludeTrial =  {[1, 3, 52, 59, 63, 67, 72, 89, 90, 105, 111, 115, 117, 124, 136, 143, 152, 164, 173, 192, 193, 196, 200, 203, 216, 219, 220, 221, 222, 225, 226, 227:231,...
			235, 244, 246, 252, 253, 254, 256, 260, 291, 303, 311, 312, 321:354, 366, 368, 372:385];...%[general_path,'aibehavphys_Unmod1p0_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			[11, 13, 14, 24, 35, 45, 57, 60, 74, 78, 80, 91:92, 101, 106, 107, 120, 127:128, 135, 138, 144, 147, 149, 157, 165:166,...
			168:172, 174, 177, 178:181, 187, 189, 203, 205, 214, 215, 221, 22, 227, 233, 242, 243, 244, 252, 261];...%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			[general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Oct 20 2014'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];
		ActPass = [];

	case 13
		% September 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep23_2014_1012';
		Electrodes = {[1, 2, 4, 7, 9, 10, 11, 12, 14, 16];%[general_path,'aiMixbehavphys_Audiometry_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
		[1, 2, 4, 9, 10, 11, 12, 16];%[general_path,'aiMixbehavphys_Passive_1012_Sep232014_LeftF8_p2_extracted.hd5'];...
			};

		ExcludeTrial =  {[16, 18, 22, 32, 51, 56, 59, 62, 66:67, 83, 84, 95, 107, 112, 137, 138, 158, 214, 216, 230, 233, 235, 239:244, 275, 278, 282, 291, ...
			307, 322, 347, 348, 351, 353, 358, 359, 369:371, 382:385, 387:389, 391, 392, 396, 409, 427:431, 435, 437, 445:447, 449, 458:460, 482, 502, 503, ...
			520, 526, 553, 558, 562, 563, 565:567, 576, 578, 584, 588, 590];...%[general_path,'aiMixbehavphys_Audiometry_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			[10, 24, 25, 26, 27, 31, 26, 27, 31, 36, 37, 39, 41, 43:44, 45, 50, 52:53, 56, 64, 69, 72, 85:86, 88, 130, 131, 152, 177, 179, 209, 218, ...
			220, 221, 223, 26, 275, 283:286, 301, 321, 338, 344, 351, 395:397, 402:405, 415, 425, 429];...%[general_path,'aiMixbehavphys_Passive_1012_Sep232014_LeftF8_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Audiometry_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			[general_path,'aiMixbehavphys_Passive_1012_Sep232014_LeftF8_p2_extracted.hd5'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Sept 23 2014'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];
		ActPass = [];

	case 14
		% September 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep24_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 10, 11];%[general_path,'aibehavphys_Mod3p5_Passive_1012_Sep242014_LeftF8_p2_extracted.hd5'];...
		[1, 2, 4, 5, 6, 7, 9, 10, 11, 14, 16];%[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
		[1, 2, 4, 5, 6, 7, 10, 11, 14, 16];%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];... 
		};

		ExcludeTrial =  {[59, 76, 89, 93, 95, 128, 130:133, 143];...%[general_path,'aibehavphys_Mod3p5_Passive_1012_Sep242014_LeftF8_p2_extracted.hd5'];...
			[8, 12, 16, 22, 26, 83, 98, 114, 139, 141];...%[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			[33, 65, 68, 139, 144];...%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Sep242014_LeftF8_p2_extracted.hd5'];...
			[general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Sept 24 2014'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];
		ActPass = [];

	case 15
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep26_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 11, 14, 15];%[general_path,'aibehavphys_Mod4p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		ExcludeTrial =  {[19, 41, 91];...%[general_path,'aibehavphys_Mod4p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod4p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'September 26 2014'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];
		ActPass = [];

	case 16
		% September 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep29_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 9, 11, 13, 14, 16];%[general_path,'aibehavphys_Mod3p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
		[1, 2, 4, 5, 6, 7, 9, 11, 13, 14, 16];%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
		};

		ExcludeTrial =  {[4, 6, 7, 9:11, 16, 20, 44, 46, 47, 52, 55, 109, 114, 122, 135];...%[general_path,'aibehavphys_Mod3p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			[1, 2, 6:9, 12, 20, 21, 26, 30, 33, 35:36, 38:39, 47, 50, 67, 68, 85, 93, 104, 107, 108, 110, 11, 112, 120, 132, ...
			135, 139, 141, 147, 148, 149, 150, 154:159, 165:171, 175, 179, 184:187];...%[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			[general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Sept 29 2014'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];
		ActPass = [];

	case 17
		% May7
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May7';
		Electrodes = {[1, 2, 4, 6, 7, 9, 11, 12, 14];%[general_path,'aibehavphysTailF1_PureTonePassive_May7_1012_extracted.hd5'];...
		[1, 4, 5, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysMod4Passive_extracted.hd5'];...
		};

		ExcludeTrial =  {[2, 7, 14, 26, 38, 46, 54, 60, 75, 90, 103, 116, 127, 128, 137, 140, 147, 149, 198, 206, 226, 227];...%[general_path,'aibehavphysTailF1_PureTonePassive_May7_1012_extracted.hd5'];...
			[1:11, 18:19, 24:26, 32:33, 38, 41, 42, 44:46, 49, 51, 52, 54, 57, 59:60, 63:64];...%[general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysTailF1_PureTonePassive_May7_1012_extracted.hd5'];...
			[general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'May 7'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];
		ActPass = [];

	case 18
		% May13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May13';
		Electrodes = {[1, 2, 4, 6, 7, 9, 10 11, 12, 14];%[general_path,'aibehavphysModActive_extracted.hd5'];...
		};

		% Fix by Nima
		%ExcludeTrial =  {[1, 3, 4, 6, 10, 11, 13, 15, 17, 19, 22:25];...%[general_path,'aibehavphysTailF1_PureTonePassive_May7_1012_extracted.hd5'];...
		ExcludeTrial =  {[1, 3, 4, 6, 10, 11, 13, 15, 17, 19, 22:25];...%[general_path,'aibehavphysModActive_extracted.hd5'];...
			};

		% Fix by Nima
		%extracted_filenames = { [general_path,'aibehavphysTailF1_PureTonePassive_May7_1012_extracted.hd5'];...
		%[general_path,'aibehavphysMod4Passive_extracted.hd5'];...
		extracted_filenames = {[general_path,'aibehavphysModActive_extracted.hd5'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'May 13'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];
		ActPass = [];

	case 19
		% May 14
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May14';
		Electrodes = {[2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path,'aibehavphys1012_May14_TailF1_ModPassive_extracted.hd5'];...
		[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path,'aibehavphys1012_May14_TailF1_PureTonePassive_extracted.hd5'];...
		[1, 4, 6, 7, 10, 12, 14];%[general_path,'aibehavphys1012_May14_TailF1_UnmodPassive_extracted.hd5'];...
		};

		ExcludeTrial =  {[7, 11, 91, 103, 117:118];...%[general_path,'aibehavphys1012_May14_TailF1_ModPassive_extracted.hd5'];...
			[4, 18, 27, 49, 55, 63, 65, 67, 70, 72, 74:76, 83, 86:90, 100:102, 105, 117:118, 126:127];...%[general_path,'aibehavphys1012_May14_TailF1_PureTonePassive_extracted.hd5'];...
			[1, 2, 6:8, 10, 13, 14, 19, 23, 28, 30, 35, 38:39, 53, 56, 98, 101:104, 107, 108];...%[general_path,'aibehavphys1012_May14_TailF1_UnmodPassive_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphys1012_May14_TailF1_ModPassive_extracted.hd5'];...
			[general_path,'aibehavphys1012_May14_TailF1_PureTonePassive_extracted.hd5'];...
			[general_path,'aibehavphys1012_May14_TailF1_UnmodPassive_extracted.hd5'];...

			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'May 14'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];
		ActPass = [];

	case 20
		% May 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May15';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path,'aibehavphys1012_May15_TailF1_ModActive1_extracted.hd5'];...
		[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path,'aibehavphys1012_May15_TailF1_ModActive2_extracted.hd5'];...
		[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path,'aibehavphys1012_May15_TailF1_PureTonePassive_extracted.hd5'];...
		[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path,'aibehavphys1012_May15_TailF1_PureTonePassive2_extracted.hd5'];...

		};

		ExcludeTrial =  {[];...%[general_path,'aibehavphys1012_May15_TailF1_ModActive1_extracted.hd5'];...
			[6];...%[general_path,'aibehavphys1012_May15_TailF1_ModActive2_extracted.hd5'];...
			[35, 126, 130, 194, 201, 244, 246];...%[general_path,'aibehavphys1012_May15_TailF1_PureTonePassive_extracted.hd5'];...
			[37, 39, 87, 96, 104, 106, 110:114, 130, 258, 299, 301:302, 306, 312:313, 323:324, 327, 329:330];%[general_path,'aibehavphys1012_May15_TailF1_PureTonePassive2_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphys1012_May15_TailF1_ModActive1_extracted.hd5'];...
			[general_path,'aibehavphys1012_May15_TailF1_ModActive2_extracted.hd5'];...
			[general_path,'aibehavphys1012_May15_TailF1_PureTonePassive_extracted.hd5'];...
			[general_path,'aibehavphys1012_May15_TailF1_PureTonePassive2_extracted.hd5'];...

			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'May 15'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];
		ActPass = [];

	case 21
		% May 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May16';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 12, 14];%[general_path,'aibehavphys1012_May16_TailF1_ModActive_extracted.hd5'];...
		[1, 2, 3, 4, 6, 7, 9, 10, 12, 14];%[general_path,'aibehavphys1012_May16_TailF1_PureTonePassive_extracted.hd5'];...
		[1, 4, 7, 12, 13, 14, 15, 16];%[general_path,'aibehavphys1012_May16_TailF1_PureTonePassive2_extracted.hd5'];...
		[1, 4, 5, 7, 12, 13, 14, 15, 16];%[general_path,'aibehavphys1012_May16_TailF1_Unmod5Passive_extracted.hd5'];...

		};

		ExcludeTrial =  {[1, 5, 7, 8, 10, 12, 15, 18, 25, 27, 37, 47, 53, 57, 59, 66:67, 73, 77, 78, 80];...%[general_path,'aibehavphys1012_May16_TailF1_ModActive_extracted.hd5'];...
			[96, 109:114, 130, 299, 306, 313];...%[general_path,'aibehavphys1012_May16_TailF1_PureTonePassive_extracted.hd5'];...
			[1:14, 18:19, 26:27, 32, 46, 57:58, 73, 78, 91:92];...%[general_path,'aibehavphys1012_May16_TailF1_PureTonePassive2_extracted.hd5'];...
			[1, 4, 5, 12:16];%[general_path,'aibehavphys1012_May16_TailF1_Unmod5Passive_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphys1012_May16_TailF1_ModActive_extracted.hd5'];...
			[general_path,'aibehavphys1012_May16_TailF1_PureTonePassive_extracted.hd5'];...
			[general_path,'aibehavphys1012_May16_TailF1_PureTonePassive2_extracted.hd5'];...
			[general_path,'aibehavphys1012_May16_TailF1_Unmod5Passive_extracted.hd5'];...

			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'May 16'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];
		ActPass = [];

	case 22
		% May 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May20';
		Electrodes = {[1, 4, 5, 12, 13, 14, 15, 16];%[general_path,'aibehavphys1012_May20_TailF1_Mod8kHzPassive_extracted.hd5'];...
		[1, 4, 5, 6, 10, 12, 13, 14, 15, 16];%[general_path,'aibehavphys1012_May20_TailF1_ModPassivep2_extracted.hd5'];...
		[1, 4, 5, 6, 12, 13, 14, 15, 16];%[general_path,'aibehavphys1012_May20_TailF1_PureTonePassivep1_extracted.hd5'];...
		[1, 4, 5, 12, 13, 14, 15, 16];%[general_path,'aibehavphys1012_May20_TailF1_PureTonePassivep2_extracted.hd5'];...
		[1, 4, 6, 7, 10, 12, 14];%[general_path,'aibehavphys1012_May20_TailF1_UnmodPassive_extracted.hd5'];...
		};

		ExcludeTrial =  {[5, 13:17, 25, 38, 46, 50:52, 54:62, 64:66, 68:69, 76:77, 79:80, 83:87, 89, 97:101];...%[general_path,'aibehavphys1012_May20_TailF1_Mod8kHzPassive_extracted.hd5'];...
			[3:4, 12:13, 15:17, 19, 26:28, 35];...%[general_path,'aibehavphys1012_May20_TailF1_ModPassivep2_extracted.hd5'];...
			[7, 12:13, 16:17, 21:22, 24:26, 30, 33, 36, 38, 41, 44:46, 52, 73, 75, 86, 102:113];...%[general_path,'aibehavphys1012_May20_TailF1_PureTonePassivep1_extracted.hd5'];...
			[14, 59, 63, 141, 148, 161, 165, 166, 167, 168, 171, 173, 284];%[general_path,'aibehavphys1012_May20_TailF1_PureTonePassivep2_extracted.hd5'];...
			[1, 4, 5, 12:16];%[general_path,'aibehavphys1012_May20_TailF1_UnmodPassive_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphys1012_May20_TailF1_Mod8kHzPassive_extracted.hd5'];...
			[general_path,'aibehavphys1012_May20_TailF1_ModPassivep2_extracted.hd5'];...
			[general_path,'aibehavphys1012_May20_TailF1_PureTonePassivep1_extracted.hd5'];...
			[general_path,'aibehavphys1012_May20_TailF1_PureTonePassivep2_extracted.hd5'];...
			[general_path,'aibehavphys1012_May20_TailF1_UnmodPassive_extracted.hd5'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'May 20'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];
		ActPass = [];

	case 23
		% May 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May21';
		Electrodes = {[1, 4, 6, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphys1012_May21_TailF1_Mod4kHzPassive_extracted.hd5'];...
		[1, 4, 5, 6, 9, 11, 12, 13, 15, 16];%[general_path,'aibehavphys1012_May21_TailF1_ModPassive_extracted'];...

		};

		ExcludeTrial =  {[2:3,8,9,11,12:13,14:16,18,22:23,24:26,33,39,43,45,49,53,54,56,59:61,63,64,74,79,83:85,89,98,109,115,...
			118:122,124,126,128,134,142,144,146,154,163:164,177:179,191,193,202,204,207,213:214,216,221:222,223:224,232,234:235,268:269,270];...%[general_path,'aibehavphys1012_May21_TailF1_Mod4kHzPassive_extracted.hd5'];...
			[1:18,23,26,31:125,133,136,139,145,149:152,159,162,165,167,170,173,175,178,180:181,183,185:187,189,191,194,196,...
			199:204,215,220:224,227:228,231,233,234:235,238,240,250,253:255,262,270];...%[general_path,'aibehavphys1012_May21_TailF1_ModPassive_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphys1012_May21_TailF1_Mod4kHzPassive_extracted.hd5'];...
			[general_path,'aibehavphys1012_May21_TailF1_ModPassive_extracted.hd5'];...

			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'May 21'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];
		ActPass = [];

	case 24
		% May 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May22';
		Electrodes = {[1, 4, 9, 10, 11, 12, 14];%[general_path,'aibehavphys1012_May22_TailF1_UnmodActivep1_extracted.hd5'];...
		[1, 4, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphys1012_May22_TailF1_PureTonePassivep1_extracted.hd5'];...
		[1, 4, 10, 11, 12, 14];%[general_path,'aibehavphys1012_May22_TailF1_ModPassivep3_extracted.hd5'];...
		[1, 4, 9, 10, 11, 12, 14];%[general_path,'aibehavphys1012_May22_TailF1_ModPassivep2_extracted.hd5'];...

		};

		ExcludeTrial =  {[4,25:26,33,37];...%[general_path,'aibehavphys1012_May22_TailF1_UnmodActivep1_extracted.hd5'];...
			[1,2,4,7,11:14,16:22,25,28:29,31,35:41];...%[general_path,'aibehavphys1012_May22_TailF1_PureTonePassivep1_extracted.hd5'];...
			[1,6,8,11,12,21,24,27:32,37:40,45,48:107,108:111,112:115,119:125,128:139,148:171,176,179,186,246:249,255,260,268];...%[general_path,'aibehavphys1012_May22_TailF1_ModPassivep3_extracted.hd5'];...
			[12:13,22:27];...%[general_path,'aibehavphys1012_May22_TailF1_ModPassivep2_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphys1012_May22_TailF1_UnmodActivep1_extracted.hd5'];...
			[general_path,'aibehavphys1012_May22_TailF1_PureTonePassivep1_extracted.hd5'];...
			[general_path,'aibehavphys1012_May22_TailF1_ModPassivep3_extracted.hd5'];...
			[general_path,'aibehavphys1012_May22_TailF1_ModPassivep2_extracted.hd5'];...

			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'May 22'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];
		ActPass = [];

	case 25
		% May 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May27';
		Electrodes = {[2, 3, 4, 5, 6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphys1012_May28_TailF1_UnmodActivep2_extracted.hd5'];...
		[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path,'aibehavphys1012_May28_TailF1_UnmodPassive_extracted.hd5'];...


		};

		ExcludeTrial =  {[1,4,10,17,25,28,29];...%[general_path,'aibehavphys1012_May28_TailF1_UnmodActivep2_extracted.hd5'];...
			[15,22,27,54,55,73,74,79,113,115,118,212,222:224];...%[general_path,'aibehavphys1012_May28_TailF1_UnmodPassive_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_UnmodActivep2_extracted.hd5'];...
			[general_path,'aibehavphys1012_May28_TailF1_UnmodPassive_extracted.hd5'];...

			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'May 27'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];
		ActPass = [];

	case 26
		% May 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May28';
		Electrodes = {[1, 2, 3, 4, 6, 9, 10, 11, 12, 14];%[general_path,'aibehavphys1012_May28_TailF1_PureTonePassive_extracted.hd5'];...

		};

		ExcludeTrial =  {[25,96,131,132,138,154,157,158,160,163,168,174,240,242,245:253,256,266,268:270,298,339,375,377,256,266,268:270,298,339,375,377,387:388,409,414:416,456];...%[general_path,'aibehavphys1012_May28_TailF1_PureTonePassive_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_PureTonePassive_extracted.hd5'];...

			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'May 28'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];
		ActPass = [];

	case 27
		% Sept 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep10_2014_1012';
		Electrodes = {[1, 5, 13, 14, 16];%[general_path,'aibehavphys_Audiometry_Passive_1012_Sep102014_FluffyM4_p1_extracted.hd5'];...
		[1, 5, 11, 13, 14, 15, 16];%[general_path,'aibehavphysm0_extracted.hd5'];...
		[1, 5, 11, 13, 14, 15, 16];%[general_path,'aibehavphysM1_extracted.hd5'];...
		[1, 5, 13, 14, 15, 16];%[general_path,'aibehavphysM3_extracted.hd5'];...
		[1, 5, 11, 13, 14, 15, 16];%[general_path,'aibehavphysM5_extracted.hd5'];...
		[1, 5, 11, 13, 14, 16];%[general_path,'aibehavphysm20_extracted.hd5'];...
		[1, 5, 11, 13, 14, 15, 16];%[general_path,'aibehavphysm30_extracted.hd5'];...
		[1, 5, 11, 13, 14, 15, 16];%[general_path,'aibehavphysm40_extracted.hd5'];...
		};

		ExcludeTrial =  {[12, 16, 17, 20, 23, 31, 34, 41, 43, 45, 46, 68, 79, 99, 111, 119, 134:135, 143, ...
			146, 161, 166, 171, 175, 179, 201, 210, 226, 228, 233, 251, 257, 276, 293];...%[general_path,'aibehavphys_Audiometry_Passive_1012_Sep102014_FluffyM4_p1_extracted.hd5'];...
			[3:5, 10, 33, 44, 57, 58, 73, 82, 99, 105, 125, 129, 148, 180, 183];...%[general_path,'aibehavphysm0_extracted.hd5'];...
			[5:6, 18, 20, 26, 30, 53, 70, 79, 81, 86:88, 97, 59, 169, 171, 205, 231, 241, 267, 271, 273, 302, 324, 345, 366, 393, 398, 416, 457, 458, 460];...%[general_path,'aibehavphysM1_extracted.hd5'];...
			[8:9, 12, 14, 23, 61, 63, 70, 86, 102, 109, 111, 122, 123, 125, 131, 176:179, 183:187, 209, 234, 236, 242:243, 245, 274, 277, 291, 292, 294, ...
			295, 296, 302, 305, 319, 321, 323, 324, 333, 335:337, 341, 434, 343, 344, 346:349, 356, 358, 368, 374, 380, 416, 440, 458 ];...%[general_path,'aibehavphysM3_extracted.hd5'];...
			[10:11, 25, 27, 33, 40, 48, 63, 64, 66:67, 111, 117, 122 133, 136, 140, 171, 177, 199, 209, 213, 220, 236, 262, 275, 276, 288, 291, 306: 308, ...
			315, 317, 318, 320, 321, 336, 337, 339, 340:346, 353, 365, 366, 369:370, 373, 375, 376, 379, 381, 386, 389, 393, 305:396, 399, 403, 409, 413, ...
			423, 437, 439:440, 442, 454, 456, 458, 462, 463, 465, 490, 510, 512, 515, 516, 525:527, 529:539, 541:543, 550, 552, 555:556];...%[general_path,'aibehavphysM5_extracted.hd5'];...
			[3, 11, 13, 26, 35, 58:59, 65, 66, 74, 79, 87, 135, 144, 148, 151, 155, 171, 184, 194, 223];...%[general_path,'aibehavphysm20_extracted.hd5'];...
			[15, 26, 28, 44, 47, 62, 65, 82, 87, 120, 145, 153, 165, 178, 181:184, 190, 201:202, 204, 205, 214, 221, 228:229];...%[general_path,'aibehavphysm30_extracted.hd5'];...
			[13, 27, 29, 37, 44, 46, 54, 55, 70, 82, 83, 85:86, 120, 125, 144, 147:148, 152, 189, 191, 204, 218];...%[general_path,'aibehavphysm40_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Sep102014_FluffyM4_p1_extracted.hd5'];...
			[general_path,'aibehavphysm0_extracted.hd5'];...
			[general_path,'aibehavphysM1_extracted.hd5'];...
			[general_path,'aibehavphysM3_extracted.hd5'];...
			[general_path,'aibehavphysM5_extracted.hd5'];...
			[general_path,'aibehavphysm20_extracted.hd5'];...
			[general_path,'aibehavphysm30_extracted.hd5'];...
			[general_path,'aibehavphysm40_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Sept 10'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 28
		% Sept 11
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep11_2014_1012';
		Electrodes = {[1, 5, 9, 11 13, 14, 15, 16];%[general_path,'aibehavphysM30_extracted.hd5'];...
		[5, 13, 14, 15, 16];%[general_path,'aibehavphysPT_extracted.hd5'];...
		[1, 5, 11, 13, 14, 15, 16];%[general_path,'aiMixbehavphys_Passive_1012_Sep112014_FluffyM4_p1_extracted.hd5'];...
		[1, 5, 11, 13, 14, 16];%[general_path,'aiMixbehavphys_Passive_1012_Sep112014_FluffyM4_p2_extracted.hd5'];...
		[1, 5, 11, 13, 14, 16];%[general_path,'aiMixbehavphys_Passive_1012_Sep112014_FluffyM4_p3_extracted.hd5'];...
		[1, 5, 11, 13, 14, 16];%[general_path,'aiMixbehavphys_Passive_1012_Sep112014_FluffyM4_p4_extracted.hd5'];...

		};

		ExcludeTrial =  {[18, 38, 41, 50, 72, 73, 77, 86, 88, 170];...%[general_path,'aibehavphysM30_extracted.hd5'];...
			[30, 36, 41, 69, 70, 81, 84, 106, 111, 114, 115, 137, 139, 175, 198, 209, 210, 215, 225, 271, 285, 349, 352:354, 378, 382, 398:399, 402, 403, 407, 413, 423, 429, 442, ...
			451, 461, 471, 473, 490, 502, 526, 533:541, 566:567, 569, 575, 578, 582, 587:590];...%[general_path,'aibehavphysPT_extracted.hd5'];...
			[2:3, 10, 16, 20, 32, 38, 51, 58, 61, 66, 67, 86, 88, 89, 99:103, 107:108, 110, 113, 122, 126, 130, 137, 138:141, 144, 146, 151, 152, 158, 170, 178, 180, 182, 183];...%[general_path,'aiMixbehavphys_Passive_1012_Sep112014_FluffyM4_p1_extracted.hd5'];...
			[3, 7, 13, 20, 23:24, 41, 45, 60, 75, 101, 112, 120, 126, 145:146, 157:162];...%[general_path,'aiMixbehavphys_Passive_1012_Sep112014_FluffyM4_p2_extracted.hd5'];...
			[22, 31, 35, 48, 77, 80, 118, 120, 133];...%[general_path,'aiMixbehavphys_Passive_1012_Sep112014_FluffyM4_p3_extracted.hd5'];...
			[19, 25:27, 30, 32, 40, 42, 48, 69, 81, 89, 99, 102, 110, 137, 144, 167];...%[general_path,'aiMixbehavphys_Passive_1012_Sep112014_FluffyM4_p4_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphysM30_extracted.hd5'];...
			[general_path,'aibehavphysPT_extracted.hd5'];...
			[general_path,'aiMixbehavphys_Passive_1012_Sep112014_FluffyM4_p1_extracted.hd5'];...
			[general_path,'aiMixbehavphys_Passive_1012_Sep112014_FluffyM4_p2_extracted.hd5'];...
			[general_path,'aiMixbehavphys_Passive_1012_Sep112014_FluffyM4_p3_extracted.hd5'];...
			[general_path,'aiMixbehavphys_Passive_1012_Sep112014_FluffyM4_p4_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Sept 11'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 29
		% Sept 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep12_2014_1012';
		Electrodes = {[1, 3, 14, 15, 16];%[general_path,'aiMixbehavphys_Passive_1012_Sep122014_FluffyM4_p3_extracted.hd5'];...
		[1, 5, 7, 9, 11, 14, 15, 16];%[general_path,'aiMixbehavphys_Passive_1012_Sep122014_FluffyM4_p2_extracted.hd5'];...
		[1, 3, 5, 9, 11, 14, 15, 16];%[general_path,'aiMixbehavphys_Passive_1012_Sep122014_FluffyM4_p1_extracted.hd5'];...
		[1, 5, 14, 15, 16];%[general_path,'aibehavphysM40_extracted.hd5'];...
		[1, 2, 5, 14, 15, 16];%[general_path,'aibehavphysM30_extracted.hd5'];...
		[1, 5, 11, 13, 14, 16];%[general_path,'aibehavphys_Audiometry_Passive_1012_Sep122014_FluffyM4_p1_extracted.hd5'];...

		};

		ExcludeTrial =  {[25, 35, 91, 103, 104, 112, 128, 132, 174, 176, 190, 208, 218, 234, 239, 241, 244, 260, 262, 272];...%[general_path,'aiMixbehavphys_Passive_1012_Sep122014_FluffyM4_p3_extracted.hd5'];...
			[3, 6, 10, 16, 23, 26, 55, 81, 88, 93, 98, 99, 110, 112, 117, 118, 121, 191, 205, 207, 267, 271, 278, 284, 285, 286];...%[general_path,'aiMixbehavphys_Passive_1012_Sep122014_FluffyM4_p2_extracted.hd5'];...
			[4, 6, 20, 37, 45, 65:66, 94, 100, 102, 141:146, 148];...%[general_path,'aiMixbehavphys_Passive_1012_Sep122014_FluffyM4_p1_extracted.hd5'];...
			[3, 24:25, 28:29, 95:96, 99, 102:103, 108, 109, 122:124, 128:132];...%[general_path,'aibehavphysM40_extracted.hd5'];...
			[21, 27, 33, 66, 67, 71, 72, 75, 76, 84, 90, 108, 112, 113];...%[general_path,'aibehavphysM30_extracted.hd5'];...
			[4, 8, 13:15, 17:19, 25, 32, 35, 48, 51, 55, 66, 67, 70:72, 94, 96, 99, 119, 121, 123, 126, 128, 162, 163, 217, 220:221, 237, 241:242, 265, 277, 311, 365:367, 269, ...
			392, 400, 401, 408, 414, 418, 445, 448, 456, 458, 468, 480, 482, 484, 485:487, 490, 491, 524, 528, 530, 539, 541, 547];...%[general_path,'aibehavphys_Audiometry_Passive_1012_Sep122014_FluffyM4_p1_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Sep122014_FluffyM4_p3_extracted.hd5'];...
			[general_path,'aiMixbehavphys_Passive_1012_Sep122014_FluffyM4_p2_extracted.hd5'];...
			[general_path,'aiMixbehavphys_Passive_1012_Sep122014_FluffyM4_p1_extracted.hd5'];...
			[general_path,'aibehavphysM40_extracted.hd5'];...
			[general_path,'aibehavphysM30_extracted.hd5'];...
			[general_path,'aibehavphys_Audiometry_Passive_1012_Sep122014_FluffyM4_p1_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Sept 12'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 30
		% Sept 14
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep14_2014_1012';
		Electrodes = {[1, 3, 5, 6, 9, 11, 12, 14, 16];%[general_path,'aiMixbehavphys_Passive_1012_Sep142014_FluffyM4_p1_extracted.hd5'];...
		[1, 5, 11, 14, 16];%[general_path,'aiMixbehavphys_Passive_1012_Sep142014_FluffyM4_p2_extracted.hd5'];...
		   };

		ExcludeTrial =  {[2, 17, 19, 21, 29, 30, 31, 39, 45, 52, 64, 82, 91, 127, 131, 133];...%[general_path,'aiMixbehavphys_Passive_1012_Sep142014_FluffyM4_p1_extracted.hd5'];...
			[1:4, 25, 36, 100, 108, 123, 146];...%[general_path,'aiMixbehavphys_Passive_1012_Sep142014_FluffyM4_p2_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Sep142014_FluffyM4_p1_extracted.hd5'];...
			[general_path,'aiMixbehavphys_Passive_1012_Sep142014_FluffyM4_p2_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Sept 14'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 31
		% Fix by Nima
		% % Sept 12
		% Sept 15
		savefilename1 = '';
		savefilename2 = '';
		% Fix by Nima
		%general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep12_2014_1012';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep15_2014_1012';
		Electrodes = {[1, 9, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysM1_extracted.hd5'];...
		[1, 11, 12, 13, 14, 16];%[general_path,'aibehavphysm20p2_extracted.hd5'];...
		[1, 3, 10, 11, 12, 13, 16];%[general_path,'aibehavphysm40_extracted.hd5'];...
		[1, 11, 12, 13];%[general_path,'aibehavphysUnMod1_extracted.hd5'];...
		[1, 3, 11, 12, 14];%[general_path,'aibehavphysUnmodm30_extracted.hd5'];...
		[1, 3, 9, 11, 13, 14];%[general_path,'aiMixbehavphysm40p2_extracted.hd5'];...
		[1, 3, 11, 13, 14];%[general_path,'aiMixbehavphysPT1_extracted.hd5'];...
		};

		ExcludeTrial =  {[1, 7, 9, 13, 30, 31, 34, 36:38, 46, 77, 81:83];...%[general_path,'aibehavphysM1_extracted.hd5'];...
			[19, 23, 27, 28, 31:32, 35, 36, 41, 45, 46, 59, 61, 66, 68, 77, 79, 80, 83, 86, 93, 102, 113, 115, 116, 124, 130, 135, 153:156, 162, 173, 174, 180, 189, 192, 194:203];...%[general_path,'aibehavphysm20p2_extracted.hd5'];...
			[15, 55, 78:81, 83:84, 92, 111, 116:117, 122, 128];...%[general_path,'aibehavphysm40_extracted.hd5'];...
			[29, 43, 62, 72, 85, 88, 90, 111, 125, 131:137];...%[general_path,'aibehavphysUnMod1_extracted.hd5'];...
			[29, 31, 33:35, 47:49, 67:68, 70:71, 74:76, 97:98];...%[general_path,'aibehavphysUnmodm30_extracted.hd5'];...
			[2, 6];...%[general_path,'aiMixbehavphysm40p2_extracted.hd5'];...
			[57, 80, 104, 108, 175, 185, 285:287, 292, 295, 328, 382, 406, 420, 458, 462, 476, 477, 518, 532, 538, 599, 631];...%[general_path,'aiMixbehavphysPT1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysM1_extracted.hd5'];...
			[general_path,'aibehavphysm20p2_extracted.hd5'];...
			[general_path,'aibehavphysm40_extracted.hd5'];...
			[general_path,'aibehavphysUnMod1_extracted.hd5'];...
			[general_path,'aibehavphysUnmodm30_extracted.hd5'];...
			[general_path,'aiMixbehavphysm40p2_extracted.hd5'];...
			[general_path,'aiMixbehavphysPT1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		% Fix by Nima
		%DAY = {'Sept 12'};
		DAY = {'Sept 15'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 32
		% Nov 19
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\BackM4\Nov19';
		Electrodes = {[1, 4, 6, 9:12, 14];%[general_path,'aibehavphys_Nov19_2013_1012_188608_Quiet_extracted.hd5'];...
		[4, 6, 7, 9, 10, 12, 14];%[general_path,'aibehavphys_Nov19_2013_1012_188608_Unmod1_Loud_extracted.hd5'];...
		[4, 6, 9, 10, 12, 14];%[general_path,'aibehavphys_Nov19_2013_1012_188608_Unmod1_Soft_extracted.hd5'];...

		};

		ExcludeTrial =  {[1:8, 10:11, 13:15, 17:18, 21, 23:26, 29, 31:32, 37:41, 56:59, 96, 99, 101, 104, 106:107, 111, 116, 122:126, 128, 129:132, 134:139, 141, ...
			143, 145:153155:164, 194:197, 200:201, 211, 213:214, 219:226, 229, 231, 232:236];...%[general_path,'aibehavphys_Nov19_2013_1012_188608_Quiet_extracted.hd5'];...
			[3:4, 12, 14:16, 19, 21, 24, 30:32, 34, 37, 40, 46, 48:49, 52, 54:55, 63, 65, 70, 73:74, 76, 78, 80:82, 85:86, 92:94, 98, 100:196, 108:110, 113:115, 118, ...
			122:126, 129, 132, 135:136, 140:144, 146:149, 151:161, 164:165, 169, 170, 172:175, 180, 185, 192:193, 195, 205];...%[general_path,'aibehavphys_Nov19_2013_1012_188608_Unmod1_Loud_extracted.hd5'];...
			[3:5, 6, 13, 24, 26, 28:29, 31, 33:36, 38:40, 42:55, 57, 60:62, 64:68, 84:85. 91, 92, 96, 99, 100, 102:103, 105, ...
			110:111, 113:117, 119, 120, 122:128, 130, 131, 137, 139, 140:144, 146:148, 165];...%[general_path,'aibehavphys_Nov19_2013_1012_188608_Unmod1_Soft_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphys_Nov19_2013_1012_188608_Quiet_extracted.hd5'];...
			[general_path,'aibehavphys_Nov19_2013_1012_188608_Unmod1_Loud_extracted.hd5'];...
			[general_path,'aibehavphys_Nov19_2013_1012_188608_Unmod1_Soft_extracted.hd5'];...

			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Nov 19'};
		ANIMAL = {'BackM4'};
		MaskNr =  [];
		ActPass = [];


	case 33
		% Nov 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\BackM4\Nov21';
		Electrodes = {[4, 6, 7, 9, 10, 12];%[general_path,'aibehavphys_extracted.hd5'];...

		};

		ExcludeTrial =  {[1:17, 19:25, 30, 32:57, 59, 61:68, 72:73, 75:85, 88:94, 102, 104:119, 120:140, 141:146, 148:163, 171, 177:178,180:181, 183, 185, 193, 194, ...
			196:197, 199:202, 204, 211:245, 251, 252, 255:263, 267, 271, 278, 285, 290, 294, 303, 306:307, 337, 339, 379:384, 386:387, 393, 398:414, 416, 418:423, ...
			425:432, 435:436, 449, 451:459, 467:469, 471:480, 484:489, 499, 503, 511:512, 514, 544, 547:551, 553:568, 589, 592:608, 610:611, 613:630, 632, 638, 639, ...
			640:649, 651:662];...%[general_path,'aibehavphys_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphys_extracted.hd5'];...

			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'Nov 21'};
		ANIMAL = {'BackM4'};
		MaskNr =  [];
		ActPass = [];

	case 34
		% April 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Apr1_2012';
		Electrodes = {[5, 13, 14, 15, 16];%[general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
		[5, 13, 14, 15, 16];%[general_path,'aibehavphysQuietPassive_extracted.hd5'];...
		[5, 13, 14, 15, 16];%[general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
		};

		ExcludeTrial =  {[132];...%[general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			[30];...%[general_path,'aibehavphysQuietPassive_extracted.hd5'];...
			[13, 22, 34, 84, 116, 123, 127, 139, 205:206, 252];...%[general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			[general_path,'aibehavphysQuietPassive_extracted.hd5'];...
			[general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};
		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};
		DAY = {'April 1'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];
		ActPass = [];

	case 35
		% March 6
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar6_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[general_path,'aibehavphysFluffy0Mod3Passive10min_75dBSPL_extracted.hd5'];...
		};

		ExcludeTrial =  {[34, 84, 115, 143, 145];...%[general_path,'aibehavphysFluffy0Mod3Passive10min_75dBSPL_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0Mod3Passive10min_75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 6'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];
		ActPass = [];

	case 36
		% March 7
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar7_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[general_path,'aibehavphys_Fluffy0_PassiveMod3_40dBSPL_extracted.hd5'];...
			[5, 13, 14, 15, 16];%[general_path,'aibehavphysFluffy0_PassivePureTone_extracted.hd5'];...
		};

		ExcludeTrial =  {[30, 43, 63, 64, 81, 96, 109, 122, 134, 135, 136, 137];...%[general_path,'aibehavphys_Fluffy0_PassiveMod3_40dBSPL_extracted.hd5'];...
			[19, 102:103, 144, 151, 199, 251:253, 294, 338, 340, 341, 352, 367, 404];...%[general_path,'aibehavphysFluffy0_PassivePureTone_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Fluffy0_PassiveMod3_40dBSPL_extracted.hd5'];...
			[general_path,'aibehavphysFluffy0_PassivePureTone_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 7'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];
		ActPass = [];

	case 37
		% March 14
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar14_1012';
		Electrodes = {[6, 13, 14, 15, 16];%[general_path,'aibehavphys1kHzPassiveQuiet_extracted.hd5'];...
			[7, 13, 14, 15, 16];%[general_path,'aibehavphysUnmod1_75dB_Passive_extracted.hd5'];...
		};

		ExcludeTrial =  {[25, 48, 105, 108, 144];...%[general_path,'aibehavphys1kHzPassiveQuiet_extracted.hd5'];...
			[140];...%[general_path,'aibehavphysUnmod1_75dB_Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1kHzPassiveQuiet_extracted.hd5'];...
			[general_path,'aibehavphysUnmod1_75dB_Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 14'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];
		ActPass = [];

	case 38
		% March 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar16_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			[5, 13, 14, 15, 16];%[general_path,'aibehavphysMod4Passive_p2_extracted.hd5'];...
			[5, 13, 14, 15, 16];%[general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		ExcludeTrial =  {[22, 121, 132];...%[general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			[14, 16];...%[general_path,'aibehavphysMod4Passive_p2_extracted.hd5'];...
			[2:3, 6, 25, 77, 80, 93, 95, 100, 101, 107, 111, 112, 113];...%[general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			[general_path,'aibehavphysMod4Passive_p2_extracted.hd5'];...
			[general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 16'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];
		ActPass = [];

	case 39
		% March 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar17_1012';
		Electrodes = {[6, 13, 14, 15, 16];%[general_path,'aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			[7, 13, 14, 15, 16];%[general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...
		};

		ExcludeTrial =  {[25, 48, 105, 108,]; ... 144];...%[general_path,'aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			[140];...%[general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			[general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 17'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];
		ActPass = [];

	case 40
		% March 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar21_1012';
		Electrodes = {[5, 6, 13, 14, 15, 16];%[general_path,'aibehavphysPureTonePassive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[13, 19, 26, 34, 41, 58, 86, 90, 104, 114, 120, 127:128, 146, 167, 193, 194, 196];...%[general_path,'aibehavphysPureTonePassive_p2_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p2_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 21'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];
		ActPass = [];

	case 41
		% March 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar22_1012';
		Electrodes = {[13, 14, 15, 16];%[general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...

			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 22'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];
		ActPass = [];

	case 42
		% March 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar23_1012';
		Electrodes = {[5,6, 13, 14, 15, 16];%[general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[80, 116];...%[general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 23'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];
		ActPass = [];

	case 43
		% March 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar25_1012';
		Electrodes = {[13, 14, 15, 16];%[general_path,'aibehavphysMod1Passive40dBSPL_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[19, 41, 50];...%[general_path,'aibehavphysMod1Passive40dBSPL_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_p1_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 25'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];
		ActPass = [];

	case 44
		% March 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar28_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[114, 128];...%[general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 28'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];
		ActPass = [];

	case 45
		% March 30
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar30_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[22, 45, 62, 113, 117, 135];...%[general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 30'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];
		ActPass = [];

	case 46
		% Oct 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\first_data\Oct12_raw';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysHeadActiveMod3_Oct12_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[70, 72, 74:75];...%[general_path,'aibehavphysHeadActiveMod3_Oct12_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadActiveMod3_Oct12_p2_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 12'};
		ANIMAL = {'first_data'};
		MaskNr =  [];
		ActPass = [];

	case 47
		% Oct 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\first_data\Sep28';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysHead_Silence_1k_extracted.hd5'];...
			[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysHeadMod1k_Sep28_extracted.hd5'];...
			[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysHeadUnmod1_1k_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 10, 12, 15, 16, 23];...%[general_path,'aibehavphysHead_Silence_1k_extracted.hd5'];...
			[36, 41, 44];...%[general_path,'aibehavphysHeadMod1k_Sep28_extracted.hd5'];...
			[20];...%[general_path,'aibehavphysHeadUnmod1_1k_extracted.hd5'];...
			};

		extracted_filenames = {[general_path,'aibehavphysHead_Silence_1k_extracted.hd5'];...
			[general_path,'aibehavphysHeadMod1k_Sep28_extracted.hd5'];...
			[general_path,'aibehavphysHeadUnmod1_1k_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sep 28'};
		ANIMAL = {'first_data'};
		MaskNr =  [];
		ActPass = [];

	case 48
		% Oct 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct24';
		Electrodes = {[5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysActiveMod3_Head_Oct24_extracted.hd5'];...
			[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysActiveUnmod3_HeadOct24_extracted.hd5'];...
			[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysPassiveUnmod2_HeadOct24_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[87];...%[general_path,'aibehavphysActiveMod3_Head_Oct24_extracted.hd5'];...
			[11];...%[general_path,'aibehavphysActiveUnmod3_HeadOct24_extracted.hd5'];...
			[];...%[general_path,'aibehavphysPassiveUnmod2_HeadOct24_p2_extracted.hd5'];...
			};

		extracted_filenames = {[general_path,'aibehavphysActiveMod3_Head_Oct24_extracted.hd5'];...
			[general_path,'aibehavphysActiveUnmod3_HeadOct24_extracted.hd5'];...
			[general_path,'aibehavphysPassiveUnmod2_HeadOct24_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 24'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];
		ActPass = [];

	case 49
		% Oct 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct26';
		Electrodes = {[5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysActiveUnmod1_Head_Oct26_extracted.hd5'];...
			[9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysPassiveUnmod1_Head_Oct26_extracted.hd5'];...
			[5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysPassiveUnMod2_Head_Oct26_p2_extracted.hd5'];...
			[5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysPTQHeadOct26_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[34];...%[general_path,'aibehavphysActiveUnmod1_Head_Oct26_extracted.hd5'];...
			[];...%[general_path,'aibehavphysPassiveUnmod1_Head_Oct26_extracted.hd5'];...
			[];...%[general_path,'aibehavphysPassiveUnMod2_Head_Oct26_p2_extracted.hd5'];...
			[16];...%[general_path,'aibehavphysPTQHeadOct26_p2_extracted.hd5'];...
			};

		extracted_filenames = {[general_path,'aibehavphysActiveUnmod1_Head_Oct26_extracted.hd5'];...
			[general_path,'aibehavphysPassiveUnmod1_Head_Oct26_extracted.hd5'];...
			[general_path,'aibehavphysPassiveUnMod2_Head_Oct26_p2_extracted.hd5'];...
			[general_path,'aibehavphysPTQHeadOct26_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];
		ActPass = [];

	case 50
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		% Fix by Nima
		%general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct17';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct17_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphys_Mod3m10_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 23, 30, 41, 47, 53, 56:57, 68:70, 75, 84:85, 100:102, 107:108, 115:116, 118:121, 130:131, 143, 154:155, 164, 176, 186, 188, ...
			196:197, 201, 206, 222, 235, 243, 259, 261, 276];...%[general_path,'aibehavphys_Mod3m10_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3m10_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 17'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];
		ActPass = [];

	case 51
		% September 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\BackF5\Sep12_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aiMixbehavphys1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[13, 22, 46, 56:58, 80, 85, 88];...%[general_path,'aiMixbehavphys1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys1_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 12'};
		ANIMAL = {'BackF5'};
		MaskNr =  [];
		ActPass = [];

	case 52
		% September 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\BackF5\Sep12_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aiMixbehavphysMix2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[31, 36, 76, 88, 90, 94, 160, 162, 165, 169, 171, 177, 178, 183, 198, 205:207, 216, 219, 257:259, 266, 268];...%[general_path,'aiMixbehavphysMix2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphysMix2_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 12'};
		ANIMAL = {'BackF5'};
		MaskNr =  [];
		ActPass = [];

	case 53
		% September 19
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\BackF5\Sep19_2014_1012';
		Electrodes = {[4, 5, 6, 7, 9, 10, 12, 13, 14, 15, 16];%[general_path,'aiMixbehavphysp2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[28, 29];...%[general_path,'aiMixbehavphysp2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphysp2_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 19'};
		ANIMAL = {'BackF5'};
		MaskNr =  [];
		ActPass = [];

	case 54
		% September 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep10_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aiMixbehavphys_Mix_Passive_1012_Sep102014_FluffyM4_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[21, 29, 66, 73, 78, 99, 134, 146, 147, 161, 164, 167, 178, 196, 247, 269, 312, 313, 317, 348];...%[general_path,'aiMixbehavphys_Mix_Passive_1012_Sep102014_FluffyM4_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Mix_Passive_1012_Sep102014_FluffyM4_p1_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 10'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 55
		% September 11
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep11_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysM40_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 58, 65, 81, 102, 140];...%[general_path,'aibehavphysM40_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysM40_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 11'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 56
		% September 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep12_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysM20_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[general_path,'aibehavphysM20_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysM20_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 12'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 57
		% September 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep15_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysUnMod2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[general_path,'aibehavphysUnMod2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2_extracted.hd5'];...

			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 15'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 58
		% September 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep16_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path,'aibehavphysm5_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4:7, 19, 21, 24, 27, 28, 30, 48:50, 51, 54, 59, 73, 77, 82];...%[general_path,'aibehavphysm5_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysm5_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 16'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 59
		% September 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep16_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysm20_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[general_path,'aibehavphysm20_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysm20_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 16'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 60
		% September 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep16_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 7, 9, 10, 11, 13, 14, 15, 16];%[general_path, 'aibehavphysm30_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 2, 11, 12, 14, 17, 38, 39, 41, 42, 44, 58, 60, 72, 77, 80, 89, 90, 94, 98, 123];...%[general_path,'aibehavphysm30_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysm30_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 16'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 61
		% September 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep16_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 9, 10, 11, 13, 14, 15, 16];%[general_path, 'aibehavphysm40_extracted.hd5'];...
			 };

		ExcludeTrial =  {[145];...%[general_path,'aibehavphysm40_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysm40_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 16'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];


	case 62
		% September 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep16_2014_1012';
		Electrodes = {[1, 2, 3, 5, 9, 10, 11, 13, 14, 15, 16];%[general_path, 'aibehavphysPTp1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[6, 7, 9, 23, 57:58, 63:64, 78, 81, 105, 134:136, 144, 157:158, 161, 164, 167, 172, 182, 207, 229:230, 273:274, 288:289, 293, 330, 332, 336, 341:343, 345, 470:472, 502];...%[general_path,'aibehavphysPTp1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPTp1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 16'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 63
		% September 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep16_2014_1012';
		Electrodes = {[1, 2, 3, 5, 9, 10, 11, 13, 14, 15, 16];%[general_path, 'aiMixbehavphysp1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[12, 14, 19, 22, 24:25, 30, 34, 37, 42, 48, 52, 54, 63:64, 69, 71, 80, 82, 90, 103, 105, 107, 110, 114, 119, 121, 131, 139, 143, 148, 170, 188, 189, 190, 199, 205, 214, 245, 280, 300, 339, 346, 351];...%[general_path,'aiMixbehavphysp1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphysp1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 16'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 64
		% September 19
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep19_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Audiometry_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[8, 13, 18, 75:76, 79:80, 80:86, 94:95, 106, 109, 110, 120, 124:126, 128, 130, 132:138, 151, 172:173, 175, 188, 208:214, ...
			217:218, 220, 221, 224, 226:234, 237, 240:242, 246:247, 265:266, 291:293, 295, 314, 323, 351, 353, 359, 361, 373, 375, 379, 382:384, 411, 424, 452:453, 467, 475, 535, 546, 561, 566:567];...%[aibehavphys_Audiometry_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 19'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 65
		% September 19
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep19_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 7, 9, 10, 11, 13, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1m20_Passive_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 6, 22, 32:33, 46:49, 57, 76, 77, 83, 97, 108, 143:144, 158];...%[aibehavphys_Unmod1m20_Passive_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m20_Passive_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 19'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 66
		% September 19
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep19_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1m30_Passive_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[17, 19, 35, 38, 53, 114, 120, 134, 138, 146:148, 151];...%[aibehavphys_Unmod1m30_Passive_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m30_Passive_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 19'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 67
		% September 19
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep19_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1m40_Passive_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[34, 39, 50, 54, 55, 58, 90:92, 105, 111, 119];...%[aibehavphys_Unmod1m40_Passive_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m40_Passive_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 19'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 68
		% September 19
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep19_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 7, 9, 10, 11, 13, 14, 15, 16];%[general_path, 'aiMixbehavphys_Passive_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 21, 25, 28, 45, 47:49, 52, 59, 64, 203:205, 209:210];...%[aiMixbehavphys_Passive_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Sep192014_FluffyM4_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 19'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 69
		% September 19
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep19_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 7, 9, 10, 11, 13, 14, 15, 16];%[general_path, 'aiMixbehavphys_Passive_1012_Sep192014_FluffyM4_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3, 4, 7, 11, 13, 18, 27:28, 35:41];...%[aiMixbehavphys_Passive_1012_Sep192014_FluffyM4_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Sep192014_FluffyM4_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 19'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 70
		% September 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep20_2014_1012';
		Electrodes = {[1, 2, 3];%[general_path, 'aibehavphysAudiometry_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4, 5];...%[aibehavphysAudiometry_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysAudiometry_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 20'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 71
		% September 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep20_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 9, 10, 11, 13, 14, 15, 16];%[general_path, 'aibehavphysUnmod_m20_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 16, 47, 51, 55:56, 66, 91, 95, 107, 110:111, 116, 122:123, 131:133, 136, 139, 145, 149:150, 152, 170, 174];...%[aibehavphysUnmod_m20_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod_m20_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 20'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 72
		% September 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep20_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysUnmod_m30_extracted.hd5'];...
			 };

		ExcludeTrial =  {[94];...%[aibehavphysUnmod_m30_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod_m30_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 20'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 73
		% September 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep20_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 16];%[general_path, 'aibehavphysUnmod_m40_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3, 8, 18, 24:26, 28, 35, 48, 59:60, 62:63, 65, 69, 72, 75:76, 78, 85:87, 112, 161];...%[aibehavphysUnmod_m40_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod_m40_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 20'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 74
		% September 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep20_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aiMixbehavphysp1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 12:14, 26, 29, 30, 33, 41:43, 62:63, 68:70, 102, 110:111, 114:115, 118:119, 128, 129, 134, 137, ...
			140:142, 152, 156, 163, 166, 172:174, 176, 186, 190:191, 200, 206, 222:223, 230:231, 242];...%[aiMixbehavphysp1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphysp1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 20'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 75
		% September 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep20_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aiMixbehavphysp2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[7, 8, 10];...%[aiMixbehavphysp2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphysp2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 20'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 76
		% September 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\FluffyM4\Sep20_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aiMixbehavphysp3_extracted.hd5'];...
			 };

		ExcludeTrial =  {[30, 32, 35:37, 73, 80, 82, 84, 85, 87, 116:119, 124, 155, 167, 168, 171:184, 186, 187, 193, 194, 198, 200, 208, 211, ...
			212, 213, 233, 330, 341:346];...%[aiMixbehavphysp3_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphysp3_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 20'};
		ANIMAL = {'FluffyM4'};
		MaskNr =  [];
		ActPass = [];

	case 77
		% October 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct10';
		Electrodes = {[1, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysMod3PassiveHeadOct10_extracted.hd5'];...
			 };

		ExcludeTrial =  {[51, 58, 62];...%[aibehavphysMod3PassiveHeadOct10_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3PassiveHeadOct10_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 10'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];
		ActPass = [];

	case 78
		% October 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct15';
		Electrodes = {[1, 6, 7, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysActiveMod3_Head_Oct15_extracted.hd5'];...
			 };

		ExcludeTrial =  {[5, 93];...%[aibehavphysActiveMod3_Head_Oct15_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysActiveMod3_Head_Oct15_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 15'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];
		ActPass = [];

	case 79
		% October 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct15';
		Electrodes = {[1, 6, 7, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysActiveMod4_HeadOct15_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysActiveMod4_HeadOct15_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysActiveMod4_HeadOct15_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 15'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];
		ActPass = [];

	case 80
		% October 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct15';
		Electrodes = {[1, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysMod5PassiveHeadOct15_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 3, 5, 12:13];...%[aibehavphysMod5PassiveHeadOct15_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod5PassiveHeadOct15_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 15'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];
		ActPass = [];

	case 81
		% October 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct_13_2014_1012';
		Electrodes = {[1, 2, 3, 4, 7, 10, 11, 12, 14, 15, 16];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[28, 80, 81, 143, 209, 215, 301, 316:317, 334, 346, 358, 362, 364, 375, 384, 401:402, 408:409, 412:415, 418:420, 435, 464, 471];...%[aibehavphys_Audiometry_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 13'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];
		ActPass = [];

	case 82
		% October 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct_13_2014_1012';
		Electrodes = {[1, 3, 4, 7, 10, 11, 13, 14, 15, 16];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[37, 114, 155:157, 180, 209, 211, 217, 248:249];...%[aibehavphys_Mod3p5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 13'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 83
		% October 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct_13_2014_1012';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Mod4p5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[11, 41, 54, 57, 73, 80, 94, 152, 163, 166, 179, 183, 184, 187, 202:203, 212, 271, 280];...%[aibehavphys_Mod4p5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod4p5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 13'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 84
		% October 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct_13_2014_1012';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 14, 15, 16];%[general_path, 'aibehavphys_Mod5p5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[14, 15, 33, 39:40, 46, 106, 119, 132:133, 280:281, 297];...%[aibehavphys_Mod5p5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod5p5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 13'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 85
		% October 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct_13_2014_1012';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 13, 14, 15, 16];%[general_path, 'aibehavphys_NoMask1kHz_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[31, 36, 47, 62, 151];...%[aibehavphys_NoMask1kHz_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHz_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 13'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 86
		% October 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct_13_2014_1012';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 13, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[7, 9, 17, 25, 49, 51, 54, 60, 66:70, 98, 104, 140, 169:170, 172, 197, 209, 217:218];...%[aibehavphys_Unmod1m5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 13'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 87
		% October 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct_13_2014_1012';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 13, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1p0_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[6, 19, 22, 23, 25, 28, 30, 34, 36:37, 40:42, 44:45, 50, 62, 65, 66, 72, 99, 142, 146:148, 175, 196, 198, 203, 206];...%[aibehavphys_Unmod1p0_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 13'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 88
		% October 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct_13_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Unmod1p5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[76, 77, 143];...%[aibehavphys_Unmod1p5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 13'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 89
		% October 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct_13_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14];%[general_path, 'aiMixbehavphys_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[36, 42, 49:51, 63, 75, 79, 80, 98, 103, 105, 107, 108, 185, 210, 218, 220, 224, 249, 257:259, 261:262, 264, 275, 277, 330, 335, 340, ...
			346:348, 366, 384:386, 395, 455, 457, 493, 499, 522, 541, 542, 561, 562, 576, 579, 585, 594:595, 602, 625, 628, 630, 635, 638:640, 642:644, 647:651, ...
			653, 659, 662:663, 666, 669, 672, 677, 678, 685:691, 693, 698, 713, 717, 720, 721, 729:730, 736, 745, 752, 760, 768, 773, 789, 790, 795, 803, 808, 812, ...
			820, 847, 869, 924, 973, 1002];...%[aiMixbehavphys_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Oct132014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 13'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 90
		% October 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct_15_2014_1012';
		Electrodes = {[1, 2, 3, 4, 9, 10, 11, 12, 13, 14, 15];%[general_path, 'aibehavphys_NoMask1kHz_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[128, 154, 158];...%[aibehavphys_NoMask1kHz_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHz_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 15'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 91
		% October 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct_15_2014_1012';
		Electrodes = {[1, 3, 4, 5, 9, 10, 11, 12, 13, 14, 15];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[80, 85];...%[aibehavphys_Unmod1m5_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 15'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 92
		% October 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct_15_2014_1012';
		Electrodes = {[2, 3, 4, 9, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Unmod1p0_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[9, 30, 40, 45, 73, 89, 101:105, 107, 109, 113, 115, 119, 124, 128, 156, 157];...%[aibehavphys_Unmod1p0_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 15'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 93
		% October 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct_15_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1p5_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[115, 169, 210, 233, 241, 245];...%[aibehavphys_Unmod1p5_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct152014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 15'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 94
		% October 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct1_2014_1012';
		Electrodes = {[4, 5, 6, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Oct22014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[8:9, 11, 60, 63, 80, 142, 232, 236, 267, 270, 280, 287, 292, 294:296, 298:299, 309, ...
			315:321, 323, 382, 422:423, 425, 431:434, 440, 447:448];...%[aibehavphys_Audiometry_Passive_1012_Oct22014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Oct22014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 1'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 95
		% October 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct1_2014_1012';
		Electrodes = {[4, 5, 6, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[132];...%[aibehavphys_Mod3p5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 1'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 96
		% October 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct1_2014_1012';
		Electrodes = {[4, 5, 6, 10, 11, 12, 14];%[general_path, 'aibehavphys_Mod4p5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3:9, 110, 111, 136, 138, 142:145, 150, 214, 280, 282, 283, 291];...%[aibehavphys_Mod4p5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod4p5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 1'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 97
		% October 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct1_2014_1012';
		Electrodes = {[4, 5, 6, 10, 11, 12];%[general_path, 'aibehavphys_Mod5p5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[26:27, 30:32, 33:37, 40:41, 60, 65, 86];...%[aibehavphys_Mod5p5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod5p5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 1'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 98
		% October 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct1_2014_1012';
		Electrodes = {[4, 5, 6, 10, 11, 12, 14];%[general_path, 'aibehavphys_NoMask1kHz_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys_NoMask1kHz_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHz_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 1'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 99
		% October 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct1_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 5:6, 8, 29, 30, 46, 54, 92, 95, 99, 101, 103, 108, 111, 129, 136];...%[aibehavphys_Unmod1m5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 1'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 100
		% October 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct1_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 10, 11, 12, 14];%[general_path, 'aibehavphys_Unmod1p0_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys_Unmod1p0_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 1'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 101
		% October 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct1_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 10, 11, 12, 14];%[general_path, 'aibehavphys_Unmod1p5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[30, 35, 43:44, 51, 57, 59, 72:75, 79:81, 85];...%[aibehavphys_Unmod1p5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 1'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 102
		% October 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct1_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14];%[general_path, 'aiMixbehavphys_Mix_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[49, 54, 59, 60, 132, 135, 149:155, 200, 215:216, 219, 223, 227, 316, 352, 402, 415, 457, 459, 460, 463, 472];...%[aiMixbehavphys_Mix_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Mix_Passive_1012_Oct12014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 1'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 103
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep26_2014_1012';
		Electrodes = {[5, 6, 7, 10, 11, 12, 14, 15];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[10:11, 14:15, 18, 21, 78, 109, 194, 339, 361, 379, 386, 402, 437, 442, 446:447, 454, 456:457, 469:470];...%[aibehavphys_Audiometry_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 26'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 104
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep26_2014_1012';
		Electrodes = {[1, 3, 4, 5, 6, 10, 11, 14, 15];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[65, 68, 86, 91, 93, 94, 107:108, 110, 123, 125, 136, 139, 141, 145, 146, 165, ...
			187:188, 191, 194, 202, 204, 210, 213, 215, 248, 250, 262, 268, 278, 309, 313, 315:316, 414:415];...%[aibehavphys_Mod3p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 26'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 105
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep26_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 10, 11, 14, 15];%[general_path, 'aibehavphys_Mod5p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[42, 52, 55, 57, 60, 72, 76, 79:80, 82, 91:93, 100:103, 106:109, 112, 142];...%[aibehavphys_Mod5p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod5p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 26'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 106
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep26_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 11, 12, 14, 15];%[general_path, 'aibehavphys_NoMask1kHzp5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[11, 16, 25:26, 29, 44, 86, 155];...%[aibehavphys_NoMask1kHzp5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHzp5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 26'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 107
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep26_2014_1012';
		Electrodes = {[1, 3, 4, 5, 6, 10, 11, 12, 13, 14, 15];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[8, 12, 17, 25, 28, 31, 85:87, 92, 127, 147:148, 150, 152, 154:155, 159, 213];...%[aibehavphys_Unmod1m5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 26'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 108
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep26_2014_1012';
		Electrodes = {[1, 4, 5, 6, 7, 10, 11, 14];%[general_path, 'aibehavphys_Unmod1p0_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[13, 15, 23, 48, 52:54, 58:60, 70:73];...%[aibehavphys_Unmod1p0_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 26'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 109
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep26_2014_1012';
		Electrodes = {[1, 3, 4, 5, 6, 7, 11, 14, 15];%[general_path, 'aibehavphys_Unmod1p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 50, 100];...%[aibehavphys_Unmod1p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 26'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 110
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep26_2014_1012';
		Electrodes = {[1, 4, 5, 6, 7, 9, 11, 14, 15];%[general_path, 'aibehavphys_Unmod2p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[160];...%[aibehavphys_Unmod2p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod2p5_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 26'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 111
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep26_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 10, 11, 14, 15];%[general_path, 'aiMixbehavphys_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[35, 100, 107, 111, 116, 118, 121, 123, 130:139, 148, 159, ...
			163:165, 169:170, 173, 248:249, 273, 304, 411, 422:427, 436, 437, 472:473, ...
			475:476, 479, 481, 483:484, 489, 491:492, 505, 510, 536, 542, 545:556, 600, 603, 611:612, 646:647, 654:656, 662, 710, 711];...%[aiMixbehavphys_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Sep262014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 26'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 112
		% September 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep29_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 10, 11, 14, 15];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2:3, 5:12, 20:21, 56, 108, 144:145, 173, 181, 202:204, 335, ...
			394, 412, 417, 420, 462, 465, 467:468, 471:474, 479, 484, 488, 490:491, 497, 520, 527, 536, 556, 586:587, 590, 598];...%[aibehavphys_Audiometry_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 29'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 113
		% September 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep29_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 9, 11, 13, 14, 16];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2:3, 5:12, 20:21, 56, 108, 144:145, 173, 181, 202:204, 335, 384, 412, 417, 420, 462, 465, ...
			467:468, 471:474, 479, 484, 488, 490:491, 497, 520, 527, 536, 556, 586:587, 590, 598];...%[aibehavphys_Audiometry_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 29'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 114
		% September 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep29_2014_1012';
		Electrodes = {[2, 4, 5, 6, 9, 11, 13, 14, 16];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[6, 11, 22, 28:30, 34, 36, 37, 39, 44:48, 53, 77, 79, 83, 95:100];...%[aibehavphys_Mod3p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 29'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 115
		% September 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep29_2014_1012';
		Electrodes = {[2, 4, 5, 6, 9, 11, 13, 14, 16];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[6, 11, 22, 28:30, 34, 36, 37, 39, 44:48, 53, 77, 79, 83, 95:100];...%[aibehavphys_Mod3p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 29'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 116
		% September 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep29_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 9, 11, 13, 14, 16];%[general_path, 'aibehavphys_Mod5p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 4, 7, 23, 30:35, 39:42, 44, 47, 54, 57, 60, 71, 72, 94, 120, 122, 132:133, 140, 147, 151, 153];...%[aibehavphys_Mod5p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod5p5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 29'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 117
		% September 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep29_2014_1012';
		Electrodes = {[4, 5, 6, 7, 9, 11, 13, 14, 16];%[general_path, 'aibehavphys_NoMask1kHz_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3:6, 12, 22, 24, 29:30, 32, 33, 37, 39, 41];...%[aibehavphys_NoMask1kHz_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHz_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 29'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 118
		% September 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep29_2014_1012';
		Electrodes = {[4, 5, 6, 7, 9, 11, 13, 14, 16];%[general_path, 'aibehavphys_NoMask1kHz_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3:6, 12, 22, 24, 29:30, 32, 33, 37, 39, 41];...%[aibehavphys_NoMask1kHz_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHz_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 29'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 119
		% September 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep29_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 9, 11, 12, 13, 14, 16];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[12, 14, 16, 43, 57, 62:64, 67:68, 71:72, 78, 81:83, 89, 92, 97, 99, 103, 108:112, 116, 118, 137];...%[aibehavphys_Unmod1m5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 29'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 120
		% September 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep29_2014_1012';
		Electrodes = {[2, 4 5, 6, 7, 9, 11, 13, 14, 16];%[general_path, 'aibehavphys_Unmod1p0_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[5, 13:16, 22, 26, 29, 33, 36:38, 40, 42:44, 48, 50:51, 59, 73:74, 78:79, 83:84, 87, 89, 93, 103, 106, 122];...%[aibehavphys_Unmod1p0_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 29'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 121
		% September 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep29_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 9, 11, 13, 14, 16];%[general_path, 'aiMixbehavphys_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 11, 15, 17, 19, 25, 27, 30, 33, 35, 37, 40, 42, 45, 47, 50, 51:52, 56, 80, 114:121, 131, 142, 168, 190, ...
			192:194, 197, 200, 202, 204:205, 218, 220, 301, 339:344, 347, 350, 355:356, 358, 360:361, 469:471, 476, 478, 484];...%[aiMixbehavphys_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Sep292014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 29'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 122
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct17_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5,6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Mod3m10_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 30, 41, 47, 56:57, 68:70, 75, 84:85, 100:102, 118, 120:121, 130:131, 143, 145, 153:155, ...
			164, 176, 186, 192, 197, 201, 2016, 222, 244, 259, 277];...%[aibehavphys_Mod3m10_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3m10_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 17'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 123
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct17_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5,6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Mod3m10_Passive_1012_Oct172014_RightM7_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 56, 65, 113, 118, 134:135, 161, 195, 203, 213, 226:227, 240, 242, 266:270, 285:286, 291, 306, 331, 347, 354, 362, 364, 373, ...
			390:393, 400, 412, 417, 426:427, 431, 441:442, 469:472, 502, 506, 508:511, 521];...%[aibehavphys_Mod3m10_Passive_1012_Oct172014_RightM7_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3m10_Passive_1012_Oct172014_RightM7_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 17'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 124
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct17_2014_1012';
		Electrodes = {[3, 4, 5, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_NoMask1kHz_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[60, 61, 64, 80:82, 152, 154:156, 320:321];...%[aibehavphys_NoMask1kHz_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHz_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 17'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 125
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct17_2014_1012';
		Electrodes = {[1, 5, 6, 7, 9, 1, 12, 13, 14];%[general_path, 'aibehavphys_NoMask1kHz_Passive_1012_Oct172014_RightM7_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[5:6, 17, 22, 24:25, 28:38, 41, 44:47, 63, 75:77, 85, 90:91, 94, 104:105, 107:108, 118, 121, 133, 141:142, 144, 146:147, 158, 171, 173, ...
			179:180, 182:183, 202:205, 208, 217, 224:225, 229, 232:233, 235, 251, 279, 287, 289, 293, 303];...%[aibehavphys_NoMask1kHz_Passive_1012_Oct172014_RightM7_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHz_Passive_1012_Oct172014_RightM7_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 17'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 126
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct17_2014_1012';
		Electrodes = {[1, 4, 5, 6, 7, 9, 11];%[general_path, 'aibehavphys_Unmod1m20_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 6, 20, 28, 33, 55:63, 70, 75:76, 96, 101, 104, 106, 108, 118, 150, 159, 162, 163, 165, 179, 204, 206:215, 223:232, 246];...%[aibehavphys_Unmod1m20_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m20_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 17'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 127
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct17_2014_1012';
		Electrodes = {[1, 7, 11, 12];%[general_path, 'aibehavphys_Unmod1m30_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[10, 20, 22, 26, 29, 46, 56, 57, 59, 62, 65, 151, 152, 180, 182:183, 222:223, 226:227, 231, 234:237, 243];...%[aibehavphys_Unmod1m30_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m30_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 17'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 128
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct17_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 7];%[general_path, 'aibehavphys_Unmod1m40_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[5, 8, 13, 22, 24, 39, 47:48, 53, 56, 60, 67:68, 75, 82:85, 91, 94, 102, 110:111, 124, 127, 134:136, 157, ...
			159, 181, 199:200, 220:221];...%[aibehavphys_Unmod1m40_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m40_Passive_1012_Oct172014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 17'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 129
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct24_2014_1012';
		Electrodes = {[2, 3, 4, 11, 13, 14, 15];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[75, 86, 103, 108, 125, 130, 137, 142, 151, 154, 156, 160:178, 182, 311:312, 332:333, 340, 344, 349:354, 361, 365, 369, 385, 390:391, ...
			402:407, 424, 427:430, 435:438, 462, 468, 483, 483, 500, 514:519, 525, 531, 536, 539, 562, 565, 605];...%[aibehavphys_Audiometry_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 24'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 130
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct24_2014_1012';
		Electrodes = {[1, 2, 3, 4, 9, 10, 11, 13, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1m20_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[28, 33, 35, 56, 60, 68:70, 76, 80, 85, 87, 111, 125, 128:129, 139:140, 150:152, 155, 166, 167, 171:172, 183:186, 215, ...
			222, 224, 243];...%[aibehavphys_Unmod1m20_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m20_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 24'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 131
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct24_2014_1012';
		Electrodes = {[2, 3, 4, 6, 9, 10, 11, 13, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1m30_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys_Unmod1m30_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m30_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 24'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 132
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct24_2014_1012';
		Electrodes = {[2, 3, 4, 9, 10, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1m40_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 7];...%[aibehavphys_Unmod1m40_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m40_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 24'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 133
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct24_2014_1012';
		Electrodes = {[2, 3, 4, 9, 10, 14, 15, 16];%[general_path, 'aiMixbehavphys_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[21, 41, 46, 52:53, 57, 75, 81, 83:84, 88:94, 98, 116, 119, 121:123, 130, 143, 147, 164, 169, 174, ...
			193:200, 206, 214:217, 237, 245, 238, 349, 359, 361, 375, 379, 382, 385];...%[aiMixbehavphys_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Oct242014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 24'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 134
		% October 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct27_2014_1012';
		Electrodes = {[2, 3, 6, 9, 10, 13, 16];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[113, 117, 122, 124:127, 129, 148:154, 177:179, 191, 199, 339, 362, 366, 388:390, 393, 414, ...
			425, 428, 436:437, 444];...%[aibehavphys_Audiometry_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 27'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 135
		% October 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct27_2014_1012';
		Electrodes = {[2, 3, 6, 7, 9, 10, 15, 16];%[general_path, 'aibehavphys_Mod3m20_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[35:36];...%[aibehavphys_Mod3m20_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3m20_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 27'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 136
		% October 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct27_2014_1012';
		Electrodes = {[2, 3, 6, 9, 10, 16];%[general_path, 'aibehavphys_Unmod1m20_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[26:27, 30:33, 42, 45, 47, 63:64, 70, 77, 92:96, 99:108, 112:113, 129:131, 135, 140, 142];...%[aibehavphys_Unmod1m20_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m20_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 27'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 137
		% October 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct27_2014_1012';
		Electrodes = {[1, 2, 3, 9, 10, 11, 16];%[general_path, 'aibehavphys_Unmod1m30_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[5, 9, 31, 34, 47:48, 52, 55, 59:60, 92, 103, 117:123, 127, 135, 138, 140, 142:145, 149];...%[aibehavphys_Unmod1m30_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m30_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 27'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 138
		% October 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct27_2014_1012';
		Electrodes = {[2, 3, 6, 9, 10, 16];%[general_path, 'aibehavphys_Unmod1m40_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[7, 8, 27:28, 33, 46, 55:56, 74:75, 79, 85, 89, 91, 107, 115, 120, 122, 131, 139, 143];...%[aibehavphys_Unmod1m40_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m40_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 27'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 139
		% October 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightM7\Oct27_2014_1012';
		Electrodes = {[2, 3, 6, 9, 10, 16];%[general_path, 'aiMixbehavphys_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 4, 8, 17, 24, 26, 33:36, 49, 63, 66, 68, 74:82, 86, 104, 105, 123, 129:130, 134:135, 138, 142, 145, 154, 175, 179:180, 183:185, 188, ...
			191, 193, 195, 200, 211, 221, 235, 246, 250:255, 257, 292, 303:306, 313, 339, 358, 377:378, 396, 438, 448];...%[aiMixbehavphys_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Oct272014_RightM7_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 27'};
		ANIMAL = {'RightM7'};
		MaskNr =  [];

	case 140
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct3_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[5, 11:12, 14, 20:21, 24:26, 87, 79, 90:92, 104, 109, 116, 120, 298, 301, 318:319, 340, 345:347, 350, 403:404, 416:417, 422, 423, 430];...%[aibehavphys_Audiometry_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 3'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 141
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct3_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Oct32014_LeftF8_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[51, 59, 61, 69];...%[aibehavphys_Audiometry_Passive_1012_Oct32014_LeftF8_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Oct32014_LeftF8_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 3'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 142
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct3_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Oct32014_LeftF8_p3_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 2, 7, 78:80, 82, 88:89, 165:169, 234:236, 260, 266:267, 275, 287:288, 300, 318, 319, 346, 357, 373, 374, 381, 448, 455, 459, 484, 488, 495, 519:523, 530, 538, 549, 559, 568, 573:574, 623, 623, 628:631, 640:641, 643, 644:645, 648, 651, 671, 675, 697, 706, 709, 711];...%[aibehavphys_Audiometry_Passive_1012_Oct32014_LeftF8_p3_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Oct32014_LeftF8_p3_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 3'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 143
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct3_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[37:38, 41, 48:49, 84:87, 126, 138:148, 150:152, 174:175, 195, 199:201, 203:204, 211:212, 216, 218:221, 223:228];...%[aibehavphys_Mod3p5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 3'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 144
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct3_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Oct32014_LeftF8_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3, 29, 119, 128, 149, 161];...%[aibehavphys_Mod3p5_Passive_1012_Oct32014_LeftF8_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Oct32014_LeftF8_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 3'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 145
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct3_2014_1012';
		Electrodes = {[1, 2, 4, 6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Mod5p5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3:5, 54];...%[aibehavphys_Mod5p5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod5p5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 3'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 146
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct3_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 16];%[general_path, 'aibehavphys_NoMask1kHz_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[113, 121];...%[aibehavphys_NoMask1kHz_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHz_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 3'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 147
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct3_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 13];%[general_path, 'aibehavphys_Unmod1m0_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 5:7, 26, 33, 48, 68, 70, 142, 191:194];...%[aibehavphys_Unmod1m0_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m0_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 3'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 148
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct3_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 24, 29, 44:46, 56:57, 76, 81, 110, 131, 145:148, 164:165, 171, 173:176, 185, 187:190, 196, 198, 199, 222:223, 228, 230:234, 240, 256, 267:269, 274:277, 279, 282];...%[aibehavphys_Unmod1m5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 3'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 149
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct3_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Mod4p5_Passive_1012_Oct32014_LeftF8_p1._extracted.hd5'];...
			 };

		ExcludeTrial =  {[199];...%[aibehavphys_Mod4p5_Passive_1012_Oct32014_LeftF8_p1._extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod4p5_Passive_1012_Oct32014_LeftF8_p1._extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 3'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 150
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct3_2014_1012';
		Electrodes = {[1, 2, 3, 6, 7, 9, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Unmod1p5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[7, 23, 52, 53, 56, 62, 68, 73, 75:77, 83:87, 93, 97, 100, 101, 109, 111, 112, 120, 123, 125:127, 134, 136:139, 141, 150:153, 156, 163, 171:172, 175, 177:179, 183, 188, 190, 192:194, 196, 198, 215, 292];...%[aibehavphys_Unmod1p5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 3'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 151
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct3_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 7, 9, 10, 11, 12];%[general_path, 'aiMixbehavphys_Mix_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[67, 110, 123, 176, 178, 197:199, 202:203, 205, 205:210, 219:221, 224, 250:251];...%[aiMixbehavphys_Mix_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Mix_Passive_1012_Oct32014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 3'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 152
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct3_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 16];%[general_path, 'aiMixbehavphys_Mixbehavphys_Mix_Passive_1012_Oct32014_LeftF8_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[8, 10, 13:14, 15, 17, 23, 28, 31:34, 47:49, 52:54, 67, 74:76, 84:87, 90:92, 94, 96, 97, 99, 102, 103, 123, 140, 157, 213:215, 217, 222, 246, 248, 250, 254];...%[aiMixbehavphys_Mixbehavphys_Mix_Passive_1012_Oct32014_LeftF8_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Mixbehavphys_Mix_Passive_1012_Oct32014_LeftF8_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 3'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 153
		% October 6
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct6_1012_2014';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 14, 16];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Oct62014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[23, 204, 210:211, 225, 249, 260, 281, 283, 285, 357, 497, 578, 580, 581, 602, 603, 625, 713];...%[aibehavphys_Audiometry_Passive_1012_Oct62014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Oct62014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 6'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 154
		% October 6
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct6_1012_2014';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 14, 16];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Oct62014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[22, 23, 59, 67, 171:174, 197:198, 202, 213:214, 244, 286];...%[aibehavphys_Unmod1m5_Passive_1012_Oct62014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Oct62014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 6'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 155
		% October 6
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct6_1012_2014';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 11, 12, 13, 14, 16];%[general_path, 'aibehavphys_Unmod1p0_Passive_1012_Oct62014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[50, 60, 65, 67, 71, 92:95, 109:111, 116:118, 121:124, 131:132, 211, 216];...%[aibehavphys_Unmod1p0_Passive_1012_Oct62014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Oct62014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 6'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 156
		% October 6
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct6_1012_2014';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1p5_Passive_1012_Oct62014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3, 7:10, 18, 22, 24:25, 30, 41, 42, 55, 59];...%[aibehavphys_Unmod1p5_Passive_1012_Oct62014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct62014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 6'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 157
		% October 6
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct6_1012_2014';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1p5_Passive_1012_Oct62014_LeftF8_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[7, 26, 28, 29, 31, 38, 39, 45, 47, 48, 53, 54, 59, 66:68, 84, 92:93, 105:106, 113, 116:118, 120:123, 125, 137, 145:146, 150, 160, 165, 167, 172, 174, 186, 193, 200, 201, 203, 207:208, 227];...%[aibehavphys_Unmod1p5_Passive_1012_Oct62014_LeftF8_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct62014_LeftF8_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 6'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 158
		% October 6
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct6_1012_2014';
		Electrodes = {[3, 4, 5, 6, 7, 13, 14, 15, 16];%[general_path, 'aiMixbehavphys_Mixbehavphys_Mix_Passive_1012_Oct62014_LeftF8_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[17, 31, 33, 37, 41, 52, 54, 85:87, 149, 151, 157:158, 161, 229:235, 242, 250, 251, 264, 342, 343, 376:387];...%[aiMixbehavphys_Mixbehavphys_Mix_Passive_1012_Oct62014_LeftF8_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Mixbehavphys_Mix_Passive_1012_Oct62014_LeftF8_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 6'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 159
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct8_2014_1012';
		Electrodes = {[1, 3, 5, 6, 11, 12, 13, 14, 16];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[97, 108, 144, 380, 385, 486, 526, 583];...%[aibehavphys_Audiometry_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 8'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 160
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct8_2014_1012';
		Electrodes = {[1, 3, 5, 6, 9, 11, 12, 13, 14, 16];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[294, 369, 403, 472:473];...%[aibehavphys_Mod3p5_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 8'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 161
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct8_2014_1012';
		Electrodes = {[1, 3, 5, 6, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Mod4p5_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[136, 185:186];...%[aibehavphys_Mod4p5_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod4p5_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 8'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 162
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct8_2014_1012';
		Electrodes = {[1, 3, 4, 5, 6, 7, 9, 11, 12, 13, 14, 16];%[general_path, 'aibehavphys_NoMask1kHz_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[132, 154, 161, 162, 238];...%[aibehavphys_NoMask1kHz_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHz_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 8'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 163
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct8_2014_1012';
		Electrodes = {[1, 3, 5, 6, 7, 9, 10, 11, 12, 13, 14, 16];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[107, 133];...%[aibehavphys_Unmod1m5_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 8'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 164
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct8_2014_1012';
		Electrodes = {[1, 3, 5, 6, 7, 9, 10, 11, 12, 13, 14, 16];%[general_path, 'aibehavphys_Unmod1p0_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys_Unmod1p0_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 8'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 165
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct8_2014_1012';
		Electrodes = {[1, 3, 5, 6, 7, 9, 10, 11, 12, 13, 14, 16];%[general_path, 'aibehavphys_Unmod1p5_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[122, 168];...%[aibehavphys_Unmod1p5_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 8'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 166
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct8_2014_1012';
		Electrodes = {[1, 3, 5, 6, 7, 9, 10, 11, 12, 13, 14, 16];%[general_path, 'aiMixbehavphys_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[83, 179, 284];...%[aiMixbehavphys_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Oct82014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 8'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 167
		% October 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct10_2014_1012';
		Electrodes = {[1, 3, 5, 6, 7, 9, 10, 11, 12, 13, 14, 16];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[68, 127, 554, 555];...%[aibehavphys_Audiometry_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 10'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 168
		% October 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct10_2014_1012';
		Electrodes = {[3, 5, 6, 9, 10, 11, 12, 13, 14, 15];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[49];...%[aibehavphys_Mod3p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 10'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 169
		% October 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct10_2014_1012';
		Electrodes = {[3, 5, 6, 9, 10, 11, 12, 13, 14, 15];%[general_path, 'aibehavphys_Mod4p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys_Mod4p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod4p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 10'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 170
		% October 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct10_2014_1012';
		Electrodes = {[3, 5, 6, 9, 10, 11, 12, 13, 14, 15];%[general_path, 'aibehavphys_NoMask1kHz_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys_NoMask1kHz_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHz_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 10'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 171
		% October 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct10_2014_1012';
		Electrodes = {[1, 3, 5, 6, 9, 11, 12, 13, 14, 15];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys_Unmod1m5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 10'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 172
		% October 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct10_2014_1012';
		Electrodes = {[1, 3, 5, 6, 9, 10, 11, 12, 13, 14, 15];%[general_path, 'aibehavphys_Unmod1p0_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[7, 9:10, 26, 29, 104, 162];...%[aibehavphys_Unmod1p0_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 10'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 173
		% October 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct10_2014_1012';
		Electrodes = {[1, 5, 6, 9, 11, 12, 13, 14, 15];%[general_path, 'aibehavphys_Unmod1p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[57, 85, 139];...%[aibehavphys_Unmod1p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 10'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 174
		% October 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct10_2014_1012';
		Electrodes = {[1, 3, 4, 5, 6, 9, 11, 12, 13, 14, 15];%[general_path, 'aiMixbehavphys_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[294, 296, 346, 386:397, 404, 406, 408, 410:415, 427:430];...%[aiMixbehavphys_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Oct102014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 10'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 175
		% October 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct20_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3, 39:40, 270, 374, 391, 395, 439, 443, 445, 451, 459, 464, 468, 469, 472, 478, 496, 500];...%[aibehavphys_Audiometry_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 20'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 176
		% October 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct20_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 9, 10, 11, 12];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[5, 8, 50:55, 66, 68, 80, 97:98, 105, 108:109, 111, 113, 138, 155, 188:190, 196:197, 206, 221, 253, 258, 285, 291];...%[aibehavphys_Mod3p5_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 20'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 177
		% October 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct20_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys_NoMask1kHz_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[139, 232, 251, 346];...%[aibehavphys_NoMask1kHz_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHz_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 20'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 178
		% October 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct20_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[119, 122, 196, 204, 216];...%[aibehavphys_Unmod1m5_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 20'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 179
		% October 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct20_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aiMixbehavphys_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1:4, 6, 7, 9:10, 13, 15, 18:22, 24, 25, 27, 31, 33, 35:37, 39, 42:43, 46:48, 50, 52, 62, 64, 74, 101, 105, 141, 148, 158, 176, 190:197, 208, 218:223, 232, 237, 242, 248:249, 270:271, 287, 314:316, 367];...%[aiMixbehavphys_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Oct202014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 20'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 180
		% October 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[24, 39, 146, 197, 200, 254, 302:303, 309, 313, 316, 326, 329:338, 351, 356, 364, 545, 564];...%[aibehavphys_Audiometry_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 181
		% October 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[51:52, 56:57, 60, 205, 277, 337, 362];...%[aibehavphys_Mod3p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 182
		% October 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 14, 16];%[general_path, 'aibehavphys_Mod4p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[22, 60, 62, 71, 100, 135, 140, 180, 182, 223, 228, 307, 318, 338, 341:342, 369, 376, 378, 380, 398:400];...%[aibehavphys_Mod4p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod4p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 183
		% October 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys_NoMask_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[39, 64:65, 106, 108:110, 113, 125, 127, 135, 139, 140, 142, 151, 200, 224, 308:309];...%[aibehavphys_NoMask_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 184
		% October 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 2, 9, 37:39, 63, 91:92, 109, 117:123, 132:133, 138, 140, 145, 149, 188:189, 206, 210, 215, 216, 218, 227, 235, 237:272, 284];...%[aibehavphys_Unmod1m5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 185
		% October 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys_Unmod1p0_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1:8, 10, 13:15, 18, 21:22, 24, 31, 34, 35, 42, 44, 93:97, 102:104, 113, 118, 123, 127, 129, 131, 134:153, 158, 159:164, 166, 171, 176:182, 187, 193, 205:254, 256, 261, 265, 269:271, 273, 276:334, 337, 346, 349:350, 352:375, 386:389];...%[aibehavphys_Unmod1p0_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 186
		% October 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys_Unmod1p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[39, 76, 128, 139, 168, 194, 198:199];...%[aibehavphys_Unmod1p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 187
		% October 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 14];%[general_path, 'aiMixbehavphys_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[11, 37:41, 45, 48:50, 53, 55, 57, 62:63, 75, 78, 106, 109, 115, 127, 145:148, 151, 170, 175, 178:179, 183, 190, 192, 195, 197, 200, 201, 206, 214, 220, 225, 230, 235, 244, 255, 270:273, 278, 298, 302:315, 318:329, 335:347, 388, 412, 417, 422, 428, 431, 463, 481, 496:497, 510, 515, 518, 525];...%[aiMixbehavphys_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 188
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct24_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Oct242014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[35, 36, 70, 77, 82, 85, 104:105, 109, 134, 190, 206:207, 211, 226, 232, 289, 298, 306, 310, 313, 346, 355, 358, 360, 448, 494, 495, 501, 505, 516, 520:521, 552, 636, 677, 678, 683, 697, 702, 708:709];...%[aibehavphys_Audiometry_Passive_1012_Oct242014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Oct242014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 189
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct24_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 5, 45, 77, 84, 85, 119, 220, 224, 225, 228, 235, 250, 255:256, 340:358];...%[aibehavphys_Mod3p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 190
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct24_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[54, 71, 158, 170, 265:268, 279];...%[aibehavphys_Unmod1m5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 191
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct24_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 9, 10, 11, 12];%[general_path, 'aibehavphys_Unmod1p0_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[15, 69, 93, 123];...%[aibehavphys_Unmod1p0_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 192
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct24_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 9, 10, 11];%[general_path, 'aibehavphys_Unmod1p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[15, 45, 83, 108, 119:120, 127, 139, 148, 154, 166, 169, 175, 181, 185, 187, 188, 192, 203, 207, 213, 224, 225:226, 229, 231, 233, 235, 236:241, 250, 252, 254, 261, 282:284, 297, 302, 306:307, 317, 335, 343, 347, 353:354, 366, 368, 377, 378, 386, 390:392];...%[aibehavphys_Unmod1p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p5_Passive_1012_Oct222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 193
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct24_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 13];%[general_path, 'aiMixbehavphys_Passive_1012_Oct242014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[10, 14, 30, 47:48, 50, 75, 104, 147, 167, 177, 248:250, 254, 256, 268, 280, 286, 325:328];...%[aiMixbehavphys_Passive_1012_Oct242014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Oct242014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 194
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Oct24_2014_1012';
		Electrodes = {[1, 2, 3, 5, 6, 7, 9, 10, 11, 12, 13, 14];%[general_path, 'aiMixbehavphys_Passive_1012_Oct242014_LeftF8_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[31, 32];...%[aiMixbehavphys_Passive_1012_Oct242014_LeftF8_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Oct242014_LeftF8_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Oct 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 195
		% September 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 10, 11, 12, 15];%[general_path, 'aibehavphys__Mod2p5_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys__Mod2p5_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys__Mod2p5_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 196
		% September 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 10, 11, 12, 15];%[general_path, 'aibehavphys__Mod3p5_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 4, 15, 44:47, 94];...%[aibehavphys__Mod3p5_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys__Mod3p5_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 197
		% September 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 6, 9, 10, 11, 12, 15];%[general_path, 'aibehavphys__Mod4p5_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[64, 82, 97, 104, 105];...%[aibehavphys__Mod4p5_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys__Mod4p5_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 198
		% September 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep22_2014_1012';
		Electrodes = {[1, 2, 4, 6, 9, 10, 11, 12, 15];%[general_path, 'aibehavphys__Mod4p5_Passive_1012_Sep222014_LeftF8_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 37, 41, 45];...%[aibehavphys__Mod4p5_Passive_1012_Sep222014_LeftF8_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys__Mod4p5_Passive_1012_Sep222014_LeftF8_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 199
		% September 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep22_2014_1012';
		Electrodes = {[1, 2, 4, 9, 10, 11, 12, 15];%[general_path, 'aibehavphys__Mod5p5_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[30, 44, 58, 71, 81, 82, 85, 105, 111, 114, 128:129, 131:132, 139];...%[aibehavphys__Mod5p5_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys__Mod5p5_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 200
		% September 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep22_2014_1012';
		Electrodes = {[1, 2, 4, 6, 9, 10, 11, 12];%[general_path, 'aibehavphys_Audiometry_Passive_1012_Sep222014_LeftF8_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 4, 12, 23:24, 26:27, 32:33, 38, 40, 46, 49, 54, 56, 71, 73, 75, 81, 84, 96, 98, 100, 103, 105, 107, 119, 121, 133, 137, 163, 218, 235, 255:261, 263:266, 284:286, 292:295, 298:299, 301, 307:308, 310, 315, 335, 345, 348, 361:363, 373:375, 378, 383:384, 389, 393:395];...%[aibehavphys_Audiometry_Passive_1012_Sep222014_LeftF8_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Audiometry_Passive_1012_Sep222014_LeftF8_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 201
		% September 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 15, 16];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Sep222014_LeftF8_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3, 7, 8, 18, 24, 26, 28:29, 32, 45, 47:49, 51, 54:56, 64, 69:71, 75, 76, 81, 84, 88, 90:93, 101, 108:111, 114, 117, 119, 124, 136, 139, 143:144, 146:177];...%[aibehavphys_Unmod1m5_Passive_1012_Sep222014_LeftF8_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep222014_LeftF8_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 202
		% September 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 9, 10, 11, 12];%[general_path, 'aibehavphys_Unmod1p0_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[13, 17, 24, 28:31, 33, 38, 77, 80, 82, 84:85, 109, 113, 115:116, 127, 131:133];...%[aibehavphys_Unmod1p0_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 203
		% September 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep22_2014_1012';
		Electrodes = {[1, 2, 4, 6, 9, 10, 11, 12, 14];%[general_path, 'aiMixbehavphys_Audiometry_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3, 52, 61:62, 66, 70, 72, 82, 93, 97, 99, 102, 109, 120:122, 133:135, 145, 161, 164, 178:179, 184:185, 188, 191, 195:196, 207, 210:218, 222:223, 229, 232, 233, 247, 254, 257, 259, 268:269, 276, 280, 291, 305:307, 316, 318, 327, 330:332, 341, 345];...%[aiMixbehavphys_Audiometry_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Audiometry_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 204
		% September 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 9, 10, 11, 12, 15];%[general_path, 'aiMixbehavphys_Mix_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[14, 15, 22, 39, 42, 48, 52, 56, 59, 62, 63, 65, 71, 92, 98, 99, 106:107, 117, 119:121, 124, 129, 130, 134, 138, 149, 187, 189, 251, 254, 262, 263, 270, 273, 278, 284, 308, 313, 339, 342, 349, 351, 354, 356, 358, 371, 375, 377:378, 384, 387:389, 391, 393, 395, 401:402, 417, 419:420, 443];...%[aiMixbehavphys_Mix_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Mix_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 205
		% September 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep22_2014_1012';
		Electrodes = {[1, 2, 3, 4, 9, 10, 11, 12, 15];%[general_path, 'aiMixbehavphys_Mix_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[14, 15, 22, 39, 42, 48, 52, 56, 59, 62, 63, 65, 71, 92, 98, 99, 106:107, 117, 119:121, 124, 129, 130, 134, 138, 149, 187, 189, 251, 254, 262, 263, 270, 273, 278, 284, 308, 313, 339, 342, 349, 351, 354, 356, 358, 371, 375, 377:378, 384, 387:389, 391, 393, 395, 401:402, 417, 419:420, 443];...%[aiMixbehavphys_Mix_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Mix_Passive_1012_Sep222014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 22'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 206
		% September 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep23_2014_1012';
		Electrodes = {[1, 2, 4, 9, 10, 11, 12, 14, 16];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[86, 102:103, 111:114, 122:125, 127, 139:142, 167];...%[aibehavphys_Mod3p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 23'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 207
		% September 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep23_2014_1012';
		Electrodes = {[1, 2, 4, 9, 10, 11, 12, 14, 16];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Sep232014_LeftF8_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[36:38, 47, 49];...%[aibehavphys_Mod3p5_Passive_1012_Sep232014_LeftF8_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Sep232014_LeftF8_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 23'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 208
		% September 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep23_2014_1012';
		Electrodes = {[1, 2, 4, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys_Mod4p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[86:87, 90, 162];...%[aibehavphys_Mod4p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod4p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 23'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 209
		% September 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep23_2014_1012';
		Electrodes = {[1, 2, 4, 5, 9, 10, 11, 12, 14, 16];%[general_path, 'aibehavphys_Mod5p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[9, 11, 21:25, 29, 39:40, 52, 104];...%[aibehavphys_Mod5p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod5p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 23'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 210
		% September 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep23_2014_1012';
		Electrodes = {[1, 2, 4, 9, 10, 11, 12, 14, 16];%[general_path, 'aibehavphys_NoMask1kHzp5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[7, 98, 111, 123:124, 132];...%[aibehavphys_NoMask1kHzp5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHzp5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 23'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 211
		% September 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep23_2014_1012';
		Electrodes = {[1, 2, 4, 9, 10, 11, 12, 16];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4, 6, 34:35, 43, 54, 68, 101];...%[aibehavphys_Unmod1m5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 23'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 212
		% September 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep23_2014_1012';
		Electrodes = {[1, 4, 9, 10, 11, 12];%[general_path, 'aibehavphys_Unmod1p0_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[9:11, 85:86, 94:95, 97, 102:104, 107:109, 117, 120:121, 140, 143:144];...%[aibehavphys_Unmod1p0_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 23'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 213
		% September 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep23_2014_1012';
		Electrodes = {[1, 2, 4, 9, 10, 11, 12, 14, 16];%[general_path, 'aibehavphys_Unmod1p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[61, 129:131];...%[aibehavphys_Unmod1p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 23'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 214
		% September 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep23_2014_1012';
		Electrodes = {[1, 2, 4, 9, 10, 11, 12, 14, 16];%[general_path, 'aibehavphys_Unmod2p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[71];...%[aibehavphys_Unmod2p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod2p5_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 23'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 215
		% September 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep23_2014_1012';
		Electrodes = {[1, 2, 4, 9, 10, 11, 12, 14, 16];%[general_path, 'aiMixbehavphys_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[7, 19, 26, 33:34, 38:42, 64, 68:71];...%[aiMixbehavphys_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Sep232014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 23'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 216
		% September 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep24_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 9, 10, 11, 14, 15, 16];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[38];...%[aibehavphys_Mod3p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 217
		% September 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep24_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 9, 10, 11, 14, 15, 16];%[general_path, 'aibehavphys_Mod4p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4, 15:16, 20, 23, 27, 29:30, 34, 38, 54, 57, 69:71, 74, 75, 82, 95:99, 102:104, 113:114, 117:118, 125:126, 133, 164, 180:182, 189];...%[aibehavphys_Mod4p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod4p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 218
		% September 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep24_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 9, 10, 11, 14, 15, 16];%[general_path, 'aibehavphys_Mod5p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys_Mod5p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod5p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 219
		% September 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep24_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 9, 10, 11, 14, 15, 16];%[general_path, 'aibehavphys_NoMask1kHzp5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys_NoMask1kHzp5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHzp5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 220
		% September 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep24_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 9, 10, 11, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1p0_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[11, 13:15, 22, 27, 32, 37, 39:40, 49:50, 53, 66:67, 92:94];...%[aibehavphys_Unmod1p0_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 221
		% September 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep24_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 9, 10, 11, 14, 15, 16];%[general_path, 'aibehavphys_Unmod2p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[11];...%[aibehavphys_Unmod2p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod2p5_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 222
		% September 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep24_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 9, 10, 11, 14, 15, 16];%[general_path, 'aiMixbehavphys_Audiometry_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[210, 324, 348, 359:360, 366, 369:371, 373, 382, 391, 394, 396, 402:403, 407, 410, 415:417, 421:422, 424, 431:434, 439, 441, 446:448, 453:459, 466:467, 472:477, 481, 483:484, 494:496, 500, 502, 505, 507, 523, 526, 529:530, 559, 561:570, 586:587, 697:698];...%[aiMixbehavphys_Audiometry_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Audiometry_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 223
		% September 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep24_2014_1012';
		Electrodes = {[1, 2, 4, 5, 6, 7, 9, 10, 11, 14, 15, 16];%[general_path, 'aiMixbehavphys_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[16, 157, 161, 168, 170, 172, 177:178, 180, 189, 191, 193, 194, 197, 199:201, 203:206, 208, 209, 212, 224:225, 227, 233, 240, 277, 316, 389:393, 397:398, 405, 412, 418, 456];...%[aiMixbehavphys_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Sep242014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 24'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 224
		% September 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep25_2014_1012';
		Electrodes = {[1, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Mod3p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[104, 128];...%[aibehavphys_Mod3p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod3p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 25'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 225
		% September 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep25_2014_1012';
		Electrodes = {[1, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Mod4p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[9:14, 60:70, 74, 77, 89:90, 97, 120];...%[aibehavphys_Mod4p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod4p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 25'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 226
		% September 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep25_2014_1012';
		Electrodes = {[1, 4, 5, 6, 10, 11, 13, 14, 15, 16];%[general_path, 'aibehavphys_Mod5p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[91, 96];...%[aibehavphys_Mod5p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Mod5p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 25'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 227
		% September 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep25_2014_1012';
		Electrodes = {[1, 4, 5, 6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_NoMask1kHzp5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[138, 141, 147, 148, 158];...%[aibehavphys_NoMask1kHzp5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_NoMask1kHzp5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 25'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 228
		% September 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep25_2014_1012';
		Electrodes = {[1, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1m5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[52, 54, 62:64, 66:68, 73, 75];...%[aibehavphys_Unmod1m5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1m5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 25'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 229
		% September 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep25_2014_1012';
		Electrodes = {[1, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1p0_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[38, 41, 52, 64, 68, 70, 72:73, 83, 85, 87:91, 139, 144, 146];...%[aibehavphys_Unmod1p0_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p0_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 25'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 230
		% September 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep25_2014_1012';
		Electrodes = {[1, 4, 5, 6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Unmod1p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[20:21, 31:32, 34, 36, 40, 41, 44:45];...%[aibehavphys_Unmod1p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod1p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 25'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 231
		% September 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep25_2014_1012';
		Electrodes = {[1, 2, 4, 5, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Unmod2p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[11, 12, 53];...%[aibehavphys_Unmod2p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Unmod2p5_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 25'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 232
		% September 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\LeftF8\Sep25_2014_1012';
		Electrodes = {[1, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aiMixbehavphys_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4, 37, 39, 41:42, 72, 140, 143, 153, 183, 189, 194, 199, 227];...%[aiMixbehavphys_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Sep252014_LeftF8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'Sept 25'};
		ANIMAL = {'LeftF8'};
		MaskNr =  [];

	case 233
		% May 7
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May7';
		Electrodes = {[1, 4, 5, 6, 7, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysUnmod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2:15, 19:24, 33:34, 44:47, 51:52, 55, 58, 65, 82, 92, 94:95, 100, 119, 133, 135, 139:140, 143, 145, 148, 150, 151, 153, 156, 162, 164, 167:168, 171:173, 177, 184, 188];...%[aibehavphysUnmod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 7'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 234
		% May 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May13';
		Electrodes = {[1, 2, 3, 4, 5, 13, 14, 15, 16];%[general_path, 'aibehavphys_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1:97, 99, 104:107, 109, 117:121, 124:133, 141:142, 150:158, 166, 170:171, 177:184, 192:198, 200:208, 218, 220, 223, 225:228, 230:234, 237:240, 244, 251, 255, 257:258, 266:270];...%[aibehavphys_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 13'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 235
		% May 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May15';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May15_TailF1_ModActive2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[6];...%[aibehavphys1012_May15_TailF1_ModActive2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May15_TailF1_ModActive2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 15'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 236
		% May 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May15';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May15_TailF1_ModActive3_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys1012_May15_TailF1_ModActive3_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May15_TailF1_ModActive3_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 15'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 237
		% May 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May15';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May15_TailF1_ModPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[10, 27, 41, 57, 140, 208:209];...%[aibehavphys1012_May15_TailF1_ModPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May15_TailF1_ModPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 15'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 238
		% May 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May15';
		Electrodes = {[1, 2, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May15_TailF1_UnmodPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[47, 58, 75, 78, 94, 159, 164];...%[aibehavphys1012_May15_TailF1_UnmodPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May15_TailF1_UnmodPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 15'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 239
		% May 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May16';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May16_TailF1_ModPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4, 41:42, 54, 59, 104, 111, 112, 123, 143, 171, 173, 174];...%[aibehavphys1012_May16_TailF1_ModPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May16_TailF1_ModPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 16'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 240
		% May 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May16';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May16_TailF1_ModPassive8kHz_extracted.hd5'];...
			 };

		ExcludeTrial =  {[19, 23, 31, 36, 43:49, 64, 78:79, 94];...%[aibehavphys1012_May16_TailF1_ModPassive8kHz_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May16_TailF1_ModPassive8kHz_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 16'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 241
		% May 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May16';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May16_TailF1_UnmodActive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2:3, 9, 11:15, 22, 25, 28, 34, 52, 45, 48, 57, 59, 61, 67, 71:74, 89];...%[aibehavphys1012_May16_TailF1_UnmodActive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May16_TailF1_UnmodActive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 16'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 242
		% May 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May16';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May16_TailF1_UnmodPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[27, 38, 41, 52:62, 64:66, 106, 114:116, 118, 119, 121];...%[aibehavphys1012_May16_TailF1_UnmodPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May16_TailF1_UnmodPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 16'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 243
		% May 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May20';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May20_TailF1_ModActivep1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3, 7, 12, 20];...%[aibehavphys1012_May20_TailF1_ModActivep1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May20_TailF1_ModActivep1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 20'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 244
		% May 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May20';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 12, 14];%[general_path, 'aibehavphys1012_May20_TailF1_ModActivep2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3, 4, 9, 11, 16, 18, 23, 27:29, 31, 33:36, 38, 39:44, 45, 47, 49, 52, 53, 55, 58, 62, 63, 66:70, 72:75, 77, 84, 85, 87, 89, 93, 97:98, 100, 102, 104, 106, 110, 124, 125, 126];...%[aibehavphys1012_May20_TailF1_ModActivep2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May20_TailF1_ModActivep2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 20'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 245
		% May 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May20';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May20_TailF1_ModPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[35, 158, 203];...%[aibehavphys1012_May20_TailF1_ModPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May20_TailF1_ModPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 20'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 246
		% May 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May20';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May20_TailF1_UnmodActive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2:6, 8, 9, 11, 16, 19:21, 24, 25, 27, 29];...%[aibehavphys1012_May20_TailF1_UnmodActive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May20_TailF1_UnmodActive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 20'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 247
		% May 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May20';
		Electrodes = {[1, 4, 6, 7, 12, 14];%[general_path, 'aibehavphys1012_May20_TailF1_UnmodPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[8, 27, 52];...%[aibehavphys1012_May20_TailF1_UnmodPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May20_TailF1_UnmodPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 20'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 248
		% May 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May21';
		Electrodes = {[1, 4, 5, 6, 9, 10, 11, 12, 13, 15, 16];%[general_path, 'aibehavphys1012_May21_TailF1_PureTonePassivep1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1:3, 6:8, 15:16, 20, 26:28, 41, 46, 48:51, 53, 54, 60:61, 69:74, 77:83, 101:102, 106, 129:131, 160, 161, 163, 164, 179, 182, 184, 187, 189, 194:196, 201:204, 207, 210, 212:213, 215, 227:228, 234, 284, 308, 332, 335:337, 339:356];...%[aibehavphys1012_May21_TailF1_PureTonePassivep1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May21_TailF1_PureTonePassivep1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 21'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 249
		% May 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May21';
		Electrodes = {[1, 4, 6, 9, 10, 11, 12];%[general_path, 'aibehavphys1012_May21_TailF1_PureTonePassivep2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[98, 112, 119, 126];...%[aibehavphys1012_May21_TailF1_PureTonePassivep2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May21_TailF1_PureTonePassivep2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 21'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 250
		% May 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May21';
		Electrodes = {[1, 2, 4, 5, 6, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys1012_May21_TailF1_UnmodPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1:4, 7:9, 15, 19, 27, 29, 31:37, 39:40, 41, 47, 50:68, 70, 80, 83, 89, 90, 95, 97:98, 100, 107, 109, 112:114, 120, 124:125, 131:138, 141:151, 155, 158, 160, 162, 164, 169, 171:172, 180:187, 208, 210, 237, 256, 257, 267];...%[aibehavphys1012_May21_TailF1_UnmodPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May21_TailF1_UnmodPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 21'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 251
		% May 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May22';
		Electrodes = {[1, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May22_TailF1_Mod4kHzPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[12, 13, 18, 32:33, 36, 43, 56, 63:64, 73:75];...%[aibehavphys1012_May22_TailF1_Mod4kHzPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May22_TailF1_Mod4kHzPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 22'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 252
		% May 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May22';
		Electrodes = {[1, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May22_TailF1_Mod8kHzPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[8, 9, 28];...%[aibehavphys1012_May22_TailF1_Mod8kHzPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May22_TailF1_Mod8kHzPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 22'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 253
		% May 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May22';
		Electrodes = {[1, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May22_TailF1_ModActive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 5, 6, 21, 29, 32:33, 37, 40];...%[aibehavphys1012_May22_TailF1_ModActive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May22_TailF1_ModActive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 22'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 254
		% May 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May22';
		Electrodes = {[1, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May22_TailF1_ModPassivep1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[35:36, 38];...%[aibehavphys1012_May22_TailF1_ModPassivep1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May22_TailF1_ModPassivep1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 22'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 255
		% May 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May22';
		Electrodes = {[1, 4, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May22_TailF1_ModPassivep2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[12:13, 23];...%[aibehavphys1012_May22_TailF1_ModPassivep2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May22_TailF1_ModPassivep2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 22'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 256
		% May 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May22';
		Electrodes = {[1, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May22_TailF1_PureTonePassivep2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 107:108];...%[aibehavphys1012_May22_TailF1_PureTonePassivep2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May22_TailF1_PureTonePassivep2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 22'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 257
		% May 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May22';
		Electrodes = {[1, 4, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May22_TailF1_UnmodActivep2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[5:6];...%[aibehavphys1012_May22_TailF1_UnmodActivep2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May22_TailF1_UnmodActivep2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 22'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 258
		% May 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May22';
		Electrodes = {[1, 4, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May22_TailF1_UnmodPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 62, 180, 188, 193, 200, 203, 208, 212:214, 219:220, 222, 231:232, 242, 248:249];...%[aibehavphys1012_May22_TailF1_UnmodPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May22_TailF1_UnmodPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 22'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 259
		% May 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May23';
		Electrodes = {[1, 4, 6, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May23_TailF1_Mod4kHzPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[170];...%[aibehavphys1012_May23_TailF1_Mod4kHzPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May23_TailF1_Mod4kHzPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 23'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 260
		% May 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May23';
		Electrodes = {[1, 4, 5, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys1012_May23_TailF1_ModActive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1];...%[aibehavphys1012_May23_TailF1_ModActive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May23_TailF1_ModActive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 23'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 261
		% May 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May23';
		Electrodes = {[1, 4, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May23_TailF1_ModPassivep1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[53, 58, 102, 105:108];...%[aibehavphys1012_May23_TailF1_ModPassivep1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May23_TailF1_ModPassivep1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 23'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 262
		% May 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May23';
		Electrodes = {[1, 4, 5, 11, 12, 13, 15, 16];%[general_path, 'aibehavphys1012_May23_TailF1_ModPassivep2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[5, 7, 9, 11:12, 13, 16, 19:24, 28, 34, 40, 49, 55:56, 59:74, 79, 86, 87, 92:93, 101:110, 141, 152, 161, 163:170, 173, 175:177, 181:188, 195, 200, 202, 217:220, 224, 226, 228:232, 242, 244:247, 250:256, 260, 285:286, 289, 301:304, 311:312, 315:317, 322, 335:336, 350:351, 360:373, 376, 380:383, 386:388, 392, 394, 396, 400, 402:409, 415, 420, 428, 435, 441, 448:449, 455:456, 464, 473:474, 535, 540, 543, 552:553];...%aibehavphys1012_May23_TailF1_ModPassivep2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May23_TailF1_ModPassivep2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 23'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 263
		% May 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May23';
		Electrodes = {[1, 4, 5, 10, 11, 12, 13, 15, 16];%[general_path, 'aibehavphys1012_May23_TailF1_PureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4:5, 12:13, 17, 20:21, 39, 44, 49, 51, 54:57, 66:68, 87, 104, 109:110, 121, 126, 129, 135:137, 151, 157, 166:167, 171, 183:186, 196, 202, 212:213, 219:220, 222:243, 246:248, 251:253, 261:284, 290, 294, 299:300, 307:308, 315:318, 332:333, 417, 434];...%[aibehavphys1012_May23_TailF1_PureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May23_TailF1_PureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 23'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 264
		% May 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May23';
		Electrodes = {[1, 4, 6, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May23_TailF1_PureTonePassivep2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4:5, 39, 56, 87, 151, 157, 160, 213, 219, 224, 232, 246, 253, 290, 293, 300, 308, 417];...%[aibehavphys1012_May23_TailF1_PureTonePassivep2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May23_TailF1_PureTonePassivep2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 23'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 265
		% May 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May23';
		Electrodes = {[1, 4, 6, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May23_TailF1_UnModPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[6:7, 26:35, 52, 60, 66, 70:72, 75:78, 83, 87, 89, 104, 106, 126:127];...%[aibehavphys1012_May23_TailF1_UnModPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May23_TailF1_UnModPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 23'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 266
		% May 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May24';
		Electrodes = {[1, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May24_TailF1_Mod4kHzPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[26, 62, 101:102];...%[aibehavphys1012_May24_TailF1_Mod4kHzPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May24_TailF1_Mod4kHzPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 24'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 267
		% May 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May24';
		Electrodes = {[4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May24_TailF1_Mod8kHzPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[7];...%[aibehavphys1012_May24_TailF1_Mod8kHzPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May24_TailF1_Mod8kHzPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 24'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 268
		% May 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May24';
		Electrodes = {[4, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May24_TailF1_ModActive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4, 6:7, 26, 39, 57];...%[aibehavphys1012_May24_TailF1_ModActive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May24_TailF1_ModActive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 24'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 269
		% May 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May24';
		Electrodes = {[4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May24_TailF1_ModPassivep1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[185, 305, 307];...%[aibehavphys1012_May24_TailF1_ModPassivep1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May24_TailF1_ModPassivep1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 24'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 270
		% May 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May24';
		Electrodes = {[4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May24_TailF1_ModPassivep2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys1012_May24_TailF1_ModPassivep2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May24_TailF1_ModPassivep2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 24'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 271
		% May 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May24';
		Electrodes = {[4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May24_TailF1_ModPassivep3_extracted.hd5'];...
			 };

		ExcludeTrial =  {[108];...%[aibehavphys1012_May24_TailF1_ModPassivep3_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May24_TailF1_ModPassivep3_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 24'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 272
		% May 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May24';
		Electrodes = {[4, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May24_TailF1_ModPassivep4_extracted.hd5'];...
			 };

		ExcludeTrial =  {[7, 162, 181, 195, 213:214, 219, 224];...%[aibehavphys1012_May24_TailF1_ModPassivep4_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May24_TailF1_ModPassivep4_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 24'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 273
		% May 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May24';
		Electrodes = {[1, 4, 6, 7, 10, 12, 14];%[general_path, 'aibehavphys1012_May24_TailF1_PureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[95:99, 112, 116, 120, 327, 332, 360, 471];...%[aibehavphys1012_May24_TailF1_PureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May24_TailF1_PureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 24'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 274
		% May 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May24';
		Electrodes = {[4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May24_TailF1_UnmodPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[92, 105, 121:122, 125, 133, 139, 168, 170];...%[aibehavphys1012_May24_TailF1_UnmodPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May24_TailF1_UnmodPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 24'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 275
		% May 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May27';
		Electrodes = {[1, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May28_TailF1_Mod4kHzPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 3, 6, 99];...%[aibehavphys1012_May28_TailF1_Mod4kHzPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_Mod4kHzPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 27'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 276
		% May 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May27';
		Electrodes = {[1, 3, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May28_TailF1_Mod8kHzPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[26, 58, 61, 63, 67, 71];...%[aibehavphys1012_May28_TailF1_Mod8kHzPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_Mod8kHzPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 27'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 277
		% May 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May27';
		Electrodes = {[1, 2, 3, 4, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May28_TailF1_ModActivep1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[11, 14, 23, 52, 58, 62, 68, 86];...%[aibehavphys1012_May28_TailF1_ModActivep1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_ModActivep1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 27'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 278
		% May 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May27';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May28_TailF1_ModActivep2 _extracted.hd5'];...
			 };

		ExcludeTrial =  {[14, 18, 22];...%[aibehavphys1012_May28_TailF1_ModActivep2 _extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_ModActivep2 _extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 27'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 279
		% May 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May27';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May28_TailF1_ModPassivep1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[24:25, 30, 43:48, 58, 69:72, 75:77, 82, 84:85];...%[aibehavphys1012_May28_TailF1_ModPassivep1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_ModPassivep1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 27'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 280
		% May 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May27';
		Electrodes = {[1, 2, 3, 4, 7, 11, 12, 14];%[general_path, 'aibehavphys1012_May28_TailF1_ModPassivep2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[6, 7, 9:11, 15, 17, 29, 31, 50, 52:53, 72, 80, 98:103, 124, 126:127, 135, 143:148, 151, 155, 158, 160:161, 211, 214, 217, 219, 279, 282, 293, 299:302, 306:309, 320:322, 336, 338, 345:360, 367, 375:379, 386:393, 440, 442, 452:453, 460:462, 552, 580:582];...%[aibehavphys1012_May28_TailF1_ModPassivep2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_ModPassivep2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 27'};
		ANIMAL = {'TailF1'};
		MaskNr =  [];

	case 281
		% May 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May27';
		Electrodes = {[1, 2, 3, 4, 7, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May28_TailF1_PureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[32, 38:41, 49, 54, 56, 114:115, 120, 137, 156:158, 183, 186, 193, 198:199, 202, 207, 211:214, 218, 226, 237:240, 249, 262, 277, 292, 309, 314, 322, 330:331];...%[aibehavphys1012_May28_TailF1_PureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_PureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 27'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 282
		% May 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May27';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May28_TailF1_UnmodActivep1p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 10, 25, 28];...%[aibehavphys1012_May28_TailF1_UnmodActivep1p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_UnmodActivep1p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 27'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 283
		% May 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May27';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May28_TailF1_UnmodActivep2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 10, 25, 28];...%[aibehavphys1012_May28_TailF1_UnmodActivep2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_UnmodActivep2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 27'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 284
		% May 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May27';
		Electrodes = {[1, 2, 3, 4, 7, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May28_TailF1_UnmodPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[15, 22, 25:27, 48, 54:55, 73:77, 79, 84, 112:115, 118, 212, 222:225];...%[aibehavphys1012_May28_TailF1_UnmodPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_UnmodPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 27'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 285
		% May 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May28';
		Electrodes = {[1, 2, 3, 4, 6, 7, 11, 12, 14];%[general_path, 'aibehavphys1012_May28_TailF1_Mod4kHzPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3:4, 108:111];...%[aibehavphys1012_May28_TailF1_Mod4kHzPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_Mod4kHzPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 28'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 286
		% May 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May28';
		Electrodes = {[1, 2, 3, 4, 10, 11, 12, 13, 14];%[general_path, 'aibehavphys1012_May28_TailF1_Mod8kHzPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[18, 24, 41, 43:45];...%[aibehavphys1012_May28_TailF1_Mod8kHzPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_Mod8kHzPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 28'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 287
		% May 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May28';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May28_TailF1_ModPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[6:7, 30, 105:107, 188, 199, 221, 224, 231, 236:237, 246:249, 251, 253, 257, 265:267, 275, 277:278, 282, 338, 486:489];...%[aibehavphys1012_May28_TailF1_ModPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_ModPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 28'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 288
		% May 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May28';
		Electrodes = {[1, 2, 3, 4, 6, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May28_TailF1_PureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[253, 284, 339, 375, 387:388, 409, 414:416, 448];...%[aibehavphys1012_May28_TailF1_PureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_PureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 28'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 289
		% May 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May28';
		Electrodes = {[1, 2, 3, 4, 6, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May28_TailF1_UnmodPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[21, 24:26, 59:61, 108, 119:120, 189, 204, 213:215];...%[aibehavphys1012_May28_TailF1_UnmodPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May28_TailF1_UnmodPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 28'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 290
		% May 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May29';
		Electrodes = {[1, 2, 3, 4, 6, 7, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May29_TailF1_ModPassivep1_littleE12_extracted.hd5'];...
			 };

		ExcludeTrial =  {[6:7, 9 , 36, 38, 80, 88, 158, 259, 285, 291, 316, 397, 447, 459:460, 472:473, 477, 478];...%[aibehavphys1012_May29_TailF1_ModPassivep1_littleE12_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May29_TailF1_ModPassivep1_littleE12_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 29'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 291
		% May 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May29';
		Electrodes = {[3,4, 6, 7, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May29_TailF1_ModPassivep2_bigE12_extracted.hd5'];...
			 };

		ExcludeTrial =  {[13, 34:35, 54, 117, 315, 483, 523, 533];...%[aibehavphys1012_May29_TailF1_ModPassivep2_bigE12_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May29_TailF1_ModPassivep2_bigE12_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 29'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 292
		% May 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May29';
		Electrodes = {[2, 3, 4, 6, 7, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May29_TailF1_PureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[179, 180, 259];...%[aibehavphys1012_May29_TailF1_PureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May29_TailF1_PureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 29'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 293
		% May 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May29';
		Electrodes = {[3, 4, 6, 7, 11, 12, 13, 14];%[general_path, 'aibehavphys1012_May29_TailF1_UnmodPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1:102, 116, 119, 151, 238, 239, 247, 250:263];...%[aibehavphys1012_May29_TailF1_UnmodPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May29_TailF1_UnmodPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 29'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 294
		% May 30
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May30';
		Electrodes = {[3, 4, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May30_TailF1_Mod4kPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[15];...%[aibehavphys1012_May30_TailF1_Mod4kPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May30_TailF1_Mod4kPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 30'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 295
		% May 30
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May30';
		Electrodes = {[1, 3, 4, 9, 10, 12, 14, 15];%[general_path, 'aibehavphys1012_May30_TailF1_Mod8kPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys1012_May30_TailF1_Mod8kPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May30_TailF1_Mod8kPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 30'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 296
		% May 30
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May30';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May30_TailF1_ModActivep2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3:7, 11];...%[aibehavphys1012_May30_TailF1_ModActivep2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May30_TailF1_ModActivep2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 30'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 

	case 297
		% May 30
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\TailF1\May30';
		Electrodes = {[1, 2, 3, 4, 7, 9, 10, 11, 12, 14];%[general_path, 'aibehavphys1012_May30_TailF1_ModPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[183, 235:237, 250, 255, 259, 424, 492];...%[aibehavphys1012_May30_TailF1_ModPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1012_May30_TailF1_ModPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'May 30'};
		ANIMAL = {'TailF1'};
		MaskNr =  []; 


	case 298
		% April 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Apr1_2012';
		Electrodes = {[5, 6, 7, 13, 14, 16];%[general_path, 'aibehavphysMod1Passive40dBSPL_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod1Passive40dBSPL_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'April 1'};
		ANIMAL = {'CMRphys'};
		MaskNr =  []; 

	case 299
		% April 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Apr1_2012';
		Electrodes = {[5, 13, 14, 15, 16];%[general_path, 'aibehavphysMod1Passive40dBSPL_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod1Passive40dBSPL_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'April 1'};
		ANIMAL = {'CMRphys'};
		MaskNr =  []; 

	case 300
		% April 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Apr1_2012';
		Electrodes = {[5, 13, 14, 15, 16];%[general_path, 'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[53, 55, 106, 115, 116];...%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'April 1'};
		ANIMAL = {'CMRphys'};
		MaskNr =  []; 

	case 301
		% April 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Apr1_2012';
		Electrodes = {[5, 13, 14, 15, 16];%[general_path, 'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'April 1'};
		ANIMAL = {'CMRphys'};
		MaskNr =  []; 

	case 302
		% April 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Apr1_2012';
		Electrodes = {[5, 13, 14, 15, 16];%[general_path, 'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'April 1'};
		ANIMAL = {'CMRphys'};
		MaskNr =  []; 

	case 303
		% October 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct1';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Head_Unmod1k_Oct1_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys_Head_Unmod1k_Oct1_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Head_Unmod1k_Oct1_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 1'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  []; 

	case 304
		% October 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct1';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_Head_Unmod1k_Oct1_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys_Head_Unmod1k_Oct1_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Head_Unmod1k_Oct1_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 1'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  []; 

	case 305
		% October 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct1';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadMod31k_Oct1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysHeadMod31k_Oct1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadMod31k_Oct1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 1'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  []; 

	case 306
		% October 1
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct1';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadMod31k_Oct1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3, 29, 80, 86, 88, 89, 100, 114, 115, 119, 157, 165, 216, 244, 257, 258];...%[aibehavphysHeadMod31k_Oct1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadMod31k_Oct1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 1'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  []; 

	case 307
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct3';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadMod3active_part1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysHeadMod3active_part1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadMod3active_part1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 3'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  []; 

	case 308
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct3';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadMod3active_part2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysHeadMod3active_part2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadMod3active_part2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 3'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  []; 

	case 309
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct3';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadMod3passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[10, 32, 33, 43, 50];...%[aibehavphysHeadMod3passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadMod3passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 3'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  []; 

	case 310
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct3';
		Electrodes = {[1, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadMod4_extracted.hd5'];...
			 };

		ExcludeTrial =  {[7, 8, 14, 19];...%[aibehavphysHeadMod4_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadMod4_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 3'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  []; 

	case 311
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct3';
		Electrodes = {[1, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadMod5_extracted.hd5'];...
			 };

		ExcludeTrial =  {[5, 6, 8:10, 22, 24, 26, 28:35];...%[aibehavphysHeadMod5_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadMod5_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 3'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  []; 

	case 312
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct3';
		Electrodes = {[1, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadPassivePureToneResponse_extracted.hd5'];...
			 };

		ExcludeTrial =  {[21, 29, 37, 41, 44, 58:84, 153, 164:165, 167, 170, 177, 179:183, 185, 189, 211, 234, 268:281];...%[aibehavphysHeadPassivePureToneResponse_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadPassivePureToneResponse_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 3'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 313
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct3';
		Electrodes = {[1, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadUnmod1passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysHeadUnmod1passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadUnmod1passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 3'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 314
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct3';
		Electrodes = {[1, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadUnmod2passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysHeadUnmod2passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadUnmod2passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 3'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 315
		% October 3
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct3';
		Electrodes = {[1, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadUnmodactive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4];...%[aibehavphysHeadUnmodactive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadUnmodactive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 3'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 316
		% October 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct5';
		Electrodes = {[1, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphys_activeUnmodHeadOct5_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1];...%[aibehavphys_activeUnmodHeadOct5_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_activeUnmodHeadOct5_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 5'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 317
		% October 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct5';
		Electrodes = {[1, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadMod3active_Oct_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[8:9, 54:55, 87];...%[aibehavphysHeadMod3active_Oct_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadMod3active_Oct_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 5'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 318
		% October 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct5';
		Electrodes = {[1, 6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadMod3passive_Oct5_part1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[9, 26, 36, 57];...%[aibehavphysHeadMod3passive_Oct5_part1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadMod3passive_Oct5_part1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 5'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 319
		% October 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct5';
		Electrodes = {[1, 6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysMod3_passive_Head_Oct5_part2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3_passive_Head_Oct5_part2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3_passive_Head_Oct5_part2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 5'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 320
		% October 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct5';
		Electrodes = {[1, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysmod4_passive_Head_Oct5_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysmod4_passive_Head_Oct5_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysmod4_passive_Head_Oct5_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 5'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 321
		% October 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct5';
		Electrodes = {[1, 5, 6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysMod5_passiveHEad_Oct5_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod5_passiveHEad_Oct5_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod5_passiveHEad_Oct5_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 5'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 322
		% October 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct5';
		Electrodes = {[1, 5, 6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysUnmod2_passive_Head_Oct5_extracted.hd5'];...
			 };

		ExcludeTrial =  {[7];...%[aibehavphysUnmod2_passive_Head_Oct5_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod2_passive_Head_Oct5_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 5'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 323
		% October 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct5';
		Electrodes = {[1, 5, 6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysUnmodpassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[58, 66];...%[aibehavphysUnmodpassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmodpassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 5'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 324
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct8';
		Electrodes = {[1, 6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysActiveMod3Head_Oct8_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 5];...%[aibehavphysActiveMod3Head_Oct8_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysActiveMod3Head_Oct8_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 8'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 325
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct8';
		Electrodes = {[1, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysMod3passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1:7];...%[aibehavphysMod3passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 8'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 326
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct8';
		Electrodes = {[1, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysPassiveMod4_HeadOct8_extracted.hd5'];...
			 };

		ExcludeTrial =  {[5, 27, 30, 38:41];...%[aibehavphysPassiveMod4_HeadOct8_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveMod4_HeadOct8_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 8'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 327
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct8';
		Electrodes = {[1, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysSilence_Head_Oct8_passive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[5, 27, 30, 38:41];...%[aibehavphysSilence_Head_Oct8_passive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysSilence_Head_Oct8_passive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 8'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 328
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct8';
		Electrodes = {[1, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysSilencepassive_Head_Oct8_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysSilencepassive_Head_Oct8_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysSilencepassive_Head_Oct8_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 8'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 329
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct8';
		Electrodes = {[1, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysUnmod1active_Oct8_Head_extracted.hd5'];...
			 };

		ExcludeTrial =  {[24];...%[aibehavphysUnmod1active_Oct8_Head_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod1active_Oct8_Head_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 8'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 330
		% October 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct8';
		Electrodes = {[1, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysUnmod1passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[13, 25, 33, 38, 56];...%[aibehavphysUnmod1passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod1passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 8'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 331
		% October 10 = complete.

	case 332
		% October 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct12';
		Electrodes = {[9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadActive_Mod3_Oct12_p3_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysHeadActive_Mod3_Oct12_p3_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadActive_Mod3_Oct12_p3_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 12'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 333
		% October 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct12';
		Electrodes = {[9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysHeadActiveMod3_Oct12_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 70, 72, 74, 75];...%[aibehavphysHeadActiveMod3_Oct12_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysHeadActiveMod3_Oct12_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 12'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 334
		% October 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct12';
		Electrodes = {[9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysMod3Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 9, 10, 15, 17, 22, 48, 55, 66, 84];...%[aibehavphysMod3Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 12'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 335
		% October 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct12';
		Electrodes = {[9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphyspassiveQuietTones_extracted.hd5'];...
			 };

		ExcludeTrial =  {[57, 61, 106, 132:133, 146, 148:149, 158:161];...%[aibehavphyspassiveQuietTones_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphyspassiveQuietTones_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 12'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 336
		% October 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct15';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysPassiveUnmod1_HeadOct15_extracted.hd5'];...
			 };

		ExcludeTrial =  {[7:11, 19, 34, 37, 48:50, 71, 99];...%[aibehavphysPassiveUnmod1_HeadOct15_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveUnmod1_HeadOct15_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 15'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 337
		% October 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct15';
		Electrodes = {[6, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysQuietTones_extracted.hd5'];...
			 };

		ExcludeTrial =  {[20, 21, 24:26, 62, 90, 98];...%[aibehavphysQuietTones_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietTones_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 15'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 338
		% October 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct15';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysUnmod2passiveHeadOct15_extracted.hd5'];...
			 };

		ExcludeTrial =  {[22:26, 28, 29, 32, 60];...%[aibehavphysUnmod2passiveHeadOct15_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod2passiveHeadOct15_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 15'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 339
		% October 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct15';
		Electrodes = {[6, 7, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aischroederphysHeadOct15_extracted.hd5'];...
			 };

		ExcludeTrial =  {[15, 31, 93, 154, 159];...%[aischroederphysHeadOct15_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aischroederphysHeadOct15_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 15'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 340
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct17';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysActiveMod_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysActiveMod_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysActiveMod_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 17'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 341
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct17';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysActiveMod3_HeadOct17_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 8, 70];...%[aibehavphysActiveMod3_HeadOct17_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysActiveMod3_HeadOct17_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 17'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 342
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct17';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysActiveMod3_p3_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysActiveMod3_p3_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysActiveMod3_p3_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 17'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 343
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct17';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysActiveUnmod1_Head_Oct17_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[12];...%[aibehavphysActiveUnmod1_Head_Oct17_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysActiveUnmod1_Head_Oct17_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 17'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 344
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct17';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysActiveUnmod1_HeadOct17_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[12, 15, 27];...%[aibehavphysActiveUnmod1_HeadOct17_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysActiveUnmod1_HeadOct17_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 17'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 345
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct17';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysPassiveMod3_HeadOct17_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[26, 29, 33, 37, 38, 48];...%[aibehavphysPassiveMod3_HeadOct17_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveMod3_HeadOct17_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 17'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 346
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct17';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysPassiveMod3_HeadOct17_extracted.hd5'];...
			 };

		ExcludeTrial =  {[50, 55, 57, 62];...%[aibehavphysPassiveMod3_HeadOct17_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveMod3_HeadOct17_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 17'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 347
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct17';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysPassiveMod4_HeadOct17_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysPassiveMod4_HeadOct17_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveMod4_HeadOct17_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 17'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 348
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct17';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysPassiveMod5_HeadOct17_extracted.hd5'];...
			 };

		ExcludeTrial =  {[63];...%[aibehavphysPassiveMod5_HeadOct17_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveMod5_HeadOct17_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 17'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 349
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct17';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysPassiveQuietPureTones_Head_Oct17_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysPassiveQuietPureTones_Head_Oct17_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveQuietPureTones_Head_Oct17_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 17'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 350
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct17';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysPassiveUnmod1_Head_Oct17_extracted.hd5'];...
			 };

		ExcludeTrial =  {[12];...%[aibehavphysPassiveUnmod1_Head_Oct17_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveUnmod1_Head_Oct17_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 17'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 351
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct17';
		Electrodes = {[6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysPassiveUnmod1_HeadOct17_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1];...%[aibehavphysPassiveUnmod1_HeadOct17_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveUnmod1_HeadOct17_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 17'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 352
		% October 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct17';
		Electrodes = {[6, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysPassiveUnmod2_HeadOct15_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysPassiveUnmod2_HeadOct15_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveUnmod2_HeadOct15_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 17'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 353
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct24';
		Electrodes = {[4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, 'aibehavphysActiveMod3_Head_Oct24_extracted.hd5'];...
			 };

		ExcludeTrial =  {[87:88];...%[aibehavphysActiveMod3_Head_Oct24_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysActiveMod3_Head_Oct24_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 24'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 354
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct24';
		Electrodes = {[5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, aibehavphysActiveUnmod3_HeadOct24_extracted.hd5'];...
			 };

		ExcludeTrial =  {[28];...%[aibehavphysActiveUnmod3_HeadOct24_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysActiveUnmod3_HeadOct24_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 24'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 355
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct24';
		Electrodes = {[5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, aibehavphysPassiveMod3_Head_Oct24_extracted.hd5'];...
			 };

		ExcludeTrial =  {[29, 31, 70, 88:95];...%[aibehavphysPassiveMod3_Head_Oct24_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveMod3_Head_Oct24_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 24'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 356
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct24';
		Electrodes = {[4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, aibehavphysPassiveMod4_Head_Oct24_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3, 10, 13, 20:22, 24:27, 43:46];...%[aibehavphysPassiveMod4_Head_Oct24_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveMod4_Head_Oct24_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 24'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 357
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct24';
		Electrodes = {[5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, aibehavphysPassiveMod5_Head_Oct24_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysPassiveMod5_Head_Oct24_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveMod5_Head_Oct24_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 24'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 358
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct24';
		Electrodes = {[9, 10, 11, 12, 13, 14, 15, 16];%[general_path, aibehavphysPassiveMod5_HeadOct24_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[9];...%[aibehavphysPassiveMod5_HeadOct24_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveMod5_HeadOct24_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 24'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 359
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct24';
		Electrodes = {[10, 11, 12, 13, 14, 15, 16];%[general_path, aibehavphysPassivePureTone_Head_Oct24_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysPassivePureTone_Head_Oct24_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassivePureTone_Head_Oct24_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 24'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 360
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct24';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, aibehavphysPassivePureTones_Head_Oct24_extracted.hd5'];...
			 };

		ExcludeTrial =  {[70, 166];...%[aibehavphysPassivePureTones_Head_Oct24_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassivePureTones_Head_Oct24_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 24'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 361
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct24';
		Electrodes = {[10, 11, 12, 13, 14, 15, 16];%[general_path, aibehavphysPassiveUnmod1_Head_Oct24_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2];...%[aibehavphysPassiveUnmod1_Head_Oct24_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveUnmod1_Head_Oct24_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 24'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 362
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct24';
		Electrodes = {[10, 11, 12, 13, 14, 15, 16];%[general_path, aibehavphysPassiveUnmod2_HeadOct24_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[57];...%[aibehavphysPassiveUnmod2_HeadOct24_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveUnmod2_HeadOct24_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 24'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 363
		% October 24
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct24';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, aibehavphysPassiveUnmod2_HeadOct24_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1];...%[aibehavphysPassiveUnmod2_HeadOct24_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveUnmod2_HeadOct24_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 24'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 364
		% October 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct26';
		Electrodes = {[5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, aibehavphysActiveUnmod1_Head_Oct26_extracted.hd5'];...
			 };

		ExcludeTrial =  {[34, 36];...%[aibehavphysActiveUnmod1_Head_Oct26_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysActiveUnmod1_Head_Oct26_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 365
		% October 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct26';
		Electrodes = {[7, 10, 11, 12, 13, 14, 15, 16];%[general_path, aibehavphysMod3Active_Head_Oct26_extracted.hd5'];...
			 };

		ExcludeTrial =  {[23];...%[aibehavphysMod3Active_Head_Oct26_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Active_Head_Oct26_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 366
		% October 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct26';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[general_path, aibehavphysMod3Passive_Head_Oct26_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[6, 35];...%[aibehavphysMod3Passive_Head_Oct26_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive_Head_Oct26_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 367
		% October 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct26';
		Electrodes = {[10, 11, 12, 13, 14, 15, 16];%[aibehavphysMod3Passive_Head_Oct26_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive_Head_Oct26_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive_Head_Oct26_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 368
		% October 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct26';
		Electrodes = {[10, 11, 12, 13, 14, 15, 16];%[aibehavphysPassiveMod4_Head_Oct26_extracted.hd5'];...
			 };

		ExcludeTrial =  {[74];...%[aibehavphysPassiveMod4_Head_Oct26_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveMod4_Head_Oct26_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 369
		% October 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct26';
		Electrodes = {[7, 10, 11, 12, 13, 14, 15, 16];%[aibehavphysPassiveMod5_Head_Oct26_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[12, 17:18, 23, 25, 31, 37, 40:41];...%[aibehavphysPassiveMod5_Head_Oct26_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveMod5_Head_Oct26_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 370
		% October 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct26';
		Electrodes = {[10, 11, 12, 13, 14, 15, 16];%[aibehavphysPassiveUnMod2_Head_Oct26_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysPassiveUnMod2_Head_Oct26_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveUnMod2_Head_Oct26_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 371
		% October 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct26';
		Electrodes = {[7, 9, 10, 11, 12, 13, 14, 15, 16];%[aibehavphysPureToneQuiet_Head_Oct26_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 41, 43, 50, 173:175];...%[aibehavphysPureToneQuiet_Head_Oct26_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureToneQuiet_Head_Oct26_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 372
		% October 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Oct26';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[aibehavphysPTQHeadOct26_p3_extracted.hd5'];...
			 };

		ExcludeTrial =  {[10];...%[aibehavphysPTQHeadOct26_p3_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPTQHeadOct26_p3_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'October 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 373
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Sep26';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[aibehavphyscMod5passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[46:52];...%[aibehavphyscMod5passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphyscMod5passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'September 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 374
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Sep26';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[aibehavphyspassiveMod3passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[10, 14, 16, 24, 29, 41];...%[aibehavphyspassiveMod3passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphyspassiveMod3passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'September 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 375
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Sep26';
		Electrodes = {[1, 2, 3, 4, 6, 9, 10, 11, 12, 14];%[aibehavphyspassiveMod4passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[27];...%[aibehavphyspassiveMod4passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphyspassiveMod4passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'September 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 376
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Sep26';
		Electrodes = {[1, 2, 3, 4, 6, 9, 10, 11, 12, 14];%[aibehavphyspassiveUnmod1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphyspassiveUnmod1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphyspassiveUnmod1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'September 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 377
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Sep26';
		Electrodes = {[1, 2, 3, 4, 6, 7, 9, 10, 11, 12, 14];%[aibehavphysUnmod1passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysUnmod1passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod1passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'September 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 378
		% September 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\HeadM_G1\Sep26';
		Electrodes = {[1, 2, 3, 4, 6, 9, 10, 11, 12, 14];%[aibehavphysUnmod2passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[69];...%[aibehavphysUnmod2passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod2passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'September 26'};
		ANIMAL = {'HeadM_G1'};
		MaskNr =  [];

	case 379
		% August 6
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightF1\Aug6';
		Electrodes = {[5, 13, 15, 16];%[aibehavphysRightF1_1012_Aug6_Active_Mod4_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysRightF1_1012_Aug6_Active_Mod4_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysRightF1_1012_Aug6_Active_Mod4_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'August 6'};
		ANIMAL = {'RightF1'};
		MaskNr =  [];

	case 380
		% August 7
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightF1\Aug7';
		Electrodes = {[5, 13, 15, 16];%[aiMixbehavphys_Passive_1012_Aug7_RightF1_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aiMixbehavphys_Passive_1012_Aug7_RightF1_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Aug7_RightF1_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'August 7'};
		ANIMAL = {'RightF1'};
		MaskNr =  [];

	case 381
		% August 7
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightF1\Aug7';
		Electrodes = {[1, 5, 9, 10, 12, 14];%[aiMixbehavphys_Passive_1012_Aug7_RightF1_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[63, 84, 126, 182, 185:186, 190, 194:207, 213, 219:220, 222:224, 226, 230:231, 267, 299:303, 309, 404:405, 411, 415:416, 418, 421:423, 426:428, 430:433, 486, 518];...%[aiMixbehavphys_Passive_1012_Aug7_RightF1_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Passive_1012_Aug7_RightF1_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'August 7'};
		ANIMAL = {'RightF1'};
		MaskNr =  [];

	case 382
		% August 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightF1\Aug8';
		Electrodes = {[1, 5, 10, 12, 13, 14];%[aiMixbehavphys_Aug8_RightF1_1012_extracted.hd5'];...
			 };

		ExcludeTrial =  {[73, 145];...%[aiMixbehavphys_Aug8_RightF1_1012_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_Aug8_RightF1_1012_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'August 8'};
		ANIMAL = {'RightF1'};
		MaskNr =  [];

	case 383
		% August 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightF1\Aug8';
		Electrodes = {[5, 12, 14];%[aibehavphysActivUnmod_Aug8_RightF1_1012_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1];...%[aibehavphysActivUnmod_Aug8_RightF1_1012_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysActivUnmod_Aug8_RightF1_1012_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'August 8'};
		ANIMAL = {'RightF1'};
		MaskNr =  [];

	case 384
		% August 9
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightF1\Aug9';
		Electrodes = {[5, 12];%[aiMixbehavphys_RightF1_1012_Aug9_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[33, 58, 97, 99, 105, 149, 163, 172];...%[aiMixbehavphys_RightF1_1012_Aug9_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_RightF1_1012_Aug9_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'August 9'};
		ANIMAL = {'RightF1'};
		MaskNr =  [];

	case 385
		% August 9
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightF1\Aug9';
		Electrodes = {[5, 12];%[aiMixbehavphys_RightF1_1012_Aug9_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[56, 193, 257, 265, 294, 306, 307, 323, 326, 334, 342, 344, 347, 351, 357, 358, 359, 362, 364:366, 370, 377, 382:384, 392, 403, 418, 425, 431, 444, 446, 449, 451, 452, 459, 461, 466, 473:476, 483, 489, 494, 496:499, 504, 508, 509, 512:515, 518];...%[aiMixbehavphys_RightF1_1012_Aug9_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aiMixbehavphys_RightF1_1012_Aug9_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'August 9'};
		ANIMAL = {'RightF1'};
		MaskNr =  [];

	case 386
		% August 9
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightF1\Aug9';
		Electrodes = {[5, 12];%[aibehavphys_PureTone_RightF1_1012_Aug9_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 7, 9:10, 14, 16, 19:21, 23:24, 26, 28:29, 32:35, 38:43, 50, 55:57, 60:74, 79:80, 83:87, 89, 94, 98, 105:106, 108, 110, 114, 116, 120:123, 125, 126, 131, 132, 136:138, 141, 145:149, 155:596];...%[aibehavphys_PureTone_RightF1_1012_Aug9_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_PureTone_RightF1_1012_Aug9_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'August 9'};
		ANIMAL = {'RightF1'};
		MaskNr =  [];

	case 387
		% July 31
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightF1\July31';
		Electrodes = {[4, 5, 9, 10];%[aibehavphysActiveMod4_1012_Jul31_RightF1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysActiveMod4_1012_Jul31_RightF1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysActiveMod4_1012_Jul31_RightF1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'July 31'};
		ANIMAL = {'RightF1'};
		MaskNr =  [];

	case 388
		% July 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightF1\July22';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'July 22'};
		ANIMAL = {'RightF1'};
		MaskNr =  [];

	case 389
		% July 30
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\RightF1\July30';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[aibehavphys_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'July 30'};
		ANIMAL = {'RightF1'};
		MaskNr =  [];

	case 390
		% April 2
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Apr2_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnmod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[52, 129, 137, 143:146, 151, 157, 159, 161:169, 180];...%[aibehavphysUnmod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'April 2'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 391
		% April 2
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Apr2_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[31];...%[aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'April 2'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 392
		% April 2
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Apr2_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysPureTonePassive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'April 2'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 393
		% April 2
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Apr2_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p3_extracted.hd5'];...
			 };

		ExcludeTrial =  {[7, 8, 12, 17:20, 23, 26, 33:35, 37:39, 41:42, 49, 53:55, 58:59, 64, 76, 78:79, 81, 83, 102, 104, 106:110, 112, 113, 116];...%[aibehavphysPureTonePassive_p3_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p3_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'April 2'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 394
		% April 2
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Apr2_1012';
		Electrodes = {[6, 7, 9, 10, 11, 12, 13, 14];%[aibehavphysPureTonePassive_p4_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4:7, 9, 12, 27, 32:36, 39, 65:69, 71:75, 77:78, 81:89, 101:103, 105:110, 116:118, 121:133, 157, 165:169, 186, 217];...%[aibehavphysPureTonePassive_p4_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p4_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'April 2'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 395
		% April 2
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Apr2_1012';
		Electrodes = {[5, 7, 13, 14, 16];%[aibehavphysMod4Passive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[20, 74, 87, 91:95, 98];...%[aibehavphysMod4Passive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'April 2'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 396
		% April 2
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Apr2_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[21, 56, 82, 112, 118];...%[aibehavphysMod4Passive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'April 2'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 397
		% March 4
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar4_1016';
		Electrodes = {[5, 6, 7, 9, 10, 11, 12, 13, 15, 16];%[aibehavphys1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4];...%[aibehavphys1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 4'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 398
		% March 4
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar4_1016';
		Electrodes = {[5, 6, 7, 9, 10, 11, 12, 13, 15, 16];%[aibehavphys2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[12, 15, 35];...%[aibehavphys2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 4'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 399
		% March 4
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar4_1016';
		Electrodes = {[5, 6, 7, 13, 15, 16];%[aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 4'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 400
		% March 4
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar4_1016';
		Electrodes = {[1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 15, 16];%[aibehavphysPureTonePassive1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[5:42, 47:50, 55:59, 63, 65, 68:69, 76:78, 82:86, 88, 94, 95, 104:110, 114, 117, 122:129, 133:135];...%[aibehavphysPureTonePassive1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 4'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 401
		% March 4
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar4_1016';
		Electrodes = {[5, 6, 7, 13, 15, 16];%[aibehavphysPureTonePassive2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 29:33, 60, 64, 97, 134, 166:177, 181, 188, 212, 219, 259, 261];...%[aibehavphysPureTonePassive2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 4'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 402
		% March 4
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar4_1016';
		Electrodes = {[5, 6, 7, 13, 15, 16];%[aibehavphysUnmod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[12, 24, 35];...%[aibehavphysUnmod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 4'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 403
		% March 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar5_1012';
		Electrodes = {[5, 6, 9, 10, 11, 12, 13, 14, 15, 16];%[aibehavphysactiveMod4_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2:4, 6, 7];...%[aibehavphysactiveMod4_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysactiveMod4_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 5'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 404
		% March 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar5_1012';
		Electrodes = {[5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[aibehavphysFluffy0_ActiveMod4_NoGotrials_extracted.hd5'];...
			 };

		ExcludeTrial =  {[16, 24, 28, 30, 32, 51:52, 70:71, 74];...%[aibehavphysFluffy0_ActiveMod4_NoGotrials_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_ActiveMod4_NoGotrials_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 5'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 405
		% March 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar5_1012';
		Electrodes = {[5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[aibehavphysFluffy0_PassiveUnmod2_Gotrials_extracted.hd5'];...
			 };

		ExcludeTrial =  {[16, 22, 32, 51, 61];...%[aibehavphysFluffy0_PassiveUnmod2_Gotrials_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_PassiveUnmod2_Gotrials_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 5'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 406
		% March 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar5_1012';
		Electrodes = {[5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[aibehavphysFluffy0_PassiveUnmod2_NoGotrials_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 7, 46:47, 61, 66];...%[aibehavphysFluffy0_PassiveUnmod2_NoGotrials_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_PassiveUnmod2_Gotrials_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 5'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 407
		% March 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar5_1012';
		Electrodes = {[5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[aibehavphysFluffy0PassiveMod4_Gotrials_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4, 5, 45, 48, 52, 60:61];...%[aibehavphysFluffy0PassiveMod4_Gotrials_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0PassiveMod4_Gotrials_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 5'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 408
		% March 5
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar5_1012';
		Electrodes = {[5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%[aibehavphysPT_extracted.hd5'];...
			 };

		ExcludeTrial =  {[48, 74:76, 84, 105, 118:119, 122:125, 131:132, 147, 152, 184:186, 188:190, 200, 202:203, 205, 208, 213:219, 223, 233, 240, 296];...%[aibehavphysPT_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPT_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 5'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 409
		% March 6
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar6_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysFluffy0_Active_Mod4_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4];...%[aibehavphysFluffy0_Active_Mod4_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Active_Mod4_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 6'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 410
		% March 6
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar6_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysFluffy0_Active_Mod4p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4, 7, 13, 16, 18, 45];...%[aibehavphysFluffy0_Active_Mod4p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Active_Mod4p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 6'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 411
		% March 6
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar6_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysFluffy0Mod3Passive10min_35dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysFluffy0Mod3Passive10min_35dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0Mod3Passive10min_35dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 6'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 412
		% March 6
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar6_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysFluffy0Unmod1Passive10min_35dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[76];...%[aibehavphysFluffy0Unmod1Passive10min_35dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0Unmod1Passive10min_35dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 6'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 413
		% March 6
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar6_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysFluffy0Unmod1Passive10min_75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[16, 41, 95];...%[aibehavphysFluffy0Unmod1Passive10min_75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0Unmod1Passive10min_75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 6'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 414
		% March 7
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar7_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphys_Fluffy0_PassiveMod3_75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[19, 127];...%[aibehavphys_Fluffy0_PassiveMod3_75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Fluffy0_PassiveMod3_75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 7'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 415
		% March 7
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar7_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphys_Fluffy0_PassiveUnmod1_40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[30, 65];...%[aibehavphys_Fluffy0_PassiveUnmod1_40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Fluffy0_PassiveUnmod1_40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 7'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 416
		% March 7
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar7_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphys_Fluffy0_PassiveUnmod1_75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 3, 15, 41];...%[aibehavphys_Fluffy0_PassiveUnmod1_75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_Fluffy0_PassiveUnmod1_75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 7'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 417
		% March 7
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar7_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphysFluffy0_Mod4Passivep1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[17, 72, 121, 138];...%[aibehavphysFluffy0_Mod4Passivep1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Mod4Passivep1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 7'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 418
		% March 7
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar7_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphysFluffy0_Mod4Passivep2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[14];...%[aibehavphysFluffy0_Mod4Passivep2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Mod4Passivep2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 7'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 419
		% March 7
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar7_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphysFluffy0_Unmod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[47, 71, 77, 161];...%[aibehavphysFluffy0_Unmod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Unmod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 7'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 420
		% March 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar8_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysFluffy0_ActiveUnmod2_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4, 6];...%[aibehavphysFluffy0_ActiveUnmod2_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_ActiveUnmod2_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 8'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 421
		% March 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar8_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphysFluffy0_PassiveMod4_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 11, 63, 67, 84, 87:88, 96, 98, 167, 224];...%[aibehavphysFluffy0_PassiveMod4_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_PassiveMod4_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 8'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 422
		% March 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar8_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphysFluffy0_PassiveUnmod2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 37, 60, 76, 86, 89, 113, 206, 217, 224];...%[aibehavphysFluffy0_PassiveUnmod2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_PassiveUnmod2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 8'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 423
		% March 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar8_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphysFluffy0ActiveUnmod2p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 2, 6, 7, 9, 11, 12];...%[aibehavphysFluffy0ActiveUnmod2p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0ActiveUnmod2p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 8'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 424
		% March 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar8_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphysFluffy0ActiveUnmod2p3_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 2, 4, 10, 11, 12, 16, 20, 26];...%[aibehavphysFluffy0ActiveUnmod2p3_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0ActiveUnmod2p3_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 8'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 425
		% March 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar8_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphysFluffy0PassiveMod3_40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[6, 11, 16, 20:31, 34, 36:37, 42:54, 63, 67:69, 71, 107, 109:111, 123, 132:133, 147];...%[aibehavphysFluffy0PassiveMod3_40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0PassiveMod3_40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 8'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 426
		% March 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar8_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphysFluffy0PassiveMod3_75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1:3, 5:6, 8, 10, 12:16, 23:28, 51, 66, 75, 83, 87, 94, 124, 138];...%[aibehavphysFluffy0PassiveMod3_75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0PassiveMod3_75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 8'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 427
		% March 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar8_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphysFluffy0PassiveUnmod1_40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[134];...%[aibehavphysFluffy0PassiveUnmod1_40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0PassiveUnmod1_40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 8'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 428
		% March 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar8_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphysFluffy0PassiveUnmod1_75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 2, 11, 25:36, 39, 41:49, 63, 79, 86:88, 93, 100:106, 142, 145];...%[aibehavphysFluffy0PassiveUnmod1_75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0PassiveUnmod1_75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 8'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 429
		% March 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar8_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphysFluffyPureTone1kHzPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[40, 112:114, 140];...%[aibehavphysFluffyPureTone1kHzPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffyPureTone1kHzPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 8'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 430
		% March 8
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar8_1012';
		Electrodes = {[5, 13, 14, 15, 16];%[aibehavphysFluffyPureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[13, 48, 133, 181, 193, 228, 308, 311, 323:330, 333:334, 373, 399, 413, 423];...%[aibehavphysFluffyPureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffyPureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 8'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 431
		% March 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar10_1012';
		Electrodes = {[9, 10, 11, 12, 13, 14, 15, 16];%[aibehavphys_mod4_active_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3, 9:10, 11, 13, 15:16, 20, 22, 26, 32, 34:35, 37, 48, 50, 53, 64];...%[aibehavphys_mod4_active_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_mod4_active_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 10'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 432
		% March 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar10_1012';
		Electrodes = {[5, 9, 10, 11, 12, 13, 14, 15, 16];%[aibehavphys_mod4_passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 4, 31, 34, 37, 41, 45:46, 48, 83, 96, 108, 111, 136, 140:142, 161, 173];...%[aibehavphys_mod4_passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_mod4_passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 10'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 433
		% March 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar10_1012';
		Electrodes = {[12, 13, 14, 15, 16];%[aibehavphys_PT_passive_innoise_extracted.hd5'];...
			 };

		ExcludeTrial =  {[25, 27:28];...%[aibehavphys_PT_passive_innoise_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_PT_passive_innoise_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 10'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 434
		% March 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar10_1012';
		Electrodes = {[12, 13, 14, 15, 16];%[aibehavphys_unmod2_passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 4, 16:17, 41, 65, 70, 100, 103, 215];...%[aibehavphys_unmod2_passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys_unmod2_passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 10'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 435
		% March 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar10_1012';
		Electrodes = {[12, 13, 14, 15, 16];%[aibehavphysFluffy0_Active_Mod4_extracted.hd5'];...
			 };

		ExcludeTrial =  {[13, 15, 26, 32, 35:36, 48, 50, 53, 64];...%[aibehavphysFluffy0_Active_Mod4_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Active_Mod4_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 10'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 436
		% March 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar10_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysFluffy0_Passive_Mod4_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 4, 45, 48, 83, 108];...%[aibehavphysFluffy0_Passive_Mod4_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Passive_Mod4_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 10'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 437
		% March 10
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar10_1012';
		Electrodes = {[5, 7, 13, 14, 15, 16];%aibehavphysFluffy0_Passive_Unmod2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 41, 65, 215];...%[aibehavphysFluffy0_Passive_Unmod2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Passive_Unmod2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 10'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 438
		% March 11
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar11_1012';
		Electrodes = {[5, 7, 13, 14, 15, 16];%aibehavphysFluffy0_Active_Mod4_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysFluffy0_Active_Mod4_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Active_Mod4_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 11'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 439
		% March 11
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar11_1012';
		Electrodes = {[5, 7, 13, 14, 15, 16];%aibehavphysFluffy0_Active_Mod4p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysFluffy0_Active_Mod4p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Active_Mod4p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 11'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 440
		% March 11
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar11_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysFluffy0_Active_Mod4p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[14, 17, 23];...%[aibehavphysFluffy0_Active_Mod4p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Active_Mod4p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 11'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 441
		% March 11
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar11_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysFluffy0_Passive_Mod4_extracted.hd5'];...
			 };

		ExcludeTrial =  {[63, 163];...%[aibehavphysFluffy0_Passive_Mod4_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Passive_Mod4_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 11'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 442
		% March 11
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar11_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysFluffy0_Passive_Unmod2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysFluffy0_Passive_Unmod2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Passive_Unmod2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 11'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 443
		% March 11
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar11_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysFluffy0_PassiveMod3_40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[33];...%[aibehavphysFluffy0_PassiveMod3_40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_PassiveMod3_40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 11'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 444
		% March 11
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar11_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysFluffy0_PassiveMod3_75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[29, 63];...%[aibehavphysFluffy0_PassiveMod3_75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_PassiveMod3_75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 11'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 445
		% March 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar12_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysFluffy0_Mod4_passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[209];...%[aibehavphysFluffy0_Mod4_passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Mod4_passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 12'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 446
		% March 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar12_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysFluffy0_PureTone_passsive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[85];...%[aibehavphysFluffy0_PureTone_passsive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_PureTone_passsive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 12'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 447
		% March 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar12_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysFluffy0_PureTone_passsive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysFluffy0_PureTone_passsive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_PureTone_passsive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 12'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 448
		% March 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar12_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysFluffy0_Quiet1kHz_passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[72];...%[aibehavphysFluffy0_Quiet1kHz_passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Quiet1kHz_passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 12'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 449
		% March 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar12_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysFluffy0_unMod2_active_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysFluffy0_unMod2_active_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_unMod2_active_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 12'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 450
		% March 12
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar12_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysFluffy0_Unmod2_passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3];...%[aibehavphysFluffy0_Unmod2_passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysFluffy0_Unmod2_passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 12'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 451
		% March 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar13_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphys1kHzPassiveQuiet_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphys1kHzPassiveQuiet_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphys1kHzPassiveQuiet_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 13'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 452
		% March 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar13_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysMod3_40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[18];...%[aibehavphysMod3_40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3_40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 13'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 453
		% March 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar13_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysMod3_75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[39];...%[aibehavphysMod3_75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3_75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 13'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 454
		% March 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar13_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysMod4_Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[45];...%[aibehavphysMod4_Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4_Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 13'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 455
		% March 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar13_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysPassivePureTone_extracted.hd5'];...
			 };

		ExcludeTrial =  {[423];...%[aibehavphysPassivePureTone_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassivePureTone_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 13'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 456
		% March 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar13_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysUnmod1_40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[114, 117, 133];...%[aibehavphysUnmod1_40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod1_40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 13'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 457
		% March 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar13_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysUnmod1_75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[27, 38, 59, 76, 106, 139];...%[aibehavphysUnmod1_75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod1_75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 13'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 458
		% March 13
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar13_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysUnmod4_Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysUnmod4_Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod4_Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 13'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 459
		% March 14
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar14_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysMod3_40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3_40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3_40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 14'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 460
		% March 14
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar14_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysMod3_75dBSPL_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3, 67];...%[aibehavphysMod3_75dBSPL_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3_75dBSPL_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 14'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 461
		% March 14
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar14_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysMod3_75dBSPL_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3_75dBSPL_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3_75dBSPL_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 14'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 462
		% March 14
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar14_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[169];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 14'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 463
		% March 14
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar14_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysPureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[309, 392, 413, 418];...%[aibehavphysPureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 14'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 464
		% March 14
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar14_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysUnmod1_40dBPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[43, 66:67, 75, 90, 92, 94, 105, 108, 114, 152:154];...%[aibehavphysUnmod1_40dBPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnmod1_40dBPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 14'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 465
		% March 14
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar14_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysUnMod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[32, 35, 169, 173, 189, 194];...%[aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 14'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 466
		% March 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar15_1012';
		Electrodes = {[5, 12, 13, 14, 15, 16];%aibehavphysactiveattempt1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2];...%[aibehavphysactiveattempt1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysactiveattempt1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 15'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 467
		% March 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar15_1012';
		Electrodes = {[5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 16];%aibehavphysattemptedactive2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[66:67, 98:99, 105, 107];...%[aibehavphysattemptedactive2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysattemptedactive2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 15'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 468
		% March 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar15_1012';
		Electrodes = {[5, 9, 10, 11, 12, 13, 14, 15, 16];%aibehavphysMod4Passive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod4Passive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 15'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 469
		% March 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar15_1012';
		Electrodes = {[5, 9, 10, 11, 12, 13, 14, 15, 16];%aibehavphysMod4Passive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[6];...%[aibehavphysMod4Passive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 15'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 470
		% March 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar15_1012';
		Electrodes = {[5, 9, 10, 11, 12, 13, 14, 15, 16];%aibehavphysPassiveMod3_40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[10, 12];...%[aibehavphysPassiveMod3_40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveMod3_40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 15'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 471
		% March 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar15_1012';
		Electrodes = {[5, 12, 13, 14, 15, 16];%aibehavphysPassiveMod3_75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysPassiveMod3_75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveMod3_75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 15'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 472
		% March 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar15_1012';
		Electrodes = {[5, 10, 11, 12, 13, 14, 15, 16];%aibehavphysPassiveUnmod1_40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[10, 13, 73, 93];...%[aibehavphysPassiveUnmod1_40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveUnmod1_40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 15'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 473
		% March 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar15_1012';
		Electrodes = {[5, 9, 10, 11, 12, 13, 14, 15, 16];%aibehavphysPassiveUnmod1_75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[111, 144, 149];...%[aibehavphysPassiveUnmod1_75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPassiveUnmod1_75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 15'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 474
		% March 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar15_1012';
		Electrodes = {[5, 9, 10, 11, 12, 13, 14, 15, 16];%aibehavphysPureTonePassivep1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[50, 299];...%[aibehavphysPureTonePassivep1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassivep1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 15'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 475
		% March 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar15_1012';
		Electrodes = {[5, 9, 10, 11, 12, 13, 14, 15, 16];%aibehavphysPureTonePassivep2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysPureTonePassivep2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassivep2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 15'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 476
		% March 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar15_1012';
		Electrodes = {[5, 9, 10, 11, 12, 13, 14, 15, 16];%aibehavphysQuiet1kHzPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[21];...%[aibehavphysQuiet1kHzPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuiet1kHzPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 15'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 477
		% March 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar15_1012';
		Electrodes = {[5, 9, 10, 11, 12, 13, 14, 15, 16];%aibehavphysUnMod2Passive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysUnMod2Passive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 15'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 478
		% March 15
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar15_1012';
		Electrodes = {[5, 13, 14, 15, 16];%aibehavphysUnMod2Passive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[196];...%[aibehavphysUnMod2Passive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 15'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 479
		% March 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar16_1012';
		Electrodes = {[5, 13, 14, 15, 16];%aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[96];...%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 16'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 480
		% March 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar16_1012';
		Electrodes = {[5, 13, 14, 15, 16];%aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 16'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 481
		% March 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar16_1012';
		Electrodes = {[5, 7, 13, 14, 15, 16];%aibehavphysMod4Passive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod4Passive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 16'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 482
		% March 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar16_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysPureTonePassive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysPureTonePassive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 16'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 483
		% March 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar16_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysQuietPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysQuietPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 16'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 484
		% March 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar16_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysUnMod2Passive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysUnMod2Passive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 16'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 485
		% March 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar16_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysUnMod2Passive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysUnMod2Passive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 16'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 486
		% March 16
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar16_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysUnMod2Passive_p3_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysUnMod2Passive_p3_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_p3_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 16'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 487
		% March 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar17_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[109, 117];...%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 17'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 488
		% March 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar17_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 17'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 489
		% March 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar17_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysMod3Passive75dBSPL_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive75dBSPL_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 17'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 490
		% March 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar17_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysMod3Passive75dBSPL_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive75dBSPL_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 17'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 491
		% March 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar17_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[89];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 17'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 492
		% March 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar17_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysPureTonePassive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[38];...%[aibehavphysPureTonePassive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 17'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 493
		% March 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar17_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysQuietPassive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[114];...%[aibehavphysQuietPassive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 17'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 494
		% March 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar17_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%aibehavphysQuietPassive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysQuietPassive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 17'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 495
		% March 17
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar17_1012';
		% Fix by Nima
		Electrodes = {[5, 7, 13, 14, 15, 16];%, 17, 18];%aibehavphysUnMod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[192];...%[aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 17'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 496
		% March 18
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar18_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 18'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 497
		% March 18
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar18_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[136, 140];...%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 18'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 498
		% March 18
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar18_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 18'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 499
		% March 18
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar18_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 18'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 500
		% March 18
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar18_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[130, 169];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 18'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 501
		% March 18
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar18_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysPureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 18'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 502
		% March 18
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar18_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysQuietPassive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[147, 162];...%[aibehavphysQuietPassive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 18'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 503
		% March 18
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar18_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysQuietPassive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysQuietPassive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 18'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 504
		% March 18
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar18_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnMod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[175];...%[aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 18'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 505
		% March 19
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar19_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[194, 200];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 19'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 506
		% March 19
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar19_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[367:371];...%[aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 19'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 507
		% March 19
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar19_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysQuietPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[9, 14, 22];...%[aibehavphysQuietPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 19'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 508
		% March 19
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar19_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnMod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[26, 137];...%[aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 19'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 509
		% March 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar20_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 20'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 510
		% March 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar20_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 49, 55];...%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 20'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 511
		% March 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar20_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[52, 58];...%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 20'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 512
		% March 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar20_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[60];...%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 20'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 513
		% March 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar20_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod4Passive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 20'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 514
		% March 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar20_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[46, 68:69, 91:92];...%[aibehavphysMod4Passive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 20'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 515
		% March 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar20_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[126];...%[aibehavphysPureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 20'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 516
		% March 20
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar20_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[126];...%[aibehavphysPureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 20'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 517
		% March 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar21_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[55];...%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 21'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 518
		% March 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar21_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[57, 69, 81, 108];...%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 21'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 519
		% March 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar21_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 21'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 520
		% March 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar21_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 21'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 521
		% March 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar21_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 21'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 522
		% March 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar21_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[147];...%[aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 21'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 523
		% March 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar21_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p3_extracted.hd5'];...
			 };

		ExcludeTrial =  {[89];...%[aibehavphysPureTonePassive_p3_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p3_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 21'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 524
		% March 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar21_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysQuietPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysQuietPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 21'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 525
		% March 21
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar21_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnMod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[95, 181, 197];...%[aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 21'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 526
		% March 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar22_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 22'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 527
		% March 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar22_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive75dBSPL_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[5:7];...%[aibehavphysMod1Passive75dBSPL_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 22'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 528
		% March 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar22_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive75dBSPL_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[60:61, 84];...%[aibehavphysMod1Passive75dBSPL_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 22'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 529
		% March 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar22_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[12];...%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 22'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 530
		% March 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar22_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 22'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 531
		% March 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar22_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[122, 130, 203];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 22'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 532
		% March 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar22_1012';
		Electrodes = {[13, 14, 15, 16];%[aibehavphysPureTonePassive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 22'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 533
		% March 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar22_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[14];...%[aibehavphysPureTonePassive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 22'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 534
		% March 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar22_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysQuietPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[104];...%[aibehavphysQuietPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 22'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 535
		% March 22
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar22_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnMod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[10, 41, 93, 115];...%[aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 22'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 536
		% March 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar23_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[48, 141];...%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 23'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 537
		% March 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar23_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[44, 56, 127];...%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 23'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 538
		% March 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar23_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[41];...%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 23'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 539
		% March 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar23_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 23'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 540
		% March 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar23_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[88, 103];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 23'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 541
		% March 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar23_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[11, 48, 247, 333, 407, 415, 433, 439];...%[aibehavphysPureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 23'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 542
		% March 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar23_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysQuietPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[10, 25];...%[aibehavphysQuietPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 23'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 543
		% March 23
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar23_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnMod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 23'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 544
		% March 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar25_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive40dBSPL_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[32, 45];...%[aibehavphysMod1Passive40dBSPL_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 25'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 545
		% March 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar25_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[34, 73, 79, 87, 145];...%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 25'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 546
		% March 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar25_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 25'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 547
		% March 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar25_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[15, 18, 76, 78, 149, 156, 167, 174, 207, 223];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 25'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 548
		% March 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar25_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 25'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 549
		% March 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar25_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[16, 122, 130, 150, 161, 174];...%[aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 25'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 550
		% March 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar25_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysPureTonePassive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 25'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 551
		% March 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar25_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysQuietPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[40, 41, 51, 53, 63, 82, 90, 94, 102, 199, 203, 206, 214];...%[aibehavphysQuietPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 25'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 552
		% March 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar25_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnMod2Passive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[33];...%[aibehavphysUnMod2Passive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 25'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 553
		% March 25
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar25_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnMod2Passive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysUnMod2Passive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 25'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 554
		% March 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar26_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[27, 97];...%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 26'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 555
		% March 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar26_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 26'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 556
		% March 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar26_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[98];...%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 26'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 557
		% March 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar26_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 26'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 558
		% March 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar26_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[42, 188];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 26'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 559
		% March 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar26_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[23, 40, 157, 274, 421];...%[aibehavphysPureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 26'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 560
		% March 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar26_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysQuietPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[159];...%[aibehavphysQuietPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 26'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 561
		% March 26
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar26_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnMod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3];...%[aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 26'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 562
		% March 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar27_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[27, 97];...%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 27'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 563
		% March 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar27_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[20, 70, 83];...%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 27'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 564
		% March 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar27_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[98];...%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 27'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 565
		% March 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar27_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[31];...%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 27'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 566
		% March 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar27_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[42];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 27'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 567
		% March 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar27_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[162, 291, 298, 299, 418, 432, 436, 439, 449];...%[aibehavphysPureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 27'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 568
		% March 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar27_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysQuietPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[69, 77, 109];...%[aibehavphysQuietPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 27'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 569
		% March 27
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar27_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnMod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[132, 175];...%[aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 27'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 570
		% March 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar28_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 28'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 571
		% March 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar28_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[113];...%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 28'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 572
		% March 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar28_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[23, 31, 52, 94, 103];...%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 28'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 573
		% March 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar28_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[49, 52, 58, 61, 112, 127, 170, 183, 214:215, 221];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 28'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 574
		% March 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar28_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[133, 149:152, 159, 165, 295, 342];...%[aibehavphysPureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 28'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 575
		% March 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar28_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysQuietPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[30, 62, 123:124, 206, 209, 220];...%[aibehavphysQuietPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 28'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 576
		% March 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar28_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnMod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[18, 158, 162, 187];...%[aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 28'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 577
		% March 28
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar28_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnMod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[18, 158, 162, 187];...%[aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 28'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 578
		% March 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar29_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[62];...%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 29'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 579
		% March 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar29_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[35];...%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 29'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 580
		% March 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar29_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1:2, 39, 43, 53];...%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 29'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 581
		% March 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar29_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 29'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 582
		% March 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar29_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[32, 53, 75, 118];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 29'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 583
		% March 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar29_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[8];...%[aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 29'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 584
		% March 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar29_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[89];...%[aibehavphysPureTonePassive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 29'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 585
		% March 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar29_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p3_extracted.hd5'];...
			 };

		ExcludeTrial =  {[127, 162];...%[aibehavphysPureTonePassive_p3_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p3_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 29'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 586
		% March 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar29_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p3_extracted.hd5'];...
			 };

		ExcludeTrial =  {[127, 162];...%[aibehavphysPureTonePassive_p3_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p3_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 29'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 587
		% March 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar29_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysQuietPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[10, 20, 45, 156, 159, 161, 166];...%[aibehavphysQuietPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 29'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 588
		% March 29
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar29_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnMod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[41, 44, 64, 71, 183];...%[aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 29'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 589
		% March 30
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar30_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[30, 35, 56, 134];...%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 30'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 590
		% March 30
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar30_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[35:37, 86, 93, 99, 130, 140];...%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 30'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 591
		% March 30
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar30_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[3, 10, 21:22, 39, 59, 77, 80, 86, 123];...%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 30'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 592
		% March 30
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar30_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[4, 11, 207];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 30'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 593
		% March 30
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar30_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[61, 185, 370, 397, 412];...%[aibehavphysPureTonePassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 30'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 594
		% March 30
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar30_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysQuietPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[162];...%[aibehavphysQuietPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 30'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 595
		% March 30
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar30_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnMod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[1, 6:7, 21, 123, 136];...%[aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 30'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 596
		% March 31
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar31_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[];...%[aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 31'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 597
		% March 31
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar31_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[61, 76, 79, 148:149];...%[aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod1Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 31'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 598
		% March 31
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar31_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[11, 23, 28, 40, 129];...%[aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive40dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 31'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 599
		% March 31
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar31_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			 };

		ExcludeTrial =  {[62];...%[aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod3Passive75dBSPL_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 31'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 600
		% March 31
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar31_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysMod4Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[156, 179, 195, 220, 232];...%[aibehavphysMod4Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysMod4Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 31'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 601
		% March 31
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar31_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p1_extracted.hd5'];...
			 };

		ExcludeTrial =  {[2, 19];...%[aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p1_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 31'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 602
		% March 31
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar31_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysPureTonePassive_p2_extracted.hd5'];...
			 };

		ExcludeTrial =  {[236, 334];...%[aibehavphysPureTonePassive_p2_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysPureTonePassive_p2_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 31'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 603
		% March 31
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar31_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysQuietPassive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[6, 65:66, 199, 201, 207:208];...%[aibehavphysQuietPassive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysQuietPassive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 31'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];

	case 604
		% March 31
		savefilename1 = '';
		savefilename2 = '';
		general_path = 'D:\GoogleDrivehgh\MMRPhysiology\CMRphys\Mar31_1012';
		Electrodes = {[5, 6, 7, 13, 14, 15, 16];%[aibehavphysUnMod2Passive_extracted.hd5'];...
			 };

		ExcludeTrial =  {[35, 143, 159];...%[aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		extracted_filenames = { [general_path,'aibehavphysUnMod2Passive_extracted.hd5'];...
			};

		TASK = {'';...
			};
		sortedspike_filenames =  {[];...
			};

		DAY = {'March 31'};
		ANIMAL = {'CMRphys'};
		MaskNr =  [];
end
