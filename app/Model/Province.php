<?php

//require_once "../vendor/autoload.php";
namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Province extends Model
{
  protected $fillable = ['name'];

  public function properties()
  {
    return $this->hasMany(Property::class);
  }
}
