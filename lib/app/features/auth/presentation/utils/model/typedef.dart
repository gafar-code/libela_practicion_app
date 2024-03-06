import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:libela_practition/app/features/auth/domain/entities/cities.dart';
import 'package:libela_practition/app/features/auth/domain/entities/professions.dart';
import 'package:libela_practition/app/features/auth/domain/entities/specialization.dart';

import '../../../domain/entities/provinces.dart';
import '../../../domain/entities/service_area.dart';
import '../../../domain/entities/uploaded_file.dart';

typedef MemberId = int;
typedef Message = String;
typedef Status = String;
typedef Token = String;
typedef OtpToken = String;
typedef IsSuccess = bool;
typedef JSON = Map<String, dynamic>;
typedef ProvinciesList = List<ProvincesEntity>;
typedef ProvinciesLoading = bool;
typedef Provinces = ProvincesEntity;
typedef ProvinceId = int;
typedef ProfessionId = String;

typedef CitiesList = List<CitiesEntity>;
typedef CitiesLoading = bool;
typedef Cities = CitiesEntity;
typedef RegisterLoading = bool;
typedef SendOtpLoading = bool;
typedef VerifyOtpLoading = bool;
typedef ChangePhoneLoading = bool;

typedef ProffesionList = List<ProfessionsEntity>;
typedef ProffesionLoading = bool;
typedef Proffesion = ProfessionsEntity;
typedef ProffesionId = String;

typedef SpecializationList = List<SpecializationEntity>;
typedef SpecializationLoading = bool;
typedef Specialization = SpecializationEntity;
typedef Specializations = List<SpecializationEntity>;

typedef ServiceAreaList = List<ServiceAreaEntity>;
typedef ServiceAreaLoading = bool;
typedef ServiceArea = ServiceAreaEntity;

typedef UploadedStr = UploadedFile;
typedef UploadedSip = UploadedFile;
typedef UploadedKtp = UploadedFile;

typedef UploadedStrLoading = bool;
typedef UploadedSipLoading = bool;
typedef UploadedKtpLoading = bool;

typedef UploadPersonalDataLoading = bool;
typedef UploadEmailDataLoading = bool;
typedef UploadProfessionDataLoading = bool;
typedef UploadServiceAreaDataLoading = bool;
typedef UploadDocumentDataLoading = bool;

typedef DraggedAddress = (String address, LatLng latLng, Placemark? placemark);
