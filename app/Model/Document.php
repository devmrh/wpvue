<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Document extends Model {
  protected $table = 'documents';

  protected $fillable = ['name', 'slug'];

  public function properties(){
    return $this->belongsToMany(Property::class);
  }
}