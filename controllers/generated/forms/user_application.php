<?php
if(isset($_SERVER["REQUEST_METHOD"])){
	if($_SERVER["REQUEST_METHOD"] == "POST" AND isset($_POST["submit_button"])){

		$variables = array ("id","user_id","languages","skills","started_business","work_habit","other","interests","special","convicted_felon","computer_fraud_or_theft","promo_code","create_date");

        foreach ($variables as $v){
            if(isset($_POST[$v]) AND !is_null($_POST[$v])){
                $user_application->setValue("$v",escape_data($_POST[$v]));
            } else {
                $errors[$v]="$v is not set.";
            }
        }
		if($edit_mode!=FALSE){
			$user_application->update($dbc);
		}
		else{
			$user_application->insert($dbc);
		}
	}
}
?>