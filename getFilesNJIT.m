channels = 1:15;

switch animalName
	case 'C07Right'
		dataPath = '../Data/';
		dataFiles = {
			'C07Right_PositiveCMR_20171116_160252.h5'
			'C07Right_PositiveCMR_20171116_160010.h5'
			};
		excludeTrials = {
			};
		
	case 'CMR04Fluffy'
		dataPath = '../Data/';
		dataFiles = {
			'CMR04Fluffy_PositiveCMR_20180130_093707_CMR_Passive.h5'
			'CMR04Fluffy_PositiveCMR_20180130_094404_CMR_Passive.h5'
			'CMR04Fluffy_PositiveCMR_20180130_144636_CMR_Passive.h5'
			'CMR04Fluffy_PositiveCMR_20180130_162347_CMR_Active.h5'
			'CMR04Fluffy_PositiveCMR_20180130_170246_CMR_Passive.h5'
			'CMR04Fluffy_PositiveCMR_20180201_150048_CMR_Passive.h5'
			'CMR04Fluffy_PositiveCMR_20180201_155424_CMR_Active.h5'
			'CMR04Fluffy_PositiveCMR_20180201_163740_CMR_Passive.h5'
			};
		excludeTrials = {
			};
		
	case 'CMR04Tail'
		dataPath = '../Data/';
		dataFiles = {
			'CMR04Tail_PositiveCMR_20180510_124018_Passive_Supermasker50dB_1kTone75dB.h5'
			'CMR04Tail_PositiveCMR_20180510_130018_Passive_1kTone75dB.h5'
			'CMR04Tail_PositiveCMR_20180510_130424_Passive_0.5kTone75dB.h5'
			'CMR04Tail_PositiveCMR_20180510_130920_Passive_2kTone75dB.h5'
			'CMR04Tail_PositiveCMR_20180510_131340_Passive_3kTone75dB.h5'
			'CMR04Tail_PositiveCMR_20180510_131736_Passive_4kTone75dB.h5'
			'CMR04Tail_PositiveCMR_20180510_132256_Passive_8kTone75dB.h5'
			'CMR04Tail_PositiveCMR_20180510_133659_Passive_Supermasker75dB.h5'
			'CMR04Tail_PositiveCMR_20180514_165026_Active_Supermasker50dB_1kTone.h5'
			'CMR04Tail_PositiveCMR_20180514_170330_Active_Supermasker50dB_1kTone.h5'
			'CMR04Tail_PositiveCMR_20180516_130338_Active_Supermasker50dB_1kTone.h5'
			'CMR04Tail_PositiveCMR_20180518_113406_Active_Supermasker50dB_1kTone.h5'
			'CMR04Tail_PositiveCMR_20180520_130053_Active_Supermasker50dB_1kTone.h5'
			'CMR04Tail_PositiveCMR_20180522_164508_Active_Supermasker50dB_1kTone.h5'
			'CMR04Tail_PositiveCMR_20180524_160310_Active_Supermasker30dB_1kTone.h5'
			'CMR04Tail_PositiveCMR_20180524_161657_Active_Supermasker30dB_1kTone.h5'
			'CMR04Tail_PositiveCMR_20180526_133120_Active_Supermasker35dB_1kTone.h5'
			};
		excludeTrials = {
			};

	case 'CMR02Head'    % first gerbil with good data
		dataPath = '../Data/';
		dataFiles = {
			'CMR02Head-20180824-172941-MMR-Physiology-Passive-ToneAudiometry.h5'
			'CMR02Head-20180824-180724-MMR-Physiology-Passive-NogosSupermasker.h5'
			'CMR02Head-20180827-105423-MMR-Physiology-Active-1kToneSupermasker.h5'
			'CMR02Head-20180829-144537-MMR-Physiology-Passive-ToneAudiometry.h5'
			'CMR02Head-20180829-150758-MMR-Physiology-Passive-NogosSupermasker.h5'
			'CMR02Head-20180829-151457-MMR-Physiology-Passive-1kToneSupermasker.h5'
			'CMR02Head-20180831-160711-MMR-Physiology-Active-1kToneSupermasker.h5'
			'CMR02Head-20180831-161735-MMR-Physiology-Passive-1kToneSupermasker.h5'
			'CMR02Head-20180902-125748-MMR-Physiology-Active-1kToneSupermasker.h5'
			'CMR02Head-20180904-104649-MMR-Physiology-Active-1kToneSupermasker.h5'
			'CMR02Head-20180906-103121-MMR-Physiology-Active-1kToneSupermasker.h5'
			'CMR02Head-20180906-105141-MMR-Physiology-Passive-1kToneSupermasker.h5'
			};
		excludeTrials = {
			};

	case 'CMR02Left'
		dataPath = '../Data/';
		dataFiles = {
			'CMR02Left-20181224-144458-MMR-Physiology-Passive-1kToneSupermasker.h5'
			};
		excludeTrials = {
			[2,3,4,41:47,60:66,75:79,89,91:93,117,119:122] ...
			% 33,37,40,55,59,69,95,100,107,108,141,142,] 
			};

	case 'CMR05Left'
		dataPath = '../Data-Booth1-EARS/';
		dataFiles = {
			'CMR05Left-20190116-141507-MMR-Physiology-Passive.h5'
			};
		excludeTrials = {
			};

	case 'CMR05Head'
		dataPath = '../Data-Booth1-EARS/';
		dataFiles = {
			'CMR05Head-20190124-143448-MMR-Physiology-Passive.h5'
			};
		excludeTrials = {
			};

	case 'CMR05Fluffy'    % second gerbil with great data
		dataPath = '../Data-Booth1-EARS/';
		dataFiles = {
% 			'CMR05Fluffy-20190401-122115-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190401-124337-MMR-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190401-125755-MMR-Physiology-Passive-ToneAudiometryHF.h5'
% 
% 			'CMR05Fluffy-20190404-153927-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190404-161448-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190404-173201-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190404-175010-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 
% 			'CMR05Fluffy-20190406-142553-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190406-150524-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190406-152742-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 
% 			'CMR05Fluffy-20190407-123026-MMR-Physiology-Passive.h5'
% 			'CMR05Fluffy-20190407-124020-IM-Physiology-Passive.h5'
% 			'CMR05Fluffy-20190407-152007-MMR-Physiology-Passive.h5'
% 			'CMR05Fluffy-20190407-153017-IM-Physiology-Passive.h5'
% 
% 			'CMR05Fluffy-20190408-141501-MMR-Physiology-Passive.h5'
% 			'CMR05Fluffy-20190408-143252-MMR-Physiology-Active-1kToneSupermsaker.h5'
% 			'CMR05Fluffy-20190408-151006-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190408-190508-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190408-191518-EM-Physiology-Passive-2kToneNotchedMasker.h5' %60dB
% 			'CMR05Fluffy-20190408-192952-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 
% 			'CMR05Fluffy-20190409-195133-MMR-Physiology-Passive.h5'
% 			'CMR05Fluffy-20190409-200535-IM-Physiology-Passive.h5'
% 
% 			'CMR05Fluffy-20190410-142040-MMR-Physiology-Passive.h5'
% 			'CMR05Fluffy-20190410-144132-MMR-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190410-150443-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190410-154432-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190410-162120-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190410-163624-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 
% 			'CMR05Fluffy-20190411-143107-MMR-Physiology-Passive.h5'
% 			'CMR05Fluffy-20190411-144717-IM-Physiology-Passive.h5'
% 
% 			'CMR05Fluffy-20190412-091052-MMR-Physiology-Passive.h5'
% 			'CMR05Fluffy-20190412-092821-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190412-100444-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190412-104006-MMR-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190412-110654-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190412-111805-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 
% 			'CMR05Fluffy-20190413-165032-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190413-170213-MMR-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190413-173714-MMR-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190413-174800-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 
% 			'CMR05Fluffy-20190414-120547-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190414-123030-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190414-130208-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190414-133337-MMR-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190414-140654-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190414-141559-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 
% 			'CMR05Fluffy-20190415-165601-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190415-170743-MMR-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190415-174402-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190415-175427-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190416-111932-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190416-113658-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190416-121639-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190416-141920-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190416-143104-IM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190416-144205-MMR-Physiology-Passive-ToneAudiometry.h5'
% 
% 			'CMR05Fluffy-20190417-150237-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190417-152127-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190417-153618-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190417-155150-MMR-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190418-110849-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190418-114629-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190418-151302-MMR-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190418-155228-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190418-160945-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 
% 			'CMR05Fluffy-20190419-103639-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190419-105837-MMR-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190419-115247-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190419-120813-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190420-123310-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190420-130127-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190420-133950-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190420-141435-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190420-142636-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190420-143831-MMR-Physiology-Passive-ToneAudiometry.h5'
% 
% 			'CMR05Fluffy-20190421-121048-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190421-122352-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190421-123554-MMR-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190421-131511-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190422-121943-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190422-130548-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190422-134521-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190422-142039-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190422-143225-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190422-144339-EM-Physiology-Passive-2kToneSilence.h5'
% 
% 			'CMR05Fluffy-20190423-145132-MMR-Physiology-Passive.h5'
% 			'CMR05Fluffy-20190423-152032-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190423-154054-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190423-160133-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190423-162253-EM-Physiology-Passive-2kToneSilence.h5'
% 			'CMR05Fluffy-20190423-164023-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190424-110722-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190424-115021-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190424-123118-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190424-154439-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190424-160509-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190424-162322-EM-Physiology-Passive-2kToneSilence.h5'
% 
% 			'CMR05Fluffy-20190425-105628-EM-Physiology-Passive-2kToneSilence.h5'
% 			'CMR05Fluffy-20190425-113031-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190425-114634-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190426-141344-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190426-144733-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190426-151449-MMR-Physiology-Passive-1kToneSilence.h5'
% 
% 			'CMR05Fluffy-20190427-133357-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190427-135944-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190427-141632-EM-Physiology-Passive-2kToneSilence.h5'
% 			'CMR05Fluffy-20190428-125957-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190428-134648-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190428-143459-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190429-143024-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190429-145125-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190429-151025-EM-Physiology-Passive-2kToneSilence.h5'
% 			'CMR05Fluffy-20190430-125112-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190430-132830-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190430-140508-MMR-Physiology-Active-1kToneSupermasker.h5'
% 
% 			'CMR05Fluffy-20190501-110528-EM-Physiology-Passive-2kToneSilence.h5'
% 			'CMR05Fluffy-20190501-112249-IM-Physiology-Passive-2kToneTonalMasker.h5'
% 			'CMR05Fluffy-20190501-114156-EM-Physiology-Passive-2kToneNotchedMasker.h5'
% 			'CMR05Fluffy-20190502-131827-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190502-135150-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190502-143405-MMR-Physiology-Passive-1kToneSupermasker.h5'

% 			'CMR05Fluffy-20190509-132509-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190509-135328-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190509-141616-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190510-152650-IM-Physiology-Passive-2kBeepGapModNoise.h5'
% 			'CMR05Fluffy-20190510-154007-IM-Physiology-Passive-2kBeepGapModTonal.h5'
% 			'CMR05Fluffy-20190510-154941-IM-Physiology-Passive-2kBeepGapFlatNoise.h5'
% 			'CMR05Fluffy-20190510-155947-IM-Physiology-Passive-2kBeepGapSilence.h5'
% 			'CMR05Fluffy-20190510-160952-IM-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190511-140859-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190511-143600-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190511-150044-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			
% 			'CMR05Fluffy-20190512-142413-IM-Physiology-Passive-2kBeepGapFlatNoise.h5'
% 			'CMR05Fluffy-20190512-143240-IM-Physiology-Passive-2kBeepGapModNoise.h5'
% 			'CMR05Fluffy-20190512-144120-IM-Physiology-Passive-2kBeepGapModTonal.h5'
% 			'CMR05Fluffy-20190512-144933-IM-Physiology-Passive-2kBeepGapSilence.h5'
% 			'CMR05Fluffy-20190512-145831-IM-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190513-130401-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190513-132905-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190513-135333-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190514-154415-IM-Physiology-Passive-2kBeepGapSilence.h5'
% 			'CMR05Fluffy-20190514-155332-IM-Physiology-Passive-2kBeepGapModTonal.h5'
% 			'CMR05Fluffy-20190514-160239-IM-Physiology-Passive-2kBeepGapModNoise.h5'
% 			'CMR05Fluffy-20190514-161322-IM-Physiology-Passive-2kBeepGapFlatNoise.h5'
% 			'CMR05Fluffy-20190514-162327-IM-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190515-151815-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190515-160910-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190515-163430-MMR-Physiology-Passive-1kToneSilence.h5'
% 			
% 			'CMR05Fluffy-20190516-160910-IM-Physiology-Passive-2kBeepGapModTonal.h5'
% 			'CMR05Fluffy-20190516-161858-IM-Physiology-Passive-2kBeepGapModNoise.h5'
% 			'CMR05Fluffy-20190516-163043-IM-Physiology-Passive-2kBeepGapFlatNoise.h5'
% 			'CMR05Fluffy-20190516-164042-IM-Physiology-Passive-2kBeepGapSilence.h5'
% 			'CMR05Fluffy-20190516-165004-IM-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190517-144317-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190517-152405-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190517-154829-MMR-Physiology-Passive-1kToneSilence.h5'
% 
% 			'CMR05Fluffy-20190521-105135-IM-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190521-111950-IM-Physiology-Passive-2kBeepGapModTonal.h5'
% 			'CMR05Fluffy-20190521-112946-IM-Physiology-Passive-2kBeepGapFlatNoise.h5'
% 			'CMR05Fluffy-20190521-113900-IM-Physiology-Passive-2kBeepGapSilence.h5'
% 			'CMR05Fluffy-20190521-114903-IM-Physiology-Passive-2kBeepGapModNoise.h5'
% 			'CMR05Fluffy-20190522-141750-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190522-143838-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190522-145923-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190524-143717-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190524-150235-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190524-152926-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190525-141819-IM-Physiology-Passive-2kBeepGapModTonal.h5'
% 			'CMR05Fluffy-20190525-143131-IM-Physiology-Passive-2kBeepGapFlatNoise.h5'
% 			'CMR05Fluffy-20190525-144047-IM-Physiology-Passive-2kBeepGapModNoise.h5'
% 			'CMR05Fluffy-20190525-145217-IM-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190525-152052-IM-Physiology-Passive-2kBeepGapSilence.h5'
% 			'CMR05Fluffy-20190528-163454-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190528-165813-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190528-175729-MMR-Physiology-Active-1kToneSupermasker.h5'
			
% 			'CMR05Fluffy-20190530-121138-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190530-123929-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190530-130004-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190530-141219-MMR-Physiology-Passive-2kBeepGapModTonal.h5'
% 			'CMR05Fluffy-20190530-142100-MMR-Physiology-Passive-2kBeepGapModNoise.h5'
% 			'CMR05Fluffy-20190530-142832-MMR-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190530-145045-MMR-Physiology-Passive-2kBeepGapFlatNoise.h5'
% 			'CMR05Fluffy-20190530-150906-MMR-Physiology-Passive-2kBeepGapSilence.h5'
% 			'CMR05Fluffy-20190531-133750-IM-Physiology-Passive-2kBeepGapSilence.h5'
% 			'CMR05Fluffy-20190531-134723-IM-Physiology-Passive-2kBeepGapFlatNoise.h5'
% 			'CMR05Fluffy-20190531-135601-IM-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190531-154017-IM-Physiology-Passive-2kBeepGapModNoise.h5'
% 			'CMR05Fluffy-20190531-155216-IM-Physiology-Passive-2kBeepGapModTonal.h5'
% 			'CMR05Fluffy-20190601-120458-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190601-123635-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190601-131520-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Fluffy-20190602-131944-IM-Physiology-Passive-2kBeepGapModTonal.h5'
% 			'CMR05Fluffy-20190602-133054-IM-Physiology-Passive-2kBeepGapModNoise.h5'
% 			'CMR05Fluffy-20190602-133901-IM-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Fluffy-20190602-151012-IM-Physiology-Passive-2kBeepGapSilence.h5'
% 			'CMR05Fluffy-20190602-152038-IM-Physiology-Passive-2kBeepGapFlatNoise.h5'
% 			'CMR05Fluffy-20190603-112121-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190603-115534-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190603-122522-MMR-Physiology-Passive-1kToneSilence.h5'

% 			'CMR05Fluffy-20190605-112028-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190605-115725-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Fluffy-20190605-134220-MMR-Physiology-Passive-1kToneSilence.h5'
			'CMR05Fluffy-20190607-124534-MMR-Physiology-Active-1kToneSupermasker.h5'
			'CMR05Fluffy-20190607-130355-MMR-Physiology-Passive-1kToneSupermasker.h5'
			'CMR05Fluffy-20190607-131839-MMR-Physiology-Passive-1kToneSilence.h5'
			};
		excludeTrials = {
		% 	[19 20 49 53 83 84 96 97 119 136 137 143 145:147 150 157:159 ...
		% 	172:174 181:185]
			};
		channels  = [1 3 6:14];
	
	case 'CMR05Tail'
		dataPath = '../Data-Booth1-EARS/';
		dataFiles = {
% 			'CMR05Tail-20190602-153404-MMR-Physiology.h5'

% 			'CMR05Tail-20190603-161221-MMR-Physiology-Passive-1kToneSupermasker.h5'

% 			'CMR05Tail-20190604-155816-MMR-Physiology-Passive-1kToneSupermasker.h5'

% 			'CMR05Tail-20190605-140655-MMR-Physiology-Passive-1kToneSupermasker.h5'

% 			'CMR05Tail-20190606-134035-MMR-Physiology-Passive-1kToneSupermasker.h5'

% 			'CMR05Tail-20190607-152156-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Tail-20190607-153433-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Tail-20190607-154556-MMR-Physiology-Passive-1kToneSilence.h5'
% 			'CMR05Tail-20190607-155640-AUD-Physiology-Passive-ToneAudiometry.h5'

% 			'CMR05Tail-20190608-130712-MMR-Physiology-Passive-1kToneSupermaskerTest.h5'
% 			'CMR05Tail-20190608-131613-IM-Physiology-Passive-2kBeepGapModTonal.h5'
% 			'CMR05Tail-20190608-132415-AUD-Physiology-Passive-ToneAudiometry.h5'
% 			'CMR05Tail-20190609-115550-MMR-Physiology-Active-1kToneSupermasker.h5'
% 			'CMR05Tail-20190609-145717-MMR-Physiology-Passive-1kToneSupermasker.h5'
% 			'CMR05Tail-20190609-154429-MMR-Physiology-Passive-1kToneSilence.h5'
			
			'CMR05Tail-20190610-132903-MMR-Physiology-Passive-1kToneSupermaskerTest.h5'
			'CMR05Tail-20190610-135357-IM-Physiology-Passive-2kBeepGapModTonal.h5'
			};
		excludeTrials = {};
		channels  = 1:14;
end

dataFiles = cellfun(@(dataFile){sprintf('%s/%s', ...
	animalName, dataFile)}, dataFiles);
