<?php

namespace App\Http\Controllers;

use App\CategoryModel;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function addcategory(Request $re){

        $category=new CategoryModel();
        $category->name=$re->cat_name;

        $category->save();

        return response()->json(['res'=>'success']);
    }
}
