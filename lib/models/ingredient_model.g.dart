// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ingredient _$$_IngredientFromJson(Map<String, dynamic> json) =>
    _$_Ingredient(
      ingredientEnum: $enumDecode(_$IngredientsEnumMap, json['ingredientEnum']),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$_IngredientToJson(_$_Ingredient instance) =>
    <String, dynamic>{
      'ingredientEnum': _$IngredientsEnumMap[instance.ingredientEnum]!,
      'active': instance.active,
    };

const _$IngredientsEnumMap = {
  Ingredients.mushroom: 'mushroom',
  Ingredients.extraSoySauce: 'extraSoySauce',
  Ingredients.chiliFlakes: 'chiliFlakes',
  Ingredients.kimchi: 'kimchi',
};
