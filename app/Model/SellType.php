<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class SellType extends Model {
  protected $table = 'sell_types';

  protected $fillable = ['name', 'slug'];
}