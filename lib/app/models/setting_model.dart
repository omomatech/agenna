class Setting {
  String? appName;
  String? defaultTheme;
  String? mainColor;
  String? mainDarkColor;
  String? secondColor;
  String? secondDarkColor;
  String? accentColor;
  String? accentDarkColor;
  String? scaffoldDarkColor;
  String? scaffoldColor;
  String? mobileLanguage;
  String? appVersion;
  bool? enableVersion;



  Setting(
      {this.appName,
      this.defaultTheme,
      this.mainColor,
      this.mainDarkColor,
      this.secondColor,
      this.secondDarkColor,
      this.accentColor,
      this.accentDarkColor,
      this.scaffoldDarkColor,
      this.scaffoldColor,

      this.mobileLanguage,
      this.appVersion,
      this.enableVersion,
   
  });

  Setting.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'] as String  ;
    defaultTheme = json['default_theme'] as String ;
    mainColor = json['main_color'] as String ;
    mainDarkColor = json['main_dark_color'] as String ;
    secondColor = json['second_color'] as String ;
    secondDarkColor = json['second_dark_color'] as String ;
    accentColor = json['accent_color'] as String ;
    accentDarkColor = json['accent_dark_color']as String;
    scaffoldDarkColor = json['scaffold_dark_color']as String;
    scaffoldColor = json['scaffold_color']as String;
    mobileLanguage = json['mobile_language']as String;
    appVersion = json['app_version']as String;
    enableVersion = json['enable_version'] == null || json['enable_version'] == '0' ? false : true;
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['app_name'] = this.appName;
    data['default_theme'] = this.defaultTheme;
    data['main_dark_color'] = this.mainDarkColor;
    data['second_color'] = this.secondColor;
    data['second_dark_color'] = this.secondDarkColor;
    data['accent_color'] = this.accentColor;
    data['accent_dark_color'] = this.accentDarkColor;
    data['scaffold_dark_color'] = this.scaffoldDarkColor;
    data['scaffold_color'] = this.scaffoldColor;
 
    data['mobile_language'] = this.mobileLanguage;
    data['app_version'] = this.appVersion;
    data['enable_version'] = this.enableVersion;

    return data;
  }
}
