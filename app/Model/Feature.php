<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Feature extends Model
{
  protected $table = 'features';

  protected $fillable = ['name', 'slug'];
  public function properties()
  {
    return $this->hasMany(Property::class);
  }
}
