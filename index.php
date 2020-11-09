<?php
/**
 * Plugin Name: amlak-new
 * Description: new amlak.
 */

use App\Db\Database;
use App\Model\City;
use App\Model\Feature;
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
wp_register_style('wp.style','https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css');
wp_enqueue_style('wp.style');


//Tell WordPress to register the scripts
add_action('wp_enqueue_scripts', 'func_load_vuescripts');

//Return string for shortcode
function func_wp_vue(){
  //Add Vue.js
  wp_enqueue_script('wpvue_vuejs');
  //Add my code to it
  wp_enqueue_script('my_vuecode');



 // print_r($users);

  //Build String
  $str= "<div id='app'>"
  	."Message from Vue"
  	."</div>";

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
      $feature = Feature::get()->toArray();

      $data['provinces'] = $province;
      $data['categories'] = $categories;
      $data['sellTypes'] = $sellType;
      $data['features'] = $feature;
      return $data;
  }

?>
