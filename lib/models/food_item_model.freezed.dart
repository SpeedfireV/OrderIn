// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodItem _$FoodItemFromJson(Map<String, dynamic> json) {
  return _FoodItem.fromJson(json);
}

/// @nodoc
mixin _$FoodItem {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  FilterOptions get category => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get mainImage => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  int get numberOfRating => throw _privateConstructorUsedError;
  bool get favourite => throw _privateConstructorUsedError;
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  int? get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodItemCopyWith<FoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemCopyWith<$Res> {
  factory $FoodItemCopyWith(FoodItem value, $Res Function(FoodItem) then) =
      _$FoodItemCopyWithImpl<$Res, FoodItem>;
  @useResult
  $Res call(
      {String name,
      String description,
      FilterOptions category,
      int price,
      String mainImage,
      int rating,
      int numberOfRating,
      bool favourite,
      List<Ingredient> ingredients,
      int? amount});
}

/// @nodoc
class _$FoodItemCopyWithImpl<$Res, $Val extends FoodItem>
    implements $FoodItemCopyWith<$Res> {
  _$FoodItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? price = null,
    Object? mainImage = null,
    Object? rating = null,
    Object? numberOfRating = null,
    Object? favourite = null,
    Object? ingredients = null,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FilterOptions,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      mainImage: null == mainImage
          ? _value.mainImage
          : mainImage // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfRating: null == numberOfRating
          ? _value.numberOfRating
          : numberOfRating // ignore: cast_nullable_to_non_nullable
              as int,
      favourite: null == favourite
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as bool,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodItemImplCopyWith<$Res>
    implements $FoodItemCopyWith<$Res> {
  factory _$$FoodItemImplCopyWith(
          _$FoodItemImpl value, $Res Function(_$FoodItemImpl) then) =
      __$$FoodItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      FilterOptions category,
      int price,
      String mainImage,
      int rating,
      int numberOfRating,
      bool favourite,
      List<Ingredient> ingredients,
      int? amount});
}

/// @nodoc
class __$$FoodItemImplCopyWithImpl<$Res>
    extends _$FoodItemCopyWithImpl<$Res, _$FoodItemImpl>
    implements _$$FoodItemImplCopyWith<$Res> {
  __$$FoodItemImplCopyWithImpl(
      _$FoodItemImpl _value, $Res Function(_$FoodItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? price = null,
    Object? mainImage = null,
    Object? rating = null,
    Object? numberOfRating = null,
    Object? favourite = null,
    Object? ingredients = null,
    Object? amount = freezed,
  }) {
    return _then(_$FoodItemImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as FilterOptions,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      mainImage: null == mainImage
          ? _value.mainImage
          : mainImage // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfRating: null == numberOfRating
          ? _value.numberOfRating
          : numberOfRating // ignore: cast_nullable_to_non_nullable
              as int,
      favourite: null == favourite
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as bool,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodItemImpl with DiagnosticableTreeMixin implements _FoodItem {
  const _$FoodItemImpl(
      {required this.name,
      required this.description,
      required this.category,
      required this.price,
      required this.mainImage,
      required this.rating,
      required this.numberOfRating,
      required this.favourite,
      required final List<Ingredient> ingredients,
      this.amount})
      : _ingredients = ingredients;

  factory _$FoodItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodItemImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final FilterOptions category;
  @override
  final int price;
  @override
  final String mainImage;
  @override
  final int rating;
  @override
  final int numberOfRating;
  @override
  final bool favourite;
  final List<Ingredient> _ingredients;
  @override
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final int? amount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FoodItem(name: $name, description: $description, category: $category, price: $price, mainImage: $mainImage, rating: $rating, numberOfRating: $numberOfRating, favourite: $favourite, ingredients: $ingredients, amount: $amount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FoodItem'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('mainImage', mainImage))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('numberOfRating', numberOfRating))
      ..add(DiagnosticsProperty('favourite', favourite))
      ..add(DiagnosticsProperty('ingredients', ingredients))
      ..add(DiagnosticsProperty('amount', amount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodItemImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.mainImage, mainImage) ||
                other.mainImage == mainImage) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.numberOfRating, numberOfRating) ||
                other.numberOfRating == numberOfRating) &&
            (identical(other.favourite, favourite) ||
                other.favourite == favourite) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      category,
      price,
      mainImage,
      rating,
      numberOfRating,
      favourite,
      const DeepCollectionEquality().hash(_ingredients),
      amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodItemImplCopyWith<_$FoodItemImpl> get copyWith =>
      __$$FoodItemImplCopyWithImpl<_$FoodItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodItemImplToJson(
      this,
    );
  }
}

abstract class _FoodItem implements FoodItem {
  const factory _FoodItem(
      {required final String name,
      required final String description,
      required final FilterOptions category,
      required final int price,
      required final String mainImage,
      required final int rating,
      required final int numberOfRating,
      required final bool favourite,
      required final List<Ingredient> ingredients,
      final int? amount}) = _$FoodItemImpl;

  factory _FoodItem.fromJson(Map<String, dynamic> json) =
      _$FoodItemImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  FilterOptions get category;
  @override
  int get price;
  @override
  String get mainImage;
  @override
  int get rating;
  @override
  int get numberOfRating;
  @override
  bool get favourite;
  @override
  List<Ingredient> get ingredients;
  @override
  int? get amount;
  @override
  @JsonKey(ignore: true)
  _$$FoodItemImplCopyWith<_$FoodItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
