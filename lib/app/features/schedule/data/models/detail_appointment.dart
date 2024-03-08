class DetailAppointmentModel {
  String? startAt;
  String? endAt;
  String? status;
  CustomerDetailModel? customer;
  PatientDetailModel? patient;
  ServiceModel? service;
  PatientTreatmentsModel? patientTreatments;

  DetailAppointmentModel(
      {this.startAt,
      this.endAt,
      this.status,
      this.customer,
      this.patient,
      this.service,
      this.patientTreatments});

  DetailAppointmentModel.fromJson(Map<String, dynamic> json) {
    startAt = json['startAt'];
    endAt = json['endAt'];
    status = json['status'];
    customer = json['customer'] != null
        ? new CustomerDetailModel.fromJson(json['customer'])
        : null;
    patient = json['patient'] != null
        ? new PatientDetailModel.fromJson(json['patient'])
        : null;
    service = json['service'] != null
        ? new ServiceModel.fromJson(json['service'])
        : null;
    patientTreatments = json['patientTreatments'] != null
        ? new PatientTreatmentsModel.fromJson(json['patientTreatments'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['startAt'] = this.startAt;
    data['endAt'] = this.endAt;
    data['status'] = this.status;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    if (this.patientTreatments != null) {
      data['patientTreatments'] = this.patientTreatments!.toJson();
    }
    return data;
  }
}

class CustomerDetailModel {
  String? name;
  String? address;
  String? phone;
  String? email;
  String? gender;
  String? nik;

  CustomerDetailModel(
      {this.name, this.address, this.phone, this.email, this.gender});

  CustomerDetailModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    gender = json['gender'];
    nik = json['nik'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['nik'] = this.nik;
    return data;
  }
}

class PatientDetailModel {
  String? name;
  String? address;
  String? phone;
  String? birthdate;
  String? symptoms;
  String? gender;
  String? nik;
  String? avatar;

  PatientDetailModel(
      {this.name,
      this.address,
      this.phone,
      this.birthdate,
      this.symptoms,
      this.gender,
      this.nik,
      this.avatar});

  PatientDetailModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    birthdate = json['birthdate'];
    symptoms = json['symptoms'];
    gender = json['gender'];
    nik = json['nik'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['birthdate'] = this.birthdate;
    data['symptoms'] = this.symptoms;
    data['gender'] = this.gender;
    data['nik'] = this.nik;
    data['avatar'] = this.avatar;

    return data;
  }
}

class ServiceModel {
  String? productName;
  String? productDesc;

  ServiceModel({this.productName, this.productDesc});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    productDesc = json['productDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['productDesc'] = this.productDesc;
    return data;
  }
}

class PatientTreatmentsModel {
  int? functionalAbility;
  int? standingAbility;
  int? liftingAbility;
  int? dailyActivity;
  String? treatments;
  String? treatmentPlans;
  String? notes;

  PatientTreatmentsModel(
      {this.functionalAbility,
      this.standingAbility,
      this.liftingAbility,
      this.dailyActivity,
      this.treatments,
      this.treatmentPlans,
      this.notes});

  PatientTreatmentsModel.fromJson(Map<String, dynamic> json) {
    functionalAbility = json['functionalAbility'];
    standingAbility = json['standingAbility'];
    liftingAbility = json['liftingAbility'];
    dailyActivity = json['dailyActivity'];
    treatments = json['treatments'];
    treatmentPlans = json['treatmentPlans'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['functionalAbility'] = this.functionalAbility;
    data['standingAbility'] = this.standingAbility;
    data['liftingAbility'] = this.liftingAbility;
    data['dailyActivity'] = this.dailyActivity;
    data['treatments'] = this.treatments;
    data['treatmentPlans'] = this.treatmentPlans;
    data['notes'] = this.notes;
    return data;
  }
}
