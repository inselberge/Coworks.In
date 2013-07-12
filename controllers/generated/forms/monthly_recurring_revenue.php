<?php
if(isset($_SERVER["REQUEST_METHOD"])){
	if($_SERVER["REQUEST_METHOD"] == "POST" AND isset($_POST["submit_button"])){

		$variables = array ("id","coworking_space_id","start_of_month_recurring_revenue","new_recurring_revenue_from_new_customers","new_recurring_revenue_from_expansion","total_new_recurring_revenue","lost_recurring_revenue_from_contraction","churn_rate","net_new_recurring_revenue","end_of_month_recurring_revenue","month_over_month_growth","average_revenue_per_account","average_revenue_per_new_account","create_date","modify_date");

        foreach ($variables as $v){
            if(isset($_POST[$v]) AND !is_null($_POST[$v])){
                $monthly_recurring_revenue->setValue("$v",escape_data($_POST[$v]));
            } else {
                $errors[$v]="$v is not set.";
            }
        }
		if($edit_mode!=FALSE){
			$monthly_recurring_revenue->update($dbc);
		}
		else{
			$monthly_recurring_revenue->insert($dbc);
		}
	}
}
?>