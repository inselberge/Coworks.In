<?php
if(isset($_SERVER["REQUEST_METHOD"])){
	if($_SERVER["REQUEST_METHOD"] == "POST" AND isset($_POST["submit_button"])){

		$variables = array ("id","coworking_space_id","last_month_visitors","current_visitors","growth_of_visitors","start_of_month_signups","referral_signups","walk_in_signups","paid_signups","total_new_signups","last_month_signups","growth_of_signups","conversion_rate","total_referrals","referral_conversion_rate","end_of_month_signups","create_date","modify_date");

        foreach ($variables as $v){
            if(isset($_POST[$v]) AND !is_null($_POST[$v])){
                $signup->setValue("$v",escape_data($_POST[$v]));
            } else {
                $errors[$v]="$v is not set.";
            }
        }
		if($edit_mode!=FALSE){
			$signup->update($dbc);
		}
		else{
			$signup->insert($dbc);
		}
	}
}
?>