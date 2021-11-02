class Weather{
  dynamic name;
  dynamic country;
  dynamic localtime;
  dynamic temp_c;
  dynamic text;
  dynamic icon;
  dynamic wind;
  dynamic winddegree;
  dynamic humidity;
  dynamic cloud;
  dynamic feellike;
  dynamic uv;
  dynamic co;
  dynamic no2;
  dynamic o3;
  dynamic so2;

  Weather({
    this.name,
    this.country,
    this.localtime,
    this.temp_c,
    this.text,
    this.icon,
    this.wind,
    this.winddegree,
    this.humidity,
    this.cloud,
    this.feellike,
    this.uv,
    this.co,
    this.no2,
    this.o3,
    this.so2,
  });

  Weather.fromJson(Map<String, dynamic>json){
    name = json["location"]["name"];
    country = json["location"]["country"];
    localtime = json["location"]["localtime"];
    temp_c = json["current"]["temp_c"];
    text = json["current"]["condition"]["text"];
    icon = json["current"]["condition"]["icon"];
    wind = json["current"]["wind_kph"];
    winddegree = json["current"]["wind_degree"];
    humidity = json["current"]["humidity"];
    cloud = json["current"]["cloud"];
    feellike = json["current"]["feelslike_c"];
    uv = json["current"]["uv"];
    co = json["current"]["air_quality"]["co"];
    no2 = json["current"]["air_quality"]["no2"];
    o3 = json["current"]["air_quality"]["o3"];
    so2 = json["current"]["air_quality"]["so2"];
  }
}
