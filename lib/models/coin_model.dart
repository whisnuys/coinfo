class CoinModel {
  final String? uuid;
  final String? symbol;
  final String? name;
  final String? color;
  final String? iconUrl;
  final double? price;
  final double? change;
  final List? sparkLine;
  final double? btcPrice;
  final int? rank;
  final double? volume;
  final double? marketCap;

  CoinModel({
    this.uuid,
    this.symbol,
    this.name,
    this.color,
    this.iconUrl,
    this.price,
    this.change,
    this.sparkLine,
    this.btcPrice,
    this.rank,
    this.volume,
    this.marketCap,
  });

  factory CoinModel.fromJson(Map<String, dynamic> parsedJson) {
    return CoinModel(
      uuid: parsedJson['uuid'],
      symbol: parsedJson['symbol'],
      name: parsedJson['name'],
      color: parsedJson['color'],
      iconUrl: parsedJson['iconUrl'],
      price: double.parse(parsedJson['price']),
      change: double.parse(parsedJson['change']),
      sparkLine: parsedJson['sparkline'],
      btcPrice: double.parse(parsedJson['btcPrice']),
      rank: parsedJson['rank'],
      volume: double.parse(parsedJson['24hVolume']),
      marketCap: double.parse(parsedJson['marketCap']),
    );
  }
}
