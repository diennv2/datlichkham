// To parse this JSON data, do
//
//     final tenantModel = tenantModelFromJson(jsonString);

import 'dart:convert';

TenantModel tenantModelFromJson(String str) =>
    TenantModel.fromJson(json.decode(str));

String tenantModelToJson(TenantModel data) => json.encode(data.toJson());

class TenantModel {
  TenantModel({
    this.tenantId,
    this.tenantName,
  });

  int? tenantId;
  String? tenantName;

  factory TenantModel.fromJson(Map<String, dynamic> json) => TenantModel(
        tenantId: json["tenantId"],
        tenantName: json["tenantName"],
      );

  Map<String, dynamic> toJson() => {
        "tenantId": tenantId,
        "tenantName": tenantName,
      };
}
