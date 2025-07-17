// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../enums/payment_mode.dart';
import 'expense_item_model.dart';
import 'payment_history_model.dart';

/// Represents a single expense record along with its items and payment history.
class ExpenseModel {
  /// Unique ID of the expense.
  final String id;

  /// Date on which the expense was made.
  final DateTime date;

  /// Name of the category this expense belongs to (e.g., Grocery, Fuel).
  final String categoryName;

  /// Optional vendor or seller name associated with this expense.
  final String? vendorName;

  /// Total billed amount for this expense.
  final double totalBilling;

  /// Total amount paid so far against this expense.
  final double paid;

  /// Name or ID of the person who recorded this expense.
  final String createdBy;

  /// Primary payment mode used for the expense (if applicable).
  final PaymentMode? paymentMode;

  /// Optional note or description related to the expense.
  final String? note;

  /// List of file paths pointing to payment screenshots (optional).
  final List<String>? paymentScreenshotPathList;

  /// List of all items included in this expense.
  final List<ExpenseItemModel>? itemList;

  /// Payment history or breakdown of payments made toward this expense.
  final List<PaymentHistoryModel>? paymentHistory;

  /// Whether this is a fixed expense that should not be deleted.
  final bool isFixed;

  const ExpenseModel({
    required this.id,
    required this.date,
    required this.categoryName,
    this.vendorName,
    required this.totalBilling,
    required this.paid,
    required this.createdBy,
    this.paymentMode,
    this.note,
    this.paymentScreenshotPathList,
    this.itemList,
    this.paymentHistory,
    this.isFixed = false, // By default, not fixed
  });

  /// copyWith method
  ExpenseModel copyWith({
    String? id,
    DateTime? date,
    String? categoryName,
    String? vendorName,
    double? totalBilling,
    double? paid,
    String? createdBy,
    PaymentMode? paymentMode,
    String? note,
    List<String>? paymentScreenshotPathList,
    List<ExpenseItemModel>? itemList,
    List<PaymentHistoryModel>? paymentHistory,
    bool? isFixed,
  }) {
    return ExpenseModel(
      id: id ?? this.id,
      date: date ?? this.date,
      categoryName: categoryName ?? this.categoryName,
      vendorName: vendorName ?? this.vendorName,
      totalBilling: totalBilling ?? this.totalBilling,
      paid: paid ?? this.paid,
      createdBy: createdBy ?? this.createdBy,
      paymentMode: paymentMode ?? this.paymentMode,
      note: note ?? this.note,
      paymentScreenshotPathList: paymentScreenshotPathList ?? this.paymentScreenshotPathList,
      itemList: itemList ?? this.itemList,
      paymentHistory: paymentHistory ?? this.paymentHistory,
      isFixed: isFixed ?? this.isFixed,
    );
  }
}
