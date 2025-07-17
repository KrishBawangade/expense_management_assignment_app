// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../enums/quantity_type.dart';

/// Represents a single item within an expense.
class ExpenseItemModel {
  /// Unique ID of the item (within the expense).
  final String id;

  /// Name of the item purchased (e.g., Aashirvaad Aata).
  final String itemName;

  /// Total quantity of the item purchased (e.g., 2.5).
  final double totalQuantityPurchased;

  /// Unit of measurement for the quantity (e.g., Kg, Litre).
  final QuantityType quantityType;

  /// Total price paid for this item.
  final double totalItemPricing;

  /// copywith method
  const ExpenseItemModel({
    required this.id,
    required this.itemName,
    required this.totalQuantityPurchased,
    required this.quantityType,
    required this.totalItemPricing,
  });

  ExpenseItemModel copyWith({
    String? id,
    String? itemName,
    double? totalQuantityPurchased,
    QuantityType? quantityType,
    double? totalItemPricing,
  }) {
    return ExpenseItemModel(
      id: id ?? this.id,
      itemName: itemName ?? this.itemName,
      totalQuantityPurchased: totalQuantityPurchased ?? this.totalQuantityPurchased,
      quantityType: quantityType ?? this.quantityType,
      totalItemPricing: totalItemPricing ?? this.totalItemPricing,
    );
  }
}
