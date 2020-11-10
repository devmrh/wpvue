<?php
/**
 * Plugin Name: amlak-new
 * Description: new amlak.
 */

use App\Db\Database;
use App\Model\City;
use App\Model\Feature as Fea;
use App\Model\Property;
use App\Model\PropertyCategory;
use App\Model\Province;
use App\Model\SellType;

require_once("vendor/autoload.php");
Database::init();

//Register scripts to use
function func_load_vuescripts() {
	wp_register_script('wpvue_vuejs',plugin_dir_url( __FILE__ ).'bee/dist/js/app.js', true);
	wp_register_script('my_vuecode', plugin_dir_url( __FILE__ ).'bee/dist/js/chunk-vendors.js', true);
}

// Register style
wp_register_style('wp.style','https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css', true);
wp_enqueue_style('wp.style');

wp_register_style('wp.style.font',plugin_dir_url( __FILE__ ).'bee/src/style.css', true);
wp_enqueue_style('wp.style.font');


//Tell WordPress to register the scripts
add_action('wp_enqueue_scripts', 'func_load_vuescripts');

//Return string for shortcode
function func_wp_vue(){

  $user = wp_get_current_user();
  $user = json_encode($user);
 // print_r($user);
  //Add Vue.js
  wp_enqueue_script('wpvue_vuejs');
  //Add my code to it
  wp_enqueue_script('my_vuecode');


  if (!is_user_logged_in() ) {
    $str= "<div>"
  	."برای مشاهده صفحه ابتدا ورود کنید"
  	."</div>";
    return $str;

  }
 // print_r($users);

  //Build String

  $str= "<div id='app' data-initial-value='${user}'></div>";

  //Return to display
  return $str;
} // end function

//Add shortcode to WordPress
add_shortcode( 'wpvue', 'func_wp_vue' );




//get cities

add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/get-cities', array(
        'methods' => 'GET',
        'callback' => 'ea_get_cities',
      ) );
  } );

function ea_get_cities( $data ) {
    $province_id = $data->get_param('province');
    $data = [];
    $province = City::where('province_id', $province_id)->get()->toArray();
    $data['cities'] = $province;
    return $data;
}


// get data
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/', array(
        'methods' => 'GET',
        'callback' => 'ea_get_users',
      ) );
  } );

  function ea_get_users( $data ) {
      //$identifier = $data->get_param( 'identifier' );
      // $users = get_users();
      // $users = $users;
      // return $users;

      $data = [];
      $province = Province::get()->toArray();
      $categories = PropertyCategory::get()->toArray();
      $sellType = SellType::get()->toArray();
      $feature = Fea::get()->toArray();
      $data['provinces'] = $province;
      $data['categories'] = $categories;
      $data['sellTypes'] = $sellType;
      $data['features'] = $feature;
      return $data;
  }


// save data.
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/save-form', array(
        'methods' => 'POST',
        'callback' => 'ea_save_users',
      ) );
  } );

  function ea_save_users( $data ) {
      $params = $data->get_params();
     // return $params['build_time'];

     $f = new Fea();
     $f->name = 'aa';
     $f->slug = 'aa';
     $f->save();
      // Property::create([
      //   'title'=> $params['title'],
      //   'property_category_id'=> $params['property_category_id'] ?? null,
      //   'sell_type_id'=> $params['sell_type_id'] ?? null,
      //   'feature_id'=> $params['feature_id'] ?? null,
      //   'price'=> $params['price'] ?? '',
      //   'price_label'=> $params['price_label'] ?? '',
      //   'rent_price'=> $params['rent_price'] ?? '',
      //   'rent_label'=> $params['rent_label'] ?? '',
      //   'province_id'=> $params['province_id'] ?? '',
      //   'city_id'=> $params['city_id'] ?? '',
      //   'size'=> $params['size'] ?? '',
      //   'size_unit'=> $params['size_unit'] ?? '',
      //   'bed_count'=> $params['bed_count'] ?? '',
      //   'bath_count'=> $params['bath_count'] ?? '',
      //   'parking_count'=> $params['parking_count'] ?? '',
      //   'owner'=> $params['owner'] ?? '',
      //   'phone'=> $params['phone'] ?? '',
      //   'build_time'=> $params['build_time'] ?? '',
      //   'address'=> $params['address'] ?? '',
      //   'description'=> $params['description'] ?? '',
      //   'user_id' => 1,
      //   'special'=> $params['special']  == true ? 1 : 0,
      // ]);

      return "success";

}

?>
