class Account {
  final String iban;
  final String accountNumber;
  final String cardNumber;
  final String accountType;
  final String owner;
  final String balance;

  Account({
    required this.iban,
    required this.accountNumber,
    required this.cardNumber,
    required this.accountType,
    required this.owner,
    required this.balance,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      iban: json['iban'],
      accountNumber: json['account_number'],
      cardNumber: json['card_number'],
      accountType: json['account_type'],
      owner: json['owner'],
      balance: json['balance'].toString(),
    );
  }
}
