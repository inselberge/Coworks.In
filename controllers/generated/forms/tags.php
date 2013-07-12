<?php
if(isset($_SERVER["REQUEST_METHOD"])){
	if($_SERVER["REQUEST_METHOD"] == "POST" AND isset($_POST["submit_button"])){

		$variables = array ("id","tag","status","create_date","modify_date","modify_user","modify_reason");

        foreach ($variables as $v){
            if(isset($_POST[$v]) AND !is_null($_POST[$v])){
                $tags->setValue("$v",escape_data($_POST[$v]));
            } else {
                $errors[$v]="$v is not set.";
            }
        }
		if($edit_mode!=FALSE){
			$tags->update($dbc);
		}
		else{
			$tags->insert($dbc);
		}
	}
}
?>