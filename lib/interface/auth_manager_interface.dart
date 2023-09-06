
abstract class AuthManagerInterface{

  Future<void> saveUserInCloudDb({required String name , required String email , required String image});

  Future<void> signOut();

}