/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Delivery type in your schema. */
@immutable
class Delivery extends Model {
  static const classType = const _DeliveryModelType();
  final String id;
  final TemporalDate? _delivery_date;
  final List<DeliveryTime>? _delivery_times;
  final double? _total_hrs;
  final double? _total_miles;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalDate? get delivery_date {
    return _delivery_date;
  }
  
  List<DeliveryTime>? get delivery_times {
    return _delivery_times;
  }
  
  double? get total_hrs {
    return _total_hrs;
  }
  
  double? get total_miles {
    return _total_miles;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Delivery._internal({required this.id, delivery_date, delivery_times, total_hrs, total_miles, createdAt, updatedAt}): _delivery_date = delivery_date, _delivery_times = delivery_times, _total_hrs = total_hrs, _total_miles = total_miles, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Delivery({String? id, TemporalDate? delivery_date, List<DeliveryTime>? delivery_times, double? total_hrs, double? total_miles}) {
    return Delivery._internal(
      id: id == null ? UUID.getUUID() : id,
      delivery_date: delivery_date,
      delivery_times: delivery_times != null ? List<DeliveryTime>.unmodifiable(delivery_times) : delivery_times,
      total_hrs: total_hrs,
      total_miles: total_miles);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Delivery &&
      id == other.id &&
      _delivery_date == other._delivery_date &&
      DeepCollectionEquality().equals(_delivery_times, other._delivery_times) &&
      _total_hrs == other._total_hrs &&
      _total_miles == other._total_miles;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Delivery {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("delivery_date=" + (_delivery_date != null ? _delivery_date!.format() : "null") + ", ");
    buffer.write("total_hrs=" + (_total_hrs != null ? _total_hrs!.toString() : "null") + ", ");
    buffer.write("total_miles=" + (_total_miles != null ? _total_miles!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Delivery copyWith({String? id, TemporalDate? delivery_date, List<DeliveryTime>? delivery_times, double? total_hrs, double? total_miles}) {
    return Delivery._internal(
      id: id ?? this.id,
      delivery_date: delivery_date ?? this.delivery_date,
      delivery_times: delivery_times ?? this.delivery_times,
      total_hrs: total_hrs ?? this.total_hrs,
      total_miles: total_miles ?? this.total_miles);
  }
  
  Delivery.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _delivery_date = json['delivery_date'] != null ? TemporalDate.fromString(json['delivery_date']) : null,
      _delivery_times = json['delivery_times'] is List
        ? (json['delivery_times'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => DeliveryTime.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _total_hrs = (json['total_hrs'] as num?)?.toDouble(),
      _total_miles = (json['total_miles'] as num?)?.toDouble(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'delivery_date': _delivery_date?.format(), 'delivery_times': _delivery_times?.map((DeliveryTime? e) => e?.toJson()).toList(), 'total_hrs': _total_hrs, 'total_miles': _total_miles, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "delivery.id");
  static final QueryField DELIVERY_DATE = QueryField(fieldName: "delivery_date");
  static final QueryField DELIVERY_TIMES = QueryField(
    fieldName: "delivery_times",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (DeliveryTime).toString()));
  static final QueryField TOTAL_HRS = QueryField(fieldName: "total_hrs");
  static final QueryField TOTAL_MILES = QueryField(fieldName: "total_miles");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Delivery";
    modelSchemaDefinition.pluralName = "Deliveries";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: AuthRuleProvider.USERPOOLS,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Delivery.DELIVERY_DATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Delivery.DELIVERY_TIMES,
      isRequired: false,
      ofModelName: (DeliveryTime).toString(),
      associatedKey: DeliveryTime.DELIVERY
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Delivery.TOTAL_HRS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Delivery.TOTAL_MILES,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _DeliveryModelType extends ModelType<Delivery> {
  const _DeliveryModelType();
  
  @override
  Delivery fromJson(Map<String, dynamic> jsonData) {
    return Delivery.fromJson(jsonData);
  }
}