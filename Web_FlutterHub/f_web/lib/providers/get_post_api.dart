import 'dart:async';


// class ContactApiProvider {
//   final String _url = "http://0.0.0.0:8000/api/all_posts";
//   final Dio _dios = Dio();

//   Future<PostResult> getPosts() async {
//     try {
//       Response response = await _dios.get(_url);

//       print(response.data);

//       return PostResult.fromJson(response.data);
//     } catch (e) {
//       return PostResult.withError(e.toString());
//     }
//   }
// }
