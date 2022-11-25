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

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the DeliverySheet type in your schema. */
@immutable
class DeliverySheet extends Model {
  static const classType = const _DeliverySheetModelType();
  final String id;
  final TemporalDate? _delivery_sheet_date;
  final List<DeliveryTime>? _delivery_sheet_times;
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
  
  TemporalDate? get delivery_sheet_date {
    return _delivery_sheet_date;
  }
  
  List<DeliveryTime>? get delivery_sheet_times {
    return _delivery_sheet_times;
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
  
  const DeliverySheet._internal({required this.id, delivery_sheet_date, delivery_sheet_times, total_hrs, total_miles, createdAt, updatedAt}): _delivery_sheet_date = delivery_sheet_date, _delivery_sheet_times = delivery_sheet_times, _total_hrs = total_hrs, _total_miles = total_miles, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory DeliverySheet({String? id, TemporalDate? delivery_sheet_date, List<DeliveryTime>? delivery_sheet_times, double? total_hrs, double? total_miles}) {
    return DeliverySheet._internal(
      id: id == null ? UUID.getUUID() : id,
      delivery_sheet_date: delivery_sheet_date,
      delivery_sheet_times: delivery_sheet_times != null ? List<DeliveryTime>.unmodifiable(delivery_sheet_times) : delivery_sheet_times,
      total_hrs: total_hrs,
      total_miles: total_miles);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeliverySheet &&
      id == other.id &&
      _delivery_sheet_date == other._delivery_sheet_date &&
      DeepCollectionEquality().equals(_delivery_sheet_times, other._delivery_sheet_times) &&
      _total_hrs == other._total_hrs &&
      _total_miles == other._total_miles;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("DeliverySheet {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("delivery_sheet_date=" + (_delivery_sheet_date != null ? _delivery_sheet_date!.format() : "null") + ", ");
    buffer.write("total_hrs=" + (_total_hrs != null ? _total_hrs!.toString() : "null") + ", ");
    buffer.write("total_miles=" + (_total_miles != null ? _total_miles!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  DeliverySheet copyWith({String? id, TemporalDate? delivery_sheet_date, List<DeliveryTime>? delivery_sheet_times, double? total_hrs, double? total_miles}) {
    return DeliverySheet._internal(
      id: id ?? this.id,
      delivery_sheet_date: delivery_sheet_date ?? this.delivery_sheet_date,
      delivery_sheet_times: delivery_sheet_times ?? this.delivery_sheet_times,
      total_hrs: total_hrs ?? this.total_hrs,
      total_miles: total_miles ?? this.total_miles);
  }
  
  DeliverySheet.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _delivery_sheet_date = json['delivery_sheet_date'] != null ? TemporalDate.fromString(json['delivery_sheet_date']) : null,
      _delivery_sheet_times = json['delivery_sheet_times'] is List
        ? (json['delivery_sheet_times'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => DeliveryTime.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _total_hrs = (json['total_hrs'] as num?)?.toDouble(),
      _total_miles = (json['total_miles'] as num?)?.toDouble(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'delivery_sheet_date': _delivery_sheet_date?.format(), 'delivery_sheet_times': _delivery_sheet_times?.map((DeliveryTime? e) => e?.toJson()).toList(), 'total_hrs': _total_hrs, 'total_miles': _total_miles, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField DELIVERY_SHEET_DATE = QueryField(fieldName: "delivery_sheet_date");
  static final QueryField DELIVERY_SHEET_TIMES = QueryField(
    fieldName: "delivery_sheet_times",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (DeliveryTime).toString()));
  static final QueryField TOTAL_HRS = QueryField(fieldName: "total_hrs");
  static final QueryField TOTAL_MILES = QueryField(fieldName: "total_miles");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DeliverySheet";
    modelSchemaDefinition.pluralName = "DeliverySheets";
    
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
      key: DeliverySheet.DELIVERY_SHEET_DATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: DeliverySheet.DELIVERY_SHEET_TIMES,
      isRequired: false,
      ofModelName: (DeliveryTime).toString(),
      associatedKey: DeliveryTime.DELIVERY_SHEET
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DeliverySheet.TOTAL_HRS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DeliverySheet.TOTAL_MILES,
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

class _DeliverySheetModelType extends ModelType<DeliverySheet> {
  const _DeliverySheetModelType();
  
  @override
  DeliverySheet fromJson(Map<String, dynamic> jsonData) {
    return DeliverySheet.fromJson(jsonData);
  }
}