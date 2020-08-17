% maskingとcoastlineを読み取るコード
% Code by Takagi 
% 2020/03/26 修正済み

% coastlineのデータ
drive = 'E:';
load([drive,'\B4research\in\analysed_haiyan_data\other_data\coastline360.mat']);
% 緯度・経度のデータを読み取る
fname = [drive,'\B4research\Haiyan_calculation_result_nc\Wdir\grid\wrfoutgrid_haiyan_d01_2013-11-05_00%3A00%3A00.nc'];
latitude = rot90(ncread(fname,'XLAT'));
longtitude = rot90(ncread(fname,'XLONG'));
Lat = latitude(:,:,1);
Lon = longtitude(:,:,1);
% 海と陸のmasking
masking = rot90(ncread(fname,'LANDMASK'));
% 陸地に相当するセルの位置を抽出
num_nan = find(masking(:,:,1)==1);

% coastlineのうちドメイン外のデータをNaNとする
lat_rm = find(lat_coast>max(max(Lat)) | lat_coast<min(min(Lat)));
lon_rm= find(lon_coast>max(max(Lon)) | lon_coast<min(min(Lon)));
lat_coast(lat_rm) = NaN;
lon_coast(lon_rm) = NaN;

matname = [drive,'\B4research\in\analysed_haiyan_data\other_data\coastalline_and_lonlat.mat'];
save(matname,'Lat','Lon','lat_coast','lon_coast','num_nan','masking')