<?php
if(isset($_SERVER["REQUEST_METHOD"])){
	if($_SERVER["REQUEST_METHOD"] == "POST" AND isset($_POST["submit_button"])){

		$variables = array ("id","coworking_space_id","start_of_month_customers","new_customers","conversion_rate","lost_customers","churn_rate","net_new_customers","end_of_month_customers","growth_customers","create_date","modify_date");

        foreach ($variables as $v){
            if(isset($_POST[$v]) AND !is_null($_POST[$v])){
                $paying_customers->setValue("$v",escape_data($_POST[$v]));
            } else {
                $errors[$v]="$v is not set.";
            }
        }
		if($edit_mode!=FALSE){
			$paying_customers->update($dbc);
		}
		else{
			$paying_customers->insert($dbc);
		}
	}
}
?>