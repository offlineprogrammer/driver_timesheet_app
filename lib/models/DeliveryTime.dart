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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the DeliveryTime type in your schema. */
@immutable
class DeliveryTime extends Model {
  static const classType = const _DeliveryTimeModelType();
  final String id;
  final TemporalTime? _time_in;
  final TemporalTime? _time_out;
  final DeliverySheet? _delivery_sheet;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalTime? get time_in {
    return _time_in;
  }
  
  TemporalTime? get time_out {
    return _time_out;
  }
  
  DeliverySheet get delivery_sheet {
    try {
      return _delivery_sheet!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const DeliveryTime._internal({required this.id, time_in, time_out, required delivery_sheet, createdAt, updatedAt}): _time_in = time_in, _time_out = time_out, _delivery_sheet = delivery_sheet, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory DeliveryTime({String? id, TemporalTime? time_in, TemporalTime? time_out, required DeliverySheet delivery_sheet}) {
    return DeliveryTime._internal(
      id: id == null ? UUID.getUUID() : id,
      time_in: time_in,
      time_out: time_out,
      delivery_sheet: delivery_sheet);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeliveryTime &&
      id == other.id &&
      _time_in == other._time_in &&
      _time_out == other._time_out &&
      _delivery_sheet == other._delivery_sheet;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("DeliveryTime {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("time_in=" + (_time_in != null ? _time_in!.format() : "null") + ", ");
    buffer.write("time_out=" + (_time_out != null ? _time_out!.format() : "null") + ", ");
    buffer.write("delivery_sheet=" + (_delivery_sheet != null ? _delivery_sheet!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  DeliveryTime copyWith({String? id, TemporalTime? time_in, TemporalTime? time_out, DeliverySheet? delivery_sheet}) {
    return DeliveryTime._internal(
      id: id ?? this.id,
      time_in: time_in ?? this.time_in,
      time_out: time_out ?? this.time_out,
      delivery_sheet: delivery_sheet ?? this.delivery_sheet);
  }
  
  DeliveryTime.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _time_in = json['time_in'] != null ? TemporalTime.fromString(json['time_in']) : null,
      _time_out = json['time_out'] != null ? TemporalTime.fromString(json['time_out']) : null,
      _delivery_sheet = json['delivery_sheet']?['serializedData'] != null
        ? DeliverySheet.fromJson(new Map<String, dynamic>.from(json['delivery_sheet']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'time_in': _time_in?.format(), 'time_out': _time_out?.format(), 'delivery_sheet': _delivery_sheet?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField TIME_IN = QueryField(fieldName: "time_in");
  static final QueryField TIME_OUT = QueryField(fieldName: "time_out");
  static final QueryField DELIVERY_SHEET = QueryField(
    fieldName: "delivery_sheet",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (DeliverySheet).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DeliveryTime";
    modelSchemaDefinition.pluralName = "DeliveryTimes";
    
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
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["deliverySheetID"], name: "byDeliverySheet")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DeliveryTime.TIME_IN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: DeliveryTime.TIME_OUT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: DeliveryTime.DELIVERY_SHEET,
      isRequired: true,
      targetName: "deliverySheetID",
      ofModelName: (DeliverySheet).toString()
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

class _DeliveryTimeModelType extends ModelType<DeliveryTime> {
  const _DeliveryTimeModelType();
  
  @override
  DeliveryTime fromJson(Map<String, dynamic> jsonData) {
    return DeliveryTime.fromJson(jsonData);
  }
}