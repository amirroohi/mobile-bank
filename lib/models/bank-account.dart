class BankAccount {
  final String ownerName;
  final String accountNumber;
  final String iban;
  final String type;
  final double balance;
  final String logoAsset;

  BankAccount({
    required this.ownerName,
    required this.accountNumber,
    required this.iban,
    required this.type,
    required this.balance,
    required this.logoAsset,
  });
}
