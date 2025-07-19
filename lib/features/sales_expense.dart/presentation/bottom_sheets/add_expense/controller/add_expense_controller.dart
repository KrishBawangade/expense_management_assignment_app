import 'package:expense_management_assignment_app/features/sales_expense.dart/application/providers/expense_provider.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/domain/enums/payment_mode.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/domain/models/expense_item_model.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/domain/models/expense_model.dart';
import 'package:expense_management_assignment_app/features/sales_expense.dart/domain/models/payment_history_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddExpenseController extends ChangeNotifier {

  ExpenseProvider expenseProvider;
  
  AddExpenseController(this.expenseProvider);

  // ---------------------- 📅 Date Field ----------------------
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  // ---------------------- 🏷️ Category Field ----------------------
  String _categoryName = '';
  String get categoryName => _categoryName;
  void setCategoryName(String value) {
    _categoryName = value;
    notifyListeners();
  }

  // ---------------------- 🧾 Vendor Field ----------------------
  String _vendorName = '';
  String get vendorName => _vendorName;
  void setVendorName(String value) {
    _vendorName = value;
    notifyListeners();
  }

  // ---------------------- 💸 Paid Amount ----------------------
  double? _paidAmount = 0.0;
  String _paidAmountText = '0.0';
  double? get paidAmount => _paidAmount;
  String get paidAmountText => _paidAmountText;

  void setPaidAmount(String value) {
    _paidAmountText = value;
    _paidAmount = double.tryParse(value);
    notifyListeners();
  }

  // ---------------------- 💵 Editable Total Billing ----------------------
  double? _editableTotalAmount = 0.0;
  String _editableTotalAmountText = '0.0';
  double? get editableTotalAmount => _editableTotalAmount;
  String get editableTotalAmountText => _editableTotalAmountText;

  void setEditableTotalAmount(String value) {
    _editableTotalAmountText = value;
    _editableTotalAmount = double.tryParse(value);
    notifyListeners();
  }

  // 👉 Total amount is calculated from item prices
  double get totalAmount =>
      _items.fold(0.0, (sum, item) => sum + item.totalItemPricing);

  // ---------------------- 💰 Payment Mode ----------------------
  PaymentMode? _paymentMode;
  PaymentMode? get paymentMode => _paymentMode;
  void setPaymentMode(PaymentMode? mode) {
    _paymentMode = mode;
    notifyListeners();
  }

  // ---------------------- 📦 Item List ----------------------
  final List<ExpenseItemModel> _items = [];
  List<ExpenseItemModel> get items => List.unmodifiable(_items);

  void addItem(ExpenseItemModel item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  void updateItem(int index, ExpenseItemModel updatedItem) {
    if (index >= 0 && index < _items.length) {
      _items[index] = updatedItem;
      notifyListeners();
    }
  }

  void clearItems() {
    _items.clear();
    notifyListeners();
  }

  // ---------------------- 📸 Uploaded Images ----------------------
  final List<String> _uploadedImagePaths = [];
  List<String> get uploadedImagePaths => List.unmodifiable(_uploadedImagePaths);

  void addImagePath(String path) {
    _uploadedImagePaths.add(path);
    notifyListeners();
  }

  // ---------------------- 🗒️ Notes Field ----------------------
  String _notes = '';
  String get notes => _notes;
  void setNotes(String value) {
    _notes = value;
    notifyListeners();
  }

  // ---------------------- ✅ Validation ----------------------
  bool get isFormValid =>
      _categoryName.trim().isNotEmpty &&
      !(expenseProvider.expenses??[]).any((item) => item.categoryName == _categoryName.trim()) &&
      _paidAmount != null &&
      (_paidAmount! <= 0 ||
          _paymentMode != null); // ✅ Only check payment mode if paidAmount > 0

  bool validateAllFields() => isFormValid;

  // ---------------------- 🔄 Reset ----------------------
  void reset({listen = false}) {
    _selectedDate = DateTime.now();
    _categoryName = '';
    _vendorName = '';
    _paidAmount = 0.0;
    _paidAmountText = '0.0';
    _editableTotalAmount = 0.0;
    _editableTotalAmountText = '0.0';
    _paymentMode = null;
    _uploadedImagePaths.clear();
    _items.clear();
    _notes = '';

    if (listen) {
      notifyListeners();
    }
  }

  // ---------------------- 🔁 Convert to ExpenseModel ----------------------
  ExpenseModel toExpenseModel() {
    return ExpenseModel(
      id: const Uuid().v4(),
      date: _selectedDate,
      categoryName: _categoryName,
      vendorName: _vendorName,
      paid: _paidAmount??0.0,
      totalBilling: totalAmount,
      paymentMode: _paymentMode,
      paymentScreenshotPathList: List<String>.from(_uploadedImagePaths),
      itemList: List<ExpenseItemModel>.from(_items),
      createdBy: "User", // For testing purpose
      note: _notes,
      paymentHistory: [
        PaymentHistoryModel(
          id: const Uuid().v4(),
          createdAt: DateTime.now(),
          createdBy: "User", // Replace with actual user if available
          paymentScreenshotPathList:
              _uploadedImagePaths.isNotEmpty
                  ? List<String>.from(_uploadedImagePaths)
                  : null,
        ),
      ],
    );
  }
}
