import 'package:expense_management_assignment_app/features/sales_expense.dart/domain/enums/quantity_type.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/domain/models/expense_item_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// Controller for managing state of the Add Item form.
/// Includes validation, value parsing, and total pricing logic.
class AddItemController extends ChangeNotifier {
  // ---------------------- 📦 Item Name ----------------------
  String _itemName = '';
  String get itemName => _itemName;

  void setItemName(String value) {
    _itemName = value;
    notifyListeners();
  }

  // ---------------------- 🔢 Quantity ----------------------
  double? _quantity;
  String _quantityText = '';
  double? get quantity => _quantity;
  String get quantityText => _quantityText;

  void setQuantity(String value) {
    _quantityText = value;
    _quantity = double.tryParse(value);
    notifyListeners();
  }

  // ---------------------- 📊 Quantity Type ----------------------
  QuantityType? _quantityType;
  QuantityType? get quantityType => _quantityType;

  void setQuantityType(QuantityType? type) {
    _quantityType = type;
    notifyListeners();
  }

  // ---------------------- 💰 Total Price ----------------------
  double? _totalPrice;
  String _totalPriceText = '';
  double? get totalPrice => _totalPrice;
  String get totalPriceText => _totalPriceText;

  void setTotalPrice(String value) {
    _totalPriceText = value;
    _totalPrice = double.tryParse(value);
    notifyListeners();
  }

  // ---------------------- ✅ Validity ----------------------
  bool get isFormValid =>
      _itemName.trim().isNotEmpty &&
      _quantity != null &&
      _quantityType != null &&
      _totalPrice != null;

  /// Only returns `true` if form is valid — no error setting
  bool validateAllFields() => isFormValid;

  // ---------------------- 🔁 Reset ----------------------
  void reset({bool listen = false}) {
    _itemName = '';
    _quantity = null;
    _quantityText = '';
    _quantityType = null;
    _totalPrice = null;
    _totalPriceText = '';
    if (listen) {
      notifyListeners();
    }
  }

  // ---------------------- 🧾 Convert to ExpenseItemModel ----------------------
  ExpenseItemModel toExpenseItem() {
    return ExpenseItemModel(
      id: const Uuid().v4(),
      itemName: _itemName,
      totalQuantityPurchased: _quantity!,
      quantityType: _quantityType!,
      totalItemPricing: _totalPrice!,
    );
  }
}
