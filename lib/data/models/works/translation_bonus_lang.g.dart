// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_bonus_lang.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranslationBonusLangImpl _$$TranslationBonusLangImplFromJson(
        Map<String, dynamic> json) =>
    _$TranslationBonusLangImpl(
      price: (json['price'] as num?)?.toInt(),
      status: json['status'] as String?,
      priceTax: (json['price_tax'] as num?)?.toInt(),
      childCount: (json['child_count'] as num?)?.toInt(),
      priceInTax: (json['price_in_tax'] as num?)?.toInt(),
      recipientMax: (json['recipient_max'] as num?)?.toInt(),
      recipientAvailableCount:
          (json['recipient_available_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TranslationBonusLangImplToJson(
        _$TranslationBonusLangImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'status': instance.status,
      'price_tax': instance.priceTax,
      'child_count': instance.childCount,
      'price_in_tax': instance.priceInTax,
      'recipient_max': instance.recipientMax,
      'recipient_available_count': instance.recipientAvailableCount,
    };
