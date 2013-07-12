<?php
if(isset($_SERVER["REQUEST_METHOD"])){
	if($_SERVER["REQUEST_METHOD"] == "POST" AND isset($_POST["submit_button"])){

		$variables = array ("id","coworking_space_id","start_of_month_cash","incoming_cash","outgoing_cash","net_cash_burn","end_of_month_cash","runaway","create_date","modify_date");

        foreach ($variables as $v){
            if(isset($_POST[$v]) AND !is_null($_POST[$v])){
                $cash->setValue("$v",escape_data($_POST[$v]));
            } else {
                $errors[$v]="$v is not set.";
            }
        }
		if($edit_mode!=FALSE){
			$cash->update($dbc);
		}
		else{
			$cash->insert($dbc);
		}
	}
}
?>