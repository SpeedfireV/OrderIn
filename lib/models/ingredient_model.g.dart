// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientImpl _$$IngredientImplFromJson(Map<String, dynamic> json) =>
    _$IngredientImpl(
      ingredientEnum: $enumDecode(_$IngredientsEnumMap, json['ingredientEnum']),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$IngredientImplToJson(_$IngredientImpl instance) =>
    <String, dynamic>{
      'ingredientEnum': _$IngredientsEnumMap[instance.ingredientEnum]!,
      'active': instance.active,
    };

const _$IngredientsEnumMap = {
  Ingredients.mushroom: 'mushroom',
  Ingredients.extraSoySauce: 'extra_soy_sauce',
  Ingredients.chiliFlakes: 'chili_flakes',
  Ingredients.kimchi: 'kimchi',
};
