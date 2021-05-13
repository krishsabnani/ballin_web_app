class MemberModel {
  String name;
  String desg;
  SocialIds socialIds;
  String img;
  int index;

  MemberModel({this.name, this.desg, this.socialIds, this.img, this.index});

  MemberModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desg = json['desg'];
    socialIds = json['socialIds'] != null
        ? new SocialIds.fromJson(json['socialIds'])
        : null;
    img = json['img'];
    index = json['index'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['desg'] = this.desg;
    if (this.socialIds != null) {
      data['socialIds'] = this.socialIds.toJson();
    }
    data['img'] = this.img;
    data['index'] = this.index;
    return data;
  }
}

class SocialIds {
  String email;
  String linkedIn;

  SocialIds({this.email, this.linkedIn});

  SocialIds.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    linkedIn = json['linkedIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['linkedIn'] = this.linkedIn;
    return data;
  }
}
