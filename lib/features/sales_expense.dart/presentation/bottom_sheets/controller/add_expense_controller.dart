import 'package:expense_management_assignment_app/features/sales_expense.dart/domain/enums/payment_mode.dart';
import 'package:flutter/material.dart';

/// Controller to manage the state for the Add Expense form.
/// Handles all form fields like date, category, items, and more.
class AddExpenseController extends ChangeNotifier {
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

  // ---------------------- 💸 Billing Fields ----------------------

  double? _totalAmount = 0.0;
  double? _paidAmount = 0.0;

  double? get totalAmount => _totalAmount;
  double? get paidAmount => _paidAmount;

  void setTotalAmount(String value) {
    _totalAmount = double.tryParse(value);
    notifyListeners();
  }

  void setPaidAmount(String value) {
    _paidAmount = double.tryParse(value);
    notifyListeners();
  }

  // ---------------------- Payment Mode ----------------------

  PaymentMode? _paymentMode;
  PaymentMode? get paymentMode => _paymentMode;
  void setPaymentMode(PaymentMode? mode) {
    _paymentMode = mode;
    notifyListeners();
  }

  // ---------------------- 📸 Uploaded Images ----------------------

  final List<String> _uploadedImagePaths = [];
  List<String> get uploadedImagePaths => List.unmodifiable(_uploadedImagePaths);

  /// Adds a new image path and notifies listeners
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

  // ---------------------- 🔄 Reset ----------------------

  void reset() {
    _selectedDate = DateTime.now();
    _categoryName = '';
    _vendorName = '';
    _totalAmount = 0.0;
    _paidAmount = 0.0;
    _paymentMode = null;
    _uploadedImagePaths.clear();
  }
}
