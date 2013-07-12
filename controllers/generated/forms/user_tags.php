<?php
if(isset($_SERVER["REQUEST_METHOD"])){
	if($_SERVER["REQUEST_METHOD"] == "POST" AND isset($_POST["submit_button"])){

		$variables = array ("id","user_id","tags_id","status","create_date","modify_date");

        foreach ($variables as $v){
            if(isset($_POST[$v]) AND !is_null($_POST[$v])){
                $user_tags->setValue("$v",escape_data($_POST[$v]));
            } else {
                $errors[$v]="$v is not set.";
            }
        }
		if($edit_mode!=FALSE){
			$user_tags->update($dbc);
		}
		else{
			$user_tags->insert($dbc);
		}
	}
}
?>