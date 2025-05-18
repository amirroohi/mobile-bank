class BankAccount {
  String ownerName;
  String accountNumber;
  String iban;
  String type;
  double balance;
  String logoAsset;
  bool isBookmarked; // ✅ New property

  BankAccount({
    required this.ownerName,
    required this.accountNumber,
    required this.iban,
    required this.type,
    required this.balance,
    required this.logoAsset,
    this.isBookmarked = false, // Default to false
  });
}
