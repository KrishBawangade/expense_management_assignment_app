/// Enum representing the unit of measurement for an item.
enum QuantityType {
  kg,           // Kilograms
  litre,        // Litres
  unitPiece,    // Individual units or pieces
  gram,         // Grams
}

/// Extension to get a user-friendly label for each quantity type.
extension QuantityTypeExtension on QuantityType {
  String get label {
    switch (this) {
      case QuantityType.kg:
        return 'Kg';
      case QuantityType.litre:
        return 'Litre';
      case QuantityType.unitPiece:
        return 'Unit/Piece';
      case QuantityType.gram:
        return 'Gram';
    }
  }
}
