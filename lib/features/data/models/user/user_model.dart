import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/features/domain/entities/user/user_entity.dart';

class UserModel extends UserEntity {
  final String? uid;
  final String? username;
  final String? name;
  final String? bio;
  final String? website;
  final String? email;
  final String? profileUrl;
  final List? followers;
  final List? following;
  final num? totalFollowers;
  final num? totalFollowing;
  final num? totalPost;

  UserModel({
      this.uid,
      this.username,
      this.name,
      this.bio,
      this.website,
      this.email,
      this.profileUrl,
      this.followers,
      this.following,
      this.totalFollowers,
      this.totalFollowing,
      this.totalPost,
      }):super(
      uid:uid,
      username:username,
      name:name,
      bio:bio,
      website:website,
      email:email,
      profileUrl:profileUrl,
      followers:followers,
      following:following,
      totalFollowers:totalFollowers,
      totalFollowing:totalFollowing,
      totalPost:totalPost,
  );

  factory UserModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot=snap.data() as Map<String,dynamic>;
    return UserModel(
      uid: snapshot["uid"],
      username: snapshot["username"],
      name: snapshot["name"],
      bio: snapshot["bio"],
      website: snapshot["website"],
      email: snapshot["email"],
      profileUrl: snapshot["profileUrl"],
      followers: List.from(snap.get("followers")),
      following: List.from(snap.get("following")),
      totalFollowers: snapshot["totalFollowers"],
      totalFollowing: snapshot["totalFollowing"],
      totalPost: snapshot["totalPost"],
    );
  }

  Map<String,dynamic>toJson()=>{
    "uid":uid,
    "username":username,
    "name":name,
    "bio":bio,
    "website":website,
    "email":email,
    "profileUrl":profileUrl,
    "followers":followers,
    "following":following,
    "totalFollowers":totalFollowers,
    "totalFollowing":totalFollowing,
    "totalPost":totalPost,
  };



}
