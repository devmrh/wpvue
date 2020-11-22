<?php


//require '../../vendor/autoload.php';
// echo dirname(dirname(__DIR__. 'vendor/autoload.php'));
// return;

require  dirname(dirname(__DIR__)) . '/vendor/autoload.php';

use App\Db\Database;
use Illuminate\Database\Capsule\Manager as DB;

Database::init();

DB::table('features')->insert([
  ['name' => 'پیش فروش', 'slug' => 'presell'],
  ['name' => 'نیمه کاره', 'slug' => 'part-time'],
  ['name' => 'دوبلکس', 'slug' => 'duplex'],
  ['name' => 'پنت هاوس', 'slug' => 'penthouse'],
  ['name' => 'تریپلکس', 'slug' => 'triplex'],
  ['name' => 'یک طبقه', 'slug' => 'one-floor'],
  ['name' => 'برج', 'slug' => 'tower'],
  ['name' => 'نیمه دوبلکس', 'slug' => 'half-duplex'],
  ['name' => 'انبار', 'slug' => 'store'],
  ['name' => 'تجاری مسکونی', 'slug' => 'residential-commercial'],
  ['name' => 'سایر', 'slug' => 'other'],

]);
DB::table('property_categories')->insert([
  ['name' => 'آپارتمان', 'slug' => 'apartment'],
  ['name' => 'ویلا', 'slug' => 'villa'],
  ['name' => 'سایر', 'slug' => 'other'],
]);
DB::table('sell_types')->insert([
  ['name' => 'فروش', 'slug' => 'sales'],
  ['name' => 'اجاره', 'slug' => 'rent'],
  ['name' => 'سایر', 'slug' => 'other'],
]);
DB::table('facilities')->insert([
  ['name' => 'آسانسور', 'slug' => 'elevator'],
  ['name' => 'پارکینگ', 'slug' => 'parking'],
  ['name' => 'انباری', 'slug' => 'warehouse'],
]);

DB::table('documents')->insert([
  ['name' => 'شخصی', 'slug' => ''],
  ['name' => 'بنیاد', 'slug' => ''],
  ['name' => 'دفترچه ای', 'slug' => ''],
]);

echo "DONE";
