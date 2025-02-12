class Validators {
  String? validateTransactionAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount is required';
    }
    try {
      final amount = double.parse(value.replaceAll(',', ''));
      if (amount < 50.00 || amount > 50000001.00) {
        return 'Amount must be between ₦50.00 and ₦5,000,000.00';
      }
    } catch (e) {
      return 'Enter a valid amount';
    }
    return null;
  }

  static String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can not be empty';
    }
    return null;
  }
}
