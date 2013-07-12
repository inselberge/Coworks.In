<?php
if(isset($_SERVER["REQUEST_METHOD"])){
	if($_SERVER["REQUEST_METHOD"] == "POST" AND isset($_POST["submit_button"])){

		$variables = array ("id","location_id","user_id","check_in","check_out","time_on_location","method");

        foreach ($variables as $v){
            if(isset($_POST[$v]) AND !is_null($_POST[$v])){
                $location_user_status->setValue("$v",escape_data($_POST[$v]));
            } else {
                $errors[$v]="$v is not set.";
            }
        }
		if($edit_mode!=FALSE){
			$location_user_status->update($dbc);
		}
		else{
			$location_user_status->insert($dbc);
		}
	}
}
?>