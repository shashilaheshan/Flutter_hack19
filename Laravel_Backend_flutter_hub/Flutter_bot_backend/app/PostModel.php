<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PostModel extends Model
{
    public $timestamps=false;
    protected $table='posts';
}
