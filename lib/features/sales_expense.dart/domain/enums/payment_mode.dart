/// Enum representing different modes of payment.
enum PaymentMode {
  cash,             // Paid by cash
  upi,              // Paid using UPI
  debitCreditCard,  // Paid using Debit or Credit Card
  neftRtgs,         // Paid via NEFT or RTGS
}

/// Extension to get a human-readable label for each payment mode.
extension PaymentModeExtension on PaymentMode {
  String get label {
    switch (this) {
      case PaymentMode.cash:
        return 'Cash';
      case PaymentMode.upi:
        return 'UPI';
      case PaymentMode.debitCreditCard:
        return 'Debit/Credit Card';
      case PaymentMode.neftRtgs:
        return 'NEFT/RTGS';
    }
  }
}
