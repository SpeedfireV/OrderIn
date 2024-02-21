// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodItemImpl _$$FoodItemImplFromJson(Map<String, dynamic> json) =>
    _$FoodItemImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$FilterOptionsEnumMap, json['category']),
      price: json['price'] as int,
      mainImage: json['mainImage'] as String,
      rating: json['rating'] as int,
      numberOfRating: json['numberOfRating'] as int,
      favourite: json['favourite'] as bool,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      amount: json['amount'] as int?,
    );

Map<String, dynamic> _$$FoodItemImplToJson(_$FoodItemImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'category': _$FilterOptionsEnumMap[instance.category]!,
      'price': instance.price,
      'mainImage': instance.mainImage,
      'rating': instance.rating,
      'numberOfRating': instance.numberOfRating,
      'favourite': instance.favourite,
      'ingredients': instance.ingredients,
      'amount': instance.amount,
    };

const _$FilterOptionsEnumMap = {
  FilterOptions.all: 'all',
  FilterOptions.burgers: 'burgers',
  FilterOptions.pizza: 'pizza',
  FilterOptions.salads: 'salads',
  FilterOptions.noodles: 'noodles',
  FilterOptions.drinks: 'drinks',
  FilterOptions.special: 'special',
};
