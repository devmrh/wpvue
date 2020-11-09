<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class PropertyCategory extends Model {
  protected $table = 'property_categories';

  protected $fillable = ['name', 'slug'];
}