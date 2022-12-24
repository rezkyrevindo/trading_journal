class TransactionModelFields {
  static final List<String> values = [
    id,
    openTime,
    closeTime,
    type,
    size,
    symbol,
    priceOpen,
    stopLoss,
    takeProfit,
    priceClose,
    commision,
    profit,
    comment,
  ];

  static final String id = '_id';
  static final String openTime = 'openTime';
  static final String closeTime = 'closeTime';
  static final String type = 'type';
  static final String size = 'size';
  static final String symbol = 'symbol';
  static final String priceOpen = 'priceOpen';
  static final String stopLoss = 'stopLoss';
  static final String takeProfit = 'takeProfit';
  static final String priceClose = 'priceClose';
  static final String commision = 'commision';
  static final String profit = 'profit';
  static final String comment = 'comment';
}

class TransactionModel {
  final int? id;
  final DateTime? openTime;
  final DateTime? closeTime;
  final String? type;
  final double? size;
  final String? symbol;
  final double? priceOpen;
  final double? stopLoss;
  final double? takeProfit;
  final double? priceClose;
  final double? commision;
  final double? profit;
  final String? comment;

  const TransactionModel({
    this.id,
    this.openTime,
    this.closeTime,
    this.type,
    this.size,
    this.symbol,
    this.priceOpen,
    this.stopLoss,
    this.takeProfit,
    this.priceClose,
    this.commision,
    this.profit,
    this.comment,
  });

  TransactionModel copy({
    final int? id,
    final DateTime? openTime,
    final DateTime? closeTime,
    final String? type,
    final double? size,
    final String? symbol,
    final double? priceOpen,
    final double? stopLoss,
    final double? takeProfit,
    final double? priceClose,
    final double? commision,
    final double? profit,
    final String? comment,
  }) =>
      TransactionModel(
        id: id ?? this.id,
        openTime: openTime ?? this.openTime,
        closeTime: closeTime ?? this.closeTime,
        type: type ?? this.type,
        size: size ?? this.size,
        symbol: symbol ?? this.symbol,
        priceOpen: priceOpen ?? this.priceOpen,
        stopLoss: stopLoss ?? this.stopLoss,
        takeProfit: takeProfit ?? this.takeProfit,
        priceClose: priceClose ?? this.priceClose,
        commision: commision ?? this.commision,
        profit: profit ?? this.profit,
        comment: comment ?? this.comment,
      );

  static TransactionModel fromJson(Map<String, Object?> json) =>
      TransactionModel(
        id: json[TransactionModelFields.id] as int?,
        openTime:
            DateTime.parse(json[TransactionModelFields.openTime] as String),
        closeTime:
            DateTime.parse(json[TransactionModelFields.closeTime] as String),
        type: json[TransactionModelFields.type] as String,
        size: json[TransactionModelFields.size] as double,
        symbol: json[TransactionModelFields.symbol] as String,
        priceOpen: json[TransactionModelFields.priceOpen] as double,
        stopLoss: json[TransactionModelFields.stopLoss] as double,
        takeProfit: json[TransactionModelFields.takeProfit] as double,
        commision: json[TransactionModelFields.commision] as double,
        profit: json[TransactionModelFields.profit] as double,
        comment: json[TransactionModelFields.comment] as String,
      );

  Map<String, Object?> toJson() => {
        TransactionModelFields.id: id,
        TransactionModelFields.openTime: openTime?.toIso8601String(),
        TransactionModelFields.closeTime: closeTime?.toIso8601String(),
        TransactionModelFields.type: type,
        TransactionModelFields.size: size,
        TransactionModelFields.symbol: symbol,
        TransactionModelFields.priceOpen: priceOpen,
        TransactionModelFields.stopLoss: stopLoss,
        TransactionModelFields.takeProfit: takeProfit,
        TransactionModelFields.commision: commision,
        TransactionModelFields.profit: profit,
        TransactionModelFields.comment: comment,
      };
}
