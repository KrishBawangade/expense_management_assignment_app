// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../enums/payment_mode.dart';

/// Represents a single payment entry made toward an expense.
class PaymentHistoryModel {
  /// Unique ID of the payment history entry.
  final String id;

  /// Date and time when the payment was made.
  final DateTime createdAt;

  /// Name or ID of the person who made the payment.
  final String createdBy;

  /// Amount paid in this transaction.
  final double? paymentAmount;

  /// Mode used to make the payment.
  final PaymentMode? paymentMode;

  /// List of file paths pointing to payment screenshots (optional).
  final List<String>? paymentScreenshotPathList;

  const PaymentHistoryModel({
    required this.id,
    required this.createdAt,
    required this.createdBy,
    this.paymentAmount,
    this.paymentMode,
    this.paymentScreenshotPathList,
  });


  /// copywith method
  PaymentHistoryModel copyWith({
    String? id,
    DateTime? createdAt,
    String? createdBy,
    double? paymentAmount,
    PaymentMode? paymentMode,
    List<String>? paymentScreenshotPathList,
  }) {
    return PaymentHistoryModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      paymentAmount: paymentAmount ?? this.paymentAmount,
      paymentMode: paymentMode ?? this.paymentMode,
      paymentScreenshotPathList: paymentScreenshotPathList ?? this.paymentScreenshotPathList,
    );
  }
}
