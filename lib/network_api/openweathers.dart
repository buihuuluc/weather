class WeathersApi{
  String cityName;
  dynamic temp;
  double wind;
  dynamic degree;
  int humidity;
  dynamic feels_like;
  int press_sure;
  dynamic temp_min;
  dynamic temp_max;

  WeathersApi({
    this.cityName,
    this.temp,
    this.wind,
    this.degree,
    this.humidity,
    this.feels_like,
    this.press_sure,
    this.temp_min,
    this.temp_max,
});

  WeathersApi.fromJson(Map<String, dynamic> json){
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    degree = json["wind"]["deg"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
    press_sure = json["main"]["pressure"];
    temp_min = json["main"]["temp_min"];
    temp_max = json["main"]["temp_max"];
  }
}