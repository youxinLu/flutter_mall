class UserEntity {
	UserUserinfo userInfo;
	String token;

	UserEntity({this.userInfo, this.token});

	UserEntity.fromJson(Map<String, dynamic> json) {
		userInfo = json['userInfo'] != null ? new UserUserinfo.fromJson(json['userInfo']) : null;
		token = json['token'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.userInfo != null) {
      data['userInfo'] = this.userInfo.toJson();
    }
		data['token'] = this.token;
		return data;
	}
}

class UserUserinfo {
	String avatarUrl;
	String nickName;

	UserUserinfo({this.avatarUrl, this.nickName});

	UserUserinfo.fromJson(Map<String, dynamic> json) {
		avatarUrl = json['avatarUrl'];
		nickName = json['nickName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['avatarUrl'] = this.avatarUrl;
		data['nickName'] = this.nickName;
		return data;
	}
}
