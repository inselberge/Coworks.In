<?php
if(isset($_SERVER["REQUEST_METHOD"])){
	if($_SERVER["REQUEST_METHOD"] == "POST" AND isset($_POST["submit_button"])){

		$variables = array ("id","question_id","user_id","title","response","status","thread","flag","last_flagged","create_date","modify_date","modify_user","modify_reason");

        foreach ($variables as $v){
            if(isset($_POST[$v]) AND !is_null($_POST[$v])){
                $response->setValue("$v",escape_data($_POST[$v]));
            } else {
                $errors[$v]="$v is not set.";
            }
        }
		if($edit_mode!=FALSE){
			$response->update($dbc);
		}
		else{
			$response->insert($dbc);
		}
	}
}
?>