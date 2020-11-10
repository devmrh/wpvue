<?php

//use App\Model\GetUser;


require  dirname(dirname(__DIR__)). '/vendor/autoload.php';

//GetUser::getusers();

use Illuminate\Events\Dispatcher;
use Illuminate\Container\Container;
use Illuminate\Database\Capsule\Manager as Capsule;
use Illuminate\Database\Capsule\Manager as DB;

$capsule = new Capsule();

$capsule->addConnection([
  'driver'    => 'mysql',
  'host'      => 'localhost',
  'database'  => 'amlak',
  'username'  => 'root',
  'password'  => 'root',
  'charset'   => 'utf8',
  'collation' => 'utf8_unicode_ci',
  'prefix'    => '',
]);



$capsule->setEventDispatcher(new Dispatcher(new Container));
$capsule->setAsGlobal();
$capsule->bootEloquent();



$path = __DIR__.'/cities.sql';
DB::unprepared(file_get_contents($path));
$path = __DIR__.'/provinces.sql';
DB::unprepared(file_get_contents($path));


Capsule::schema()->create('property_categories', function($table){
  $table->bigIncrements('id');
  $table->string('name');
  $table->string('slug');


});
Capsule::schema()->create('sell_types', function($table){
  $table->bigIncrements('id');
  $table->string('name');
  $table->string('slug');


});

Capsule::schema()->create('features', function($table){
  $table->bigIncrements('id');
  $table->string('name');
  $table->string('slug');


});


Capsule::schema()->create('properties', function($table){
  $table->bigIncrements('id');
  $table->unsignedBigInteger('property_category_id')->nullable();
  $table->unsignedBigInteger('sell_type_id')->nullable();
  $table->unsignedBigInteger('feature_id')->nullable();
  $table->unsignedBigInteger('city_id')->nullable();
  $table->unsignedBigInteger('province_id')->nullable();

  $table->string('title');
  $table->text('address')->nullable();
  $table->string('price')->nullable();
  $table->string('price_label')->nullable();
  $table->string('rent_price')->nullable();
  $table->string('rent_label')->nullable();

  $table->text('description')->nullable();
  $table->unsignedBigInteger('user_id');
  $table->string('owner')->nullable();
  $table->string('phone')->nullable();

  $table->string('size')->nullable();
  $table->string('size_unit')->nullable();

  $table->string('bath_count')->nullable();
  $table->string('parking_count')->nullable();
  $table->string('bed_count')->nullable();
  $table->string('build_time')->nullable();

  $table->boolean('special')->default(0);

  $table->foreign('property_category_id')->references('id')->on('property_categories')->onDelete('no action')->onUpdate('cascade');
  $table->foreign('sell_type_id')->references('id')->on('sell_types')->onDelete('no action')->onUpdate('cascade');
  $table->foreign('feature_id')->references('id')->on('features')->onDelete('no action')->onUpdate('cascade');
  $table->foreign('city_id')->references('id')->on('cities')->onDelete('no action')->onUpdate('cascade');
  $table->foreign('province_id')->references('id')->on('provinces')->onDelete('no action')->onUpdate('cascade');

});

echo "DONE";