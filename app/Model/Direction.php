<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Direction extends Model
{

  protected $table = 'directions';


  protected $fillable = ['name'];

  public function properties()
  {
    return $this->hasMany(Property::class);
  }
}
