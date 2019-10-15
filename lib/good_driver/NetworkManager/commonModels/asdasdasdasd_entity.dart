class AsdasdasdasdEntity {
	String logoUrlTwo;
	String domainName;
	String logoColorTwo;
	String domainNameTwo;
	String logoUrlOne;
	String customerNumber;
	String logoColorOne;
	String customerName;
	String username;

	AsdasdasdasdEntity({this.logoUrlTwo, this.domainName, this.logoColorTwo, this.domainNameTwo, this.logoUrlOne, this.customerNumber, this.logoColorOne, this.customerName, this.username});

	AsdasdasdasdEntity.fromJson(Map<String, dynamic> json) {
		logoUrlTwo = json['logoUrlTwo'];
		domainName = json['domainName'];
		logoColorTwo = json['logoColorTwo'];
		domainNameTwo = json['domainNameTwo'];
		logoUrlOne = json['logoUrlOne'];
		customerNumber = json['customerNumber'];
		logoColorOne = json['logoColorOne'];
		customerName = json['customerName'];
		username = json['username'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['logoUrlTwo'] = this.logoUrlTwo;
		data['domainName'] = this.domainName;
		data['logoColorTwo'] = this.logoColorTwo;
		data['domainNameTwo'] = this.domainNameTwo;
		data['logoUrlOne'] = this.logoUrlOne;
		data['customerNumber'] = this.customerNumber;
		data['logoColorOne'] = this.logoColorOne;
		data['customerName'] = this.customerName;
		data['username'] = this.username;
		return data;
	}
}
