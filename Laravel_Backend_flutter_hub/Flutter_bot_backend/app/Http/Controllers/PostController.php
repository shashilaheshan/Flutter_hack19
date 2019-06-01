<?php

namespace App\Http\Controllers;

use App\CommentModel;
use App\PostModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PostController extends Controller
{
    public  function add_post(Request $re){

        $post=new PostModel();

        $post->title=$re->title;
        $post->description=$re->desc;
        $post->image_url='https://regmedia.co.uk/2018/03/04/flutter.jpg';
        $post->category_id=1;
        $post->user_id=1;
        $post->time=date('Y-m-d');
        $post->save();
        return response()->json(['res'=>'success']);


    }
    public function add_comment(Request $request){


   $comment=new CommentModel();

   $comment->post_id=$request->post_id;
   $comment->user_id=$request->user_id;
   $comment->comment=$request->comment;
   $comment->user_name=$request->user_name;
   $comment->time=date('Y-m-d');

   $comment->save();
   return response()->json([
       'response'=>'success'
   ]);



    }


    public function getAll(){

        $posts=DB::select( DB::raw("SELECT *,posts.id as p_id,posts.image_url as im_url,users_f.name as username,category.name as cat_name FROM posts inner join users_f on  posts.user_id=users_f.id inner join  category on posts.category_id=category.id") );

        return response()->json(['posts'=>$posts]);



    }


public function getPostComment(Request $re){






    $post_comment=DB::select( DB::raw("SELECT * FROM comments where comments.post_id=1") );

    return response()->json(['comments'=>$post_comment]);





}

public function  getSinglePost($id){





    $post_comment=DB::select( DB::raw("SELECT *,posts.image_url as im_url,users_f.name as username,category.name as cat_name FROM posts inner join users_f on  posts.user_id=users_f.id inner join  category on posts.category_id=category.id where posts.id=:id"), array(
   'id' => $id,
 ));

        return response()->json(['post'=>$post_comment]);

}


}
