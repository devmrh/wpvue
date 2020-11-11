<?php

//require_once "../vendor/autoload.php";
namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Property extends Model
{
  protected $table = 'properties';

  protected $fillable = [
    'title',
    'property_category_id',
    'sell_type_id',
    'feature_id',
    'price',
    'price_label',
    'rent_price',
    'rent_label',
    'province_id',
    'city_id',
    'size',
    'size_unit',
    'bed_count',
    'bath_count',
    'parking_count',
    'owner',
    'phone',
    'build_time',
    'address',
    'description',
    'special',
    'user_id'
  ];

  public function city()
  {
    $this->belongsTo(City::class);
  }

  public function province()
  {
    $this->belongsTo(Province::class);
  }

  public function sellType()
  {
    $this->belongsTo(SellType::class);
  }

  public function propertyCategory()
  {
    $this->belongsTo(PropertyCategory::class);
  }

  public function feature()
  {
    $this->belongsTo(Feature::class);
  }

  // relation many to many
  public function facilities()
  {
    return $this->belongsToMany(Facility::class);
  }
}
