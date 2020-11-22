<?php

//require_once "../vendor/autoload.php";
namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Property extends Model
{
  protected $table = 'properties';

 protected $appends = ["username"];

  protected $fillable = [
    'title',
    'property_category_id',
    'sell_type_id',
    'feature_id',
    'document_id',
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
    'user_id',
    'direction_id',
    'neighborhood_id',
    'is_west',
    'is_south',
    'is_north',
    'is_east'
  ];

  public function city()
  {
    return $this->belongsTo(City::class);
  }

  public function province()
  {
    return $this->belongsTo(Province::class);
  }

  public function sellType()
  {
    return $this->belongsTo(SellType::class);
  }
  public function document()
  {
    return $this->belongsTo(Document::class);
  }

  public function propertyCategory()
  {
    return $this->belongsTo(PropertyCategory::class);
  }

  public function feature()
  {
    return $this->belongsTo(Feature::class);
  }

  public function direction()
  {
    return $this->belongsTo(Direction::class);
  }

  // public function getProFacilitiesAttribute()
  // {
  //   return $this->facilities()->where('property_id', $this->id)->get();;
  // }
  // relation many to many
  public function facilities()
  {
    return $this->belongsToMany(Facility::class);
  }

  public function getUserNameAttribute()
  {
    return $this->getUser($this->user_id)->data->display_name;
  }

  public function getUser($id){
    return get_userdata($id);
  }
}
