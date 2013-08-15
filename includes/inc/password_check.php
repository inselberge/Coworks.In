<?php # password_check.php

function isAlpha($pass){
	if(preg_match("/^[A-Za-z0-9!*?&=\$_.-]+$/",$pass)==1){
		return TRUE;
	}
	else{
		return FALSE;
	}
}

function hasNumbers($password,$length){
	if(isset($password,$length) AND is_numeric($length)){
		for($i=0;$i<$length;$i++){
			if(is_numeric($password[$i])){
				return TRUE;
			}			
		}
		return FALSE;
	}
	else{
		return FALSE;
	}
}

function hasCaps($password){
	if(preg_match("/[A-Z]+/",$password)==1){
		return TRUE;
	}
	else{
		return FALSE;
	}
}

function isOnePassword($pass){
	if(str_word_count($pass)==1){
		return TRUE;
	}
	else{
		return FALSE;
	}
}

// Validate the received first name:
if (!empty($_GET['pw'])) {

  $password=stripslashes(trim($_GET['pw']));
  $length=strlen($password);
  if($length>6){
			if(isAlpha($password)){
				if(hasNumbers($password,$length)){
					if(hasCaps($password)){
						echo '<span class="success">GOOD PASSWORD!!!</span>';	
					}
					else{
						echo '<span class="error">Passwords must have a capital letter.</span>';
					}
				}
				else{
					echo '<span class="error">Passwords must have a number.</span>';
				}				
			}
			else{
				echo '<span class="error">Passwords must be alpha numeric.</span>';
			}
  }
  else{
  		echo '<span class="error">Passwords should be between 8-20 characters.</span>';
  }
} else {
    echo '<span class="error">Passwords should be between 8-20 alphanumeric characters, have a number, and have a capital letter.</span>';
}

?>