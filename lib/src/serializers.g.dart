// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AdditionalPaymentType.serializer)
      ..add(Brand.serializer)
      ..add(Card.serializer)
      ..add(CardDetails.serializer)
      ..add(CashDetails.serializer)
      ..add(CheckoutParameters.serializer)
      ..add(CheckoutResult.serializer)
      ..add(EntryMethod.serializer)
      ..add(ErrorCode.serializer)
      ..add(Location.serializer)
      ..add(Money.serializer)
      ..add(Tender.serializer)
      ..add(TenderType.serializer)
      ..add(TipSettings.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(AdditionalPaymentType)]),
          () => new ListBuilder<AdditionalPaymentType>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Tender)]),
          () => new ListBuilder<Tender>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>()))
    .build();
