% masking��coastline��ǂݎ��R�[�h
% Code by Takagi 
% 2020/03/26 �C���ς�

% coastline�̃f�[�^
drive = 'E:';
load([drive,'\B4research\in\analysed_haiyan_data\other_data\coastline360.mat']);
% �ܓx�E�o�x�̃f�[�^��ǂݎ��
fname = [drive,'\B4research\Haiyan_calculation_result_nc\Wdir\grid\wrfoutgrid_haiyan_d01_2013-11-05_00%3A00%3A00.nc'];
latitude = rot90(ncread(fname,'XLAT'));
longtitude = rot90(ncread(fname,'XLONG'));
Lat = latitude(:,:,1);
Lon = longtitude(:,:,1);
% �C�Ɨ���masking
masking = rot90(ncread(fname,'LANDMASK'));
% ���n�ɑ�������Z���̈ʒu�𒊏o
num_nan = find(masking(:,:,1)==1);

% coastline�̂����h���C���O�̃f�[�^��NaN�Ƃ���
lat_rm = find(lat_coast>max(max(Lat)) | lat_coast<min(min(Lat)));
lon_rm= find(lon_coast>max(max(Lon)) | lon_coast<min(min(Lon)));
lat_coast(lat_rm) = NaN;
lon_coast(lon_rm) = NaN;

matname = [drive,'\B4research\in\analysed_haiyan_data\other_data\coastalline_and_lonlat.mat'];
save(matname,'Lat','Lon','lat_coast','lon_coast','num_nan','masking')