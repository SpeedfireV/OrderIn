// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodItem _$$_FoodItemFromJson(Map<String, dynamic> json) => _$_FoodItem(
      name: json['name'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$SortingOptionsEnumMap, json['category']),
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

Map<String, dynamic> _$$_FoodItemToJson(_$_FoodItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'category': _$SortingOptionsEnumMap[instance.category]!,
      'price': instance.price,
      'mainImage': instance.mainImage,
      'rating': instance.rating,
      'numberOfRating': instance.numberOfRating,
      'favourite': instance.favourite,
      'ingredients': instance.ingredients,
      'amount': instance.amount,
    };

const _$SortingOptionsEnumMap = {
  FilterOptions.all: 'all',
  FilterOptions.burgers: 'burgers',
  FilterOptions.pizza: 'pizza',
  FilterOptions.salads: 'salads',
  FilterOptions.noodles: 'noodles',
  FilterOptions.drinks: 'drinks',
};
