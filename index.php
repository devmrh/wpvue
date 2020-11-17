<?php
/**
 * Plugin Name: Amlak
 * Description: DEV PREVIEW. Real Estate Advisor.
 * Version: 1.0
 * Author: Devmrh
 */

use App\Db\Database;
use App\Model\City;
use App\Model\Direction;
use App\Model\Facility;
use App\Model\Feature as Fea;
use App\Model\Neighborhood;
use App\Model\Property;
use App\Model\PropertyCategory;
use App\Model\Province;
use App\Model\SellType;
use Illuminate\Database\Capsule\Manager as DB;

require_once("vendor/autoload.php");
try {
  Database::init();
} catch (\Exception $e) {
  die();
  // please config database correctly
}

//Register scripts to use
function func_load_vuescripts() {
	wp_register_script('wpvue_vuejs',plugin_dir_url( __FILE__ ).'js/app.js', true);
	wp_register_script('my_vuecode', plugin_dir_url( __FILE__ ).'js/chunk-vendors.js', true);
}

//Tell WordPress to register the scripts
add_action('wp_enqueue_scripts', 'func_load_vuescripts');

// Register style
function my_enqueue_stuff() {
  if ( is_page( 'amlak' ) ) {
    /** Call landing-page-template-one enqueue */
    wp_register_style('wp.app',plugin_dir_url( __FILE__ ).'css/app.css', true);
    wp_enqueue_style('wp.app');
    wp_register_style('wp.app.chunk',plugin_dir_url( __FILE__ ).'css/chunk-vendors.css', true);
    wp_enqueue_style('wp.app.chunk');
    wp_register_style('wp.style',plugin_dir_url( __FILE__ ).'css/bootstrap.min.css', true);
    wp_enqueue_style('wp.style');
    wp_register_style('wp.style.font',plugin_dir_url( __FILE__ ).'css/style.css', true);
    wp_enqueue_style('wp.style.font');
  } else {
    /** Call regular enqueue */
  }
}
add_action( 'wp_enqueue_scripts', 'my_enqueue_stuff' );


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
    $str= "<div class='text-center'>"
  	."برای مشاهده صفحه ابتدا ورود کنید"
  	."</div>";
    return $str;

  }

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
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

function ea_get_cities( $data ) {
    $province_id = $data->get_param('province');
    $data = [];
    $province = City::where('province_id', $province_id)->get()->toArray();
    $data['cities'] = $province;
    return $data;
}


// get neighborhoods according to city
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/get-neighborhood-by-city', array(
        'methods' => 'GET',
        'callback' => 'ea_get_neighborhood',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

function ea_get_neighborhood( $data ) {
    $city_id = $data->get_param('city');
    $data = [];
    $nbs = Neighborhood::where('city_id', $city_id)->get()->toArray();
    $data['neighborhoods'] = $nbs;
    return $data;
}

// get data
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/', array(
        'methods' => 'GET',
        'callback' => 'ea_get_data',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_get_data( $data ) {

      $data = [];
      $province = Province::get()->toArray();
      $cities = City::get()->toArray();
      $categories = PropertyCategory::get()->toArray();
      $sellType = SellType::get()->toArray();
      $feature = Fea::get()->toArray();
      $facilities = Facility::get()->toArray();
      $directions = Direction::get()->toArray();
      $neighborhoods = Neighborhood::get()->toArray();
      $data['provinces'] = $province;
      $data['cities'] = $cities;
      $data['categories'] = $categories;
      $data['sellTypes'] = $sellType;
      $data['features'] = $feature;
      $data['facilities'] = $facilities;
      $data['directions'] = $directions;
      $data['neighborhoods'] = $neighborhoods;
      return $data;
  }


// save data.
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/save-form', array(
        'methods' => 'POST',
        'callback' => 'ea_save_form',
        'permissions_callback' => 'is_user_logged_in',
      ) );
  } );

  function ea_save_form( $data ) {
      $params = $data->get_params();
     // return $params['build_time'];

      if(empty($params['title'])){
        return wp_send_json_error("عنوان نمیتواند خالی باشد", 422);
      }
      if(empty($params['city_id'])){
        return wp_send_json_error("شهر نمیتواند خالی باشد", 422);
      }
      if(empty($params['province_id'])){
        return wp_send_json_error("استان نمیتواند خالی باشد", 422);
      }

      $build_time = $params['build_time'] ?? null;
      if($build_time){
        $bt = str_replace("/","-",$build_time);
        $build_time = \Morilog\Jalali\CalendarUtils::createCarbonFromFormat('Y-m-d', $bt)->format('Y-m-d');

      }

      if($params['price']){
        $price = str_replace(",","",$params['price']);
      }

      if($params['rent_price']){
        $rent_price = str_replace(",","",$params['rent_price']);
      }


      $property = Property::create([
        'title'=> $params['title'],
        'property_category_id'=> $params['property_category_id'] ?? null,
        'sell_type_id'=> $params['sell_type_id'] ?? null,
        'feature_id'=> $params['feature_id'] ?? null,
        'price'=> $price ?? '',
        'price_label'=> $params['price_label'] ?? '',
        'rent_price'=> $rent_price ?? '',
        'rent_label'=> $params['rent_label'] ?? '',
        'province_id'=> $params['province_id'] ?? '',
        'city_id'=> $params['city_id'] ?? '',
        'size'=> $params['size'] ?? '',
        'size_unit'=> $params['size_unit'] ?? '',
        'bed_count'=> $params['bed_count'] ?? '',
        'bath_count'=> $params['bath_count'] ?? '',
        'parking_count'=> $params['parking_count'] ?? '',
        'owner'=> $params['owner'] ?? '',
        'phone'=> $params['phone'] ?? '',
        'build_time'=> $build_time?? '',
        'address'=> $params['address'] ?? '',
        'description'=> $params['description'] ?? '',
        'user_id' => $params['user_id'],
        'direction_id' => $params['direction_id'],
        'neighborhood_id' => $params['neighborhood_id'],
        'special'=> $params['special']  == true ? 1 : 0,
      ]);

      $facilities = $params['facilities'];
      $property->facilities()->attach($facilities);
      return "موفق";

}

// edit data.
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/update-form', array(
        'methods' => 'POST',
        'callback' => 'ea_edit_form',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_edit_form( $data ) {
      $params = $data->get_params();
      $form_id = $params['id'];

      if(empty($params['title'])){
        return wp_send_json_error("عنوان نمیتواند خالی باشد", 422);
      }
      if(empty($params['city_id'])){
        return wp_send_json_error("شهر نمیتواند خالی باشد", 422);
      }
      if(empty($params['province_id'])){
        return wp_send_json_error("استان نمیتواند خالی باشد", 422);
      }

      $build_time = $params['build_time'] ?? null;
      if($build_time){
        $bt = str_replace("/","-",$build_time);
        $build_time = \Morilog\Jalali\CalendarUtils::createCarbonFromFormat('Y-m-d', $bt)->format('Y-m-d');

      }

      if($params['price']){
        $price = str_replace(",","",$params['price']);
      }

      if($params['rent_price']){
        $rent_price = str_replace(",","",$params['rent_price']);
      }

      Property::find($form_id)->update([
        'title'=> $params['title'],
        'property_category_id'=> $params['property_category_id'] ?? null,
        'sell_type_id'=> $params['sell_type_id'] ?? null,
        'feature_id'=> $params['feature_id'] ?? null,
        'price'=> $price ?? '',
        'price_label'=> $params['price_label'] ?? '',
        'rent_price'=> $rent_price ?? '',
        'rent_label'=> $params['rent_label'] ?? '',
        'province_id'=> $params['province_id'] ?? null,
        'city_id'=> $params['city_id'] ?? null,
        'size'=> $params['size'] ?? '',
        'size_unit'=> $params['size_unit'] ?? '',
        'bed_count'=> $params['bed_count'] ?? '',
        'bath_count'=> $params['bath_count'] ?? '',
        'parking_count'=> $params['parking_count'] ?? '',
        'owner'=> $params['owner'] ?? '',
        'phone'=> $params['phone'] ?? '',
        'build_time'=> $build_time ?? '',
        'address'=> $params['address'] ?? '',
        'description'=> $params['description'] ?? '',
        'special'=> $params['special']  == true ? 1 : 0,
        'direction_id' => $params['direction_id'],
        'neighborhood_id' => $params['neighborhood_id']

      ]);

      $facilities = $params['facilities'];
      $property = Property::find($form_id);
      $property->facilities()->sync($facilities);
      return "موفق";

}

// get all property
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/get-all-properties', array(
        'methods' => 'GET',
        'callback' => 'ea_get_properties',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

function ea_get_properties( $data ) {

    $pagenum = isset( $_GET['page'] ) ? absint( $_GET['page'] ) : 1;

    $limit = 10; // number of rows in page
    $offset = ( $pagenum - 1 ) * $limit;
    $total = Property::get()->count();


    $num_of_pages = ceil( $total / $limit );

    $entries = Property::with('facilities')->offset($offset)->limit($limit)->get();

   // return $entries;
    $page_links = array(
      'base' => add_query_arg( 'page', '%#%' ),
      'format' => '',
      'prev_text' => __( '&laquo;', 'text-domain' ),
      'next_text' => __( '&raquo;', 'text-domain' ),
      'total' => $num_of_pages,
      'current_page' => $pagenum,
      "per_page" => $limit,
      "last_page" => $num_of_pages,
      "first_page_url" => add_query_arg( 'page', '1' ),
      "last_page_url" => add_query_arg( 'page', $total ),
      "next_page_url" => add_query_arg( 'page', $pagenum + 1 ),
      "prev_page_url" => add_query_arg( 'page', $pagenum - 1 ),
      "path" => add_query_arg( 'page' ),
      "from" => $pagenum,
      "to" => $num_of_pages,
      'data' => $entries
  ) ;

  return $page_links;

}


// delete property.
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/delete-property', array(
        'methods' => 'POST',
        'callback' => 'ea_delete_form',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_delete_form( $data ) {
      $params = $data->get_params();
      $id =  $params['id'];
      Property::find($id)->delete();
      return "موفق";

}


// Get property categories.
########### 1 ############
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/get-categories', array(
        'methods' => 'GET',
        'callback' => 'ea_get_categories',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_get_categories( $data ) {

      $categories = PropertyCategory::get();
      return compact('categories');

}
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/add-category', array(
        'methods' => 'POST',
        'callback' => 'ea_add_category',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_add_category( $data ) {
    $params = $data->get_params();
    $c = $params["category"];
    $category = PropertyCategory::create(['name' => $c]);
    return compact('category');

}
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/edit-category', array(
        'methods' => 'POST',
        'callback' => 'ea_edit_category',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_edit_category( $data ) {
    $params = $data->get_params();
    $c = $params["category"];
    $id = $params["id"];
    PropertyCategory::find($id)->update(['name' => $c]);
    return "success";

}


add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/delete-category', array(
        'methods' => 'POST',
        'callback' => 'ea_delete_category',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_delete_category( $data ) {
      $params = $data->get_params();
      $id =  $params['id'];
      PropertyCategory::find($id)->delete();
      return "موفق";

}


############ 1 ################
// END of category


// Start sell type logic
########## 2 ##############
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/get-sell-types', array(
        'methods' => 'GET',
        'callback' => 'ea_get_sell_types',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_get_sell_types( $data ) {

      $selltypes = SellType::get();
      return compact('selltypes');

}
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/add-sell-type', array(
        'methods' => 'POST',
        'callback' => 'ea_add_sell_type',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_add_sell_type( $data ) {
    $params = $data->get_params();
    $c = $params["selltype"];
    $selltype = SellType::create(['name' => $c]);
    return compact('selltype');

}
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/edit-sell-type', array(
        'methods' => 'POST',
        'callback' => 'ea_edit_sell_type',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_edit_sell_type( $data ) {
    $params = $data->get_params();
    $c = $params["selltype"];
    $id = $params["id"];
    SellType::find($id)->update(['name' => $c]);
    return "success";

}


add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/delete-sell-type', array(
        'methods' => 'POST',
        'callback' => 'ea_delete_sell_type',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_delete_sell_type( $data ) {
      $params = $data->get_params();
      $id =  $params['id'];
      SellType::find($id)->delete();
      return "موفق";

}

########## end 2 ##############

// feature
########## 3 ##########

add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/get-features', array(
        'methods' => 'GET',
        'callback' => 'ea_get_feature',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_get_feature( $data ) {

      $features = Fea::get();
      return compact('features');

}
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/add-feature', array(
        'methods' => 'POST',
        'callback' => 'ea_add_feature',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_add_feature( $data ) {
    $params = $data->get_params();
    $c = $params["feature"];
    $feature = Fea::create(['name' => $c]);
    return compact('feature');

}
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/edit-feature', array(
        'methods' => 'POST',
        'callback' => 'ea_edit_feature',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_edit_feature( $data ) {
    $params = $data->get_params();
    $c = $params["feature"];
    $id = $params["id"];
    Fea::find($id)->update(['name' => $c]);
    return "success";

}


add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/delete-feature', array(
        'methods' => 'POST',
        'callback' => 'ea_delete_feature',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_delete_feature( $data ) {
      $params = $data->get_params();
      $id =  $params['id'];
      Fea::find($id)->delete();
      return "موفق";

}

########## end 3 ############
//end feature


// facilities
###########  4 ############
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/get-facilities', array(
        'methods' => 'GET',
        'callback' => 'ea_get_facilities',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_get_facilities( $data ) {

      $facilities = Facility::get();
      return compact('facilities');

}
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/add-facility', array(
        'methods' => 'POST',
        'callback' => 'ea_add_facility',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_add_facility( $data ) {
    $params = $data->get_params();
    $c = $params["facility"];
    $facility = Facility::create(['name' => $c]);
    return compact('facility');

}
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/edit-facility', array(
        'methods' => 'POST',
        'callback' => 'ea_edit_facility',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_edit_facility( $data ) {
    $params = $data->get_params();
    $c = $params["facility"];
    $id = $params["id"];
    Facility::find($id)->update(['name' => $c]);
    return "success";

}


add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/delete-facility', array(
        'methods' => 'POST',
        'callback' => 'ea_delete_facility',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_delete_facility( $data ) {
      $params = $data->get_params();
      $id =  $params['id'];
      Facility::find($id)->delete();
      return "موفق";

}
###########  end section 4 ###########

//section 5
########### neighborhood #############3
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/get-provinces', array(
        'methods' => 'GET',
        'callback' => 'ea_get_provinces',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_get_provinces( $data ) {

      $provinces = Province::get()->toArray();
      return compact('provinces');

}

add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/add-neighborhood', array(
        'methods' => 'POST',
        'callback' => 'ea_add_neighborhood',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_add_neighborhood( $data ) {
    $params = $data->get_params();
    $c = $params["neighborhood"];
    $city_id = $params["city_id"];
    $neighborhood = Neighborhood::create(['name' => $c, 'city_id' => $city_id]);
    return compact('neighborhood');

}

add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/delete-neighborhood', array(
        'methods' => 'POST',
        'callback' => 'ea_delete_neighborhood',
        'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_delete_neighborhood( $data ) {
      $params = $data->get_params();
      $id =  $params['id'];
      Neighborhood::find($id)->delete();
      return "موفق";

}


// search form
add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/data/search', array(
        'methods' => 'GET',
        'callback' => 'ea_get_data_search',
       // 'permissions_callback' => 'is_user_logged_in',

      ) );
  } );

  function ea_get_data_search( $data ) {
    $params = $data->get_params();

    $from_build_time = $params['from_build_time'];
    $to_build_time = $params['to_build_time'];

    $form_register_time = $params['from_register_time'];
    $to_register_time = $params['to_register_time'];

    // from build time - to build time - from register time - to register time

    if($from_build_time){
      $fbt = str_replace("/","-",$from_build_time);
      $from_build_time = \Morilog\Jalali\CalendarUtils::createCarbonFromFormat('Y-m-d', $fbt)->format('Y-m-d');

    }
    if($to_build_time){
      $fbt = str_replace("/","-",$to_build_time);
      $to_build_time = \Morilog\Jalali\CalendarUtils::createCarbonFromFormat('Y-m-d', $fbt)->format('Y-m-d');

    }else{
        $to_build_time = date("Y-m-d");
    }

    if($form_register_time){
      $fbt = str_replace("/","-",$form_register_time);
      $form_register_time = \Morilog\Jalali\CalendarUtils::createCarbonFromFormat('Y-m-d', $fbt)->format('Y-m-d');

    }
    if($to_register_time){
      $fbt = str_replace("/","-",$to_register_time);
      $to_register_time = \Morilog\Jalali\CalendarUtils::createCarbonFromFormat('Y-m-d', $fbt)->format('Y-m-d');

    }else{
      $to_register_time = date("Y-m-d");
    }



    $from_price = (int)$params['from_price'];
    $to_price = (int)$params['to_price'];
    $from_rent_price = (int)$params['from_rent_price'];
    $to_rent_price = (int)$params['to_rent_price'];
    $from_size = (int)$params['from_size'];
    $to_size =  (int)$params['to_size'];
    $from_size_g = (int)$params['from_size_g'];
    $to_size_g =  (int)$params['to_size_g'];
    $bed_count = $params['bed_count'];
    $bath_count = $params['bath_count'];
    $parking_count = $params['parking_count'];
    $owner = $params['owner'];
    $special = $params['special'];
    $address = $params['address'];
    $property_category_id = $params['property_category_id'];
    $sell_type_id = $params['sell_type_id'];
    $feature_id = $params['feature_id'];
    $city_id = $params['city_id'];
    $province_id = $params['province_id'];
    $direction_id = $params['direction_id'];

    $facilities = $params['facilities']; // array
    $sellTypes = $params['sellTypes'] ?? []; // array
    $neighborhoods = $params['neighborhoods'] ?? []; // array


    //return $facilities;
    $query = Property::query();
    // We search value in multiple columns.

    if($from_price){
      $from_price = str_replace(",","",$from_price);
    }
    if($to_price){
      $to_price = str_replace(",","",$to_price);
    }
    if($from_rent_price){
      $from_rent_price = str_replace(",","",$from_rent_price);
    }
    if($to_rent_price){
      $to_rent_price = str_replace(",","",$to_rent_price);
    }


    if( is_array($facilities) && count($facilities) > 0){
    }else{
      $facilities = [];
    }

    $query->when($owner, function ($q, $search) {
      return $q->where('owner', 'like', '%'.$search.'%' );
    });
    $query->when($bed_count, function ($q, $search) {
      return $q->where('bed_count', $search );
    });
    $query->when($bath_count, function ($q, $search) {
      return $q->where('bath_count', $search );
    });
    $query->when($parking_count, function ($q, $search) {
      return $q->where('parking_count', $search );
    });
    $query->when($special, function ($q, $search) {
      return $q->where('special', 1 );
    });
    $query->when($address, function ($q, $search) {
      return $q->where('address', 'like', '%'.$search.'%' );

    });
    $query->when($property_category_id, function ($q, $search) {
      return $q->where('property_category_id', $search );

    });
    $query->when($sell_type_id, function ($q, $search) {
      return $q->where('sell_type_id', $search );

    });
    $query->when($feature_id, function ($q, $search) {
      return $q->where('feature_id', $search );

    });
    $query->when($city_id, function ($q, $search) {
      return $q->where('city_id', $search );

    });
    $query->when($province_id, function ($q, $search) {
      return $q->where('province_id', $search );

    });
    $query->when($direction_id, function ($q, $search) {
      return $q->where('direction_id', $search );

    });

    $query->when($sellTypes, function ($q, $search) {
      return  $q->whereIn('sell_type_id', $search);

    });
    $query->when($neighborhoods, function ($q, $search) {
      return  $q->whereIn('neighborhood_id', $search);
    });

    if($from_build_time  || $to_build_time ){

      $query->whereBetween('build_time', [$from_build_time, $to_build_time]);
    }

    if($form_register_time  || $to_register_time ){

      $query->whereBetween('created_at', [$form_register_time, $to_register_time ]);
    }


    if($from_price  || $to_price ){
      if(!$to_price){
        $to_price = 100000000000;
      }
      $query->whereRaw("(price <= ? AND price >= ?) ", [$to_price, $from_price]);
    }
    if($from_rent_price  || $to_rent_price ){
      if(!$to_rent_price){
        $to_rent_price = 100000000;
      }
      $query->whereRaw("(rent_price <= ? AND rent_price >= ?) ", [$to_rent_price, $from_rent_price]);
    }

    if($from_size  || $to_size ){
      if(!$to_size){
        $to_size = 1000;
      }
      $query->whereRaw("(size <= ? AND size >= ?) ", [$to_size  , $from_size ]);
    }

    if($from_size_g  || $to_size_g ){
      if(!$to_size_g){
        $to_size_g = 1000;
      }
      $query->whereRaw("(size <= ? AND size >= ?) ", [$to_size_g  , $from_size_g ]);
    }

   // $data = [];
    $data =  $query->limit(50)->get()->toArray();
   // return $data;

  if($facilities){
      $list = '('.implode(', ', $facilities).')';
      $re = DB::select("SELECT DISTINCT *
      FROM properties pro JOIN
      facility_property gc
            ON pro.id = gc.property_id JOIN
            facilities c
            ON c.id = gc.facility_id
      WHERE c.id IN $list");
    //  return gettype($data);
      $bb = array_merge($re, $data);
      return $bb;
    }
    return $data;
}

?>
