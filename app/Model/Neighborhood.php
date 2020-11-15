<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Neighborhood extends Model
{

  protected $table = 'neighborhoods';

  protected $fillable = ['name', 'city_id'];

  public function city()
  {
    return $this->belongsTo(City::class);
  }
}
