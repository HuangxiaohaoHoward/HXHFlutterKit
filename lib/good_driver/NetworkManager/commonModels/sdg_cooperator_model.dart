class SDGCooperatorModel {
  ///客户名称
  String customerName;

  ///客户编号
  String customerNumber;

  ///客户域名
  String domainName;

  ///客户域名2
  String domainNameTwo;

  ///LOGO图片颜色
  String logoColorOne;

  ///LOGO图片颜色
  String logoColorTwo;

  ///logo图片地址
  String logoUrlOne;

  ///logo图片地址
  String logoUrlTwo;

  ///司机登录账号
  String username;

  SDGCooperatorModel(
      {this.customerName,
      this.customerNumber,
      this.domainName,
      this.domainNameTwo,
      this.logoColorOne,
      this.logoColorTwo,
      this.logoUrlOne,
      this.logoUrlTwo,
      this.username});

  factory SDGCooperatorModel.fromJson(Map<String, dynamic> json) {
    return SDGCooperatorModel(
      customerName: json['customerName'],
      customerNumber: json['customerNumber'],
      domainName: json['domainName'],
      domainNameTwo: json['domainNameTwo'],
      logoColorOne: json['logoColorOne'],
      logoColorTwo: json['logoColorTwo'],
      logoUrlOne: json['logoUrlOne'],
      logoUrlTwo: json['logoUrlTwo'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerName'] = this.customerName;
    data['customerNumber'] = this.customerNumber;
    data['domainName'] = this.domainName;
    data['domainNameTwo'] = this.domainNameTwo;
    data['logoColorOne'] = this.logoColorOne;
    data['logoColorTwo'] = this.logoColorTwo;
    data['logoUrlOne'] = this.logoUrlOne;
    data['logoUrlTwo'] = this.logoUrlTwo;
    data['username'] = this.username;
    return data;
  }
}
