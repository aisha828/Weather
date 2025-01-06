class FiveHoursData {
  final String? dateTime;
  final int? temp;

  FiveHoursData({this.dateTime, this.temp});

  factory FiveHoursData.fromJson(dynamic json) {
    if (json == null) {
      return FiveHoursData();
    }

    var f = json['dt_txt'].split(' ')[0].split('-')[2];
    var l = json['dt_txt'].split(' ')[1].split(':')[0];
    var fandl = '$f:$l';
    return FiveHoursData(
      dateTime: '$fandl',
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
    );
  }
}
