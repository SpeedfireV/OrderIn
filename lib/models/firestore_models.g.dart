// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderFirestore _$$_OrderFirestoreFromJson(Map<String, dynamic> json) =>
    _$_OrderFirestore(
      name: json['name'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$FilterOptionsEnumMap, json['category']),
      price: json['price'] as int,
      mainImage: json['mainImage'] as String,
      rating: json['rating'] as int,
      numberOfRating: json['numberOfRating'] as int,
      favourite: json['favourite'] as bool,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => $enumDecode(_$IngredientsEnumMap, e))
          .toList(),
      amount: json['amount'] as int?,
    );

Map<String, dynamic> _$$_OrderFirestoreToJson(_$_OrderFirestore instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'category': _$FilterOptionsEnumMap[instance.category]!,
      'price': instance.price,
      'mainImage': instance.mainImage,
      'rating': instance.rating,
      'numberOfRating': instance.numberOfRating,
      'favourite': instance.favourite,
      'ingredients':
          instance.ingredients.map((e) => _$IngredientsEnumMap[e]!).toList(),
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

const _$IngredientsEnumMap = {
  Ingredients.mushroom: 'mushroom',
  Ingredients.extraSoySauce: 'extra_soy_sauce',
  Ingredients.chiliFlakes: 'chili_flakes',
  Ingredients.kimchi: 'kimchi',
};
