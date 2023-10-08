class Income {
  const Income(this.amount, this.description);
  final int amount;
  final String description;

  factory Income.fromJson(Map<String, dynamic> json) => Income(
        json['amount'] as int,
        json['description'] as String,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'description': description,
      };
}
