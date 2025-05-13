class BankCard {
  final String ownerName;
  final String cardNumber;
  final String iban;
  final String type; // "نقدی", "اعتباری", etc.
  final String expiry;
  final double balance;
  final String logoAsset;

  BankCard({
    required this.ownerName,
    required this.cardNumber,
    required this.iban,
    required this.type,
    required this.expiry,
    required this.balance,
    required this.logoAsset,
  });
}
