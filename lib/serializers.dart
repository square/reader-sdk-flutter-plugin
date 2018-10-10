
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'models.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Money,
  Location,
  CheckoutResult,
  Tender,
  CardDetails,
  CashDetails,
  Card,
  CheckoutParameters,
  TipSettings,
])

final Serializers serializers = _$serializers;