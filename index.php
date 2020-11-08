<?php
/**
 * Plugin Name: amlak
 * Description: A demo on how to use Vue in WordPress.
 */

//Register scripts to use
function func_load_vuescripts() {
	wp_register_script('wpvue_vuejs',plugin_dir_url( __FILE__ ).'bee/dist/js/app.js', true);
	wp_register_script('my_vuecode', plugin_dir_url( __FILE__ ).'bee/dist/js/chunk-vendors.js', true);
}
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



add_action( 'rest_api_init', function () {
  register_rest_route( 'api/v1', '/product/', array(
        'methods' => 'GET',
        'callback' => 'ea_get_users',
      ) );
  } );

  function ea_get_users( $data ) {
      //$identifier = $data->get_param( 'identifier' );
      $users = get_users();
      $users = $users;
      return $users;
  }

?>
