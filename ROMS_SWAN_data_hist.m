% ROMS�ESWAN�f�[�^�̏u�Ԓl��ǂݍ��ރR�[�h
% Code by Takagi
% 2020/03/28 �C��
% case�ƑΏۂ̃p�����[�^���w��
drive = 'E:';
case_name = 'FT05';
parametername = 'salt';
dir_name = 'salinity';

%1�ڂ̃f�[�^
fname = [drive,'\B4research\Haiyan_calculation_result_nc\',case_name,'\ROMS\ocean_his_haiyan_lowres.nc'];
output_data = rot90(ncread(fname,parametername));

% �f�[�^��save
dir_savename = [drive,'\B4research\in\analysed_haiyan_data\ROMS\',case_name,'\',dir_name];
if exist(dir_savename) == 0
    mkdir(dir_savename)
end
matname = [drive,'\B4research\in\analysed_haiyan_data\ROMS\',case_name,'\',dir_name,'\',dir_name,'_data.mat'];
save(matname,'output_data')