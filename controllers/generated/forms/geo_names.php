<?php
if(isset($_SERVER["REQUEST_METHOD"])){
	if($_SERVER["REQUEST_METHOD"] == "POST" AND isset($_POST["submit_button"])){

		$variables = array ("id","country code","postal_code","place_name","state_name","state_code","county_name","county_code","community_name","community_code","latitude","longitude","accuracy","status","modify_date","modify_user","modify_reason");

        foreach ($variables as $v){
            if(isset($_POST[$v]) AND !is_null($_POST[$v])){
                $geo_names->setValue("$v",escape_data($_POST[$v]));
            } else {
                $errors[$v]="$v is not set.";
            }
        }
		if($edit_mode!=FALSE){
			$geo_names->update($dbc);
		}
		else{
			$geo_names->insert($dbc);
		}
	}
}
?>