% WRFデータの瞬間値を読み込むコード
% Code by Takagi
% 2020/03/28 修正
% caseと対象のパラメータを指定
drive = 'E:';
case_name = 'Wdir';
parametername = 'SST';
dir_name = 'SST';

% 11/05
fname = [drive,'\B4research\Haiyan_calculation_result_nc\',case_name,'\WRF_domain1\wrfout2d_haiyan_d01_2013-11-05_00%3A00%3A00.nc'];
 para_1105 = rot90(ncread(fname,parametername));

%  11/06
fname = [drive,'\B4research\Haiyan_calculation_result_nc\',case_name,'\WRF_domain1\wrfout2d_haiyan_d01_2013-11-06_00%3A00%3A00.nc'];
 para_1106 = rot90(ncread(fname,parametername));

 %  11/07
fname = [drive,'\B4research\Haiyan_calculation_result_nc\',case_name,'\WRF_domain1\wrfout2d_haiyan_d01_2013-11-07_00%3A00%3A00.nc'];
para_1107 = rot90(ncread(fname,parametername));

%  11/08
fname = [drive,'\B4research\Haiyan_calculation_result_nc\',case_name,'\WRF_domain1\wrfout2d_haiyan_d01_2013-11-08_00%3A00%3A00.nc'];
para_1108 = rot90(ncread(fname,parametername));

%  11/08
fname = [drive,'\B4research\Haiyan_calculation_result_nc\',case_name,'\WRF_domain1\wrfout2d_haiyan_d01_2013-11-09_00%3A00%3A00.nc'];
para_1109 = rot90(ncread(fname,parametername));

%  11/10
fname = [drive,'\B4research\Haiyan_calculation_result_nc\',case_name,'\WRF_domain1\wrfout2d_haiyan_d01_2013-11-10_00%3A00%3A00.nc'];
para_1110 = rot90(ncread(fname,parametername));

output_data = cat(3,para_1105,para_1106,para_1107,para_1108,para_1109,para_1110);
% データをsave
dir_savename = [drive,'\B4research\in\analysed_haiyan_data\WRF\',case_name,'\',dir_name];
if exist(dir_savename) == 0
    mkdir(dir_savename)
end
matname = [drive,'\B4research\in\analysed_haiyan_data\WRF\',case_name,'\',dir_name,'\',dir_name,'_data.mat'];
save(matname,'output_data')





