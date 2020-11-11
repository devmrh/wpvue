<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Facility extends Model {
  protected $table = 'facilities';

  protected $fillable = ['name', 'slug'];

  public function properties(){
    return $this->belongsToMany(Property::class);
  }
}