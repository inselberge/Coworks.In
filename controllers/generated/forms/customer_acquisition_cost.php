<?php
if(isset($_SERVER["REQUEST_METHOD"])){
	if($_SERVER["REQUEST_METHOD"] == "POST" AND isset($_POST["submit_button"])){

		$variables = array ("id","coworking_space_id","marketing_spend","spend_per_signup_blended","spend_per_signup_paid","sales_spend","sales_spend_per_new_paying_customer","total_customer_acquisition_cost_blended","total_customer_acquisition_cost_paid","time_to_recover_cac_in_months","customer_lifetime_value","customer_lifetime_value_acquisition_cost_multiple","create_date","modify_date");

        foreach ($variables as $v){
            if(isset($_POST[$v]) AND !is_null($_POST[$v])){
                $customer_acquisition_cost->setValue("$v",escape_data($_POST[$v]));
            } else {
                $errors[$v]="$v is not set.";
            }
        }
		if($edit_mode!=FALSE){
			$customer_acquisition_cost->update($dbc);
		}
		else{
			$customer_acquisition_cost->insert($dbc);
		}
	}
}
?>