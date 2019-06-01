<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CommentModel extends Model
{
    public $timestamps=false;
    protected $table='comments';
}
