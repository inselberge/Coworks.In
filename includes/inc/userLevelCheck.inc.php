<?php
define('PROSPECT', 'prospect');
define('COMMUNITY_MEMBER','community');
define('DESK_USER', 'desk');
define('MENTOR', 'mentor');
define('OPS', 'operations_management');
define('BIZ', 'business_management');
define('ADMIN', 'administrator');

class userCheck {

    protected $userLevel;
    protected $requiredLevel;

    /**  setRequiredLevel
     * @param mixed $requiredLevel
     * @return boolean
     */
    public function setRequiredLevel( $requiredLevel )
    {
        try {
            if ( checkInput::checkNewInputArray($requiredLevel) ) {
                $this->requiredLevel = $requiredLevel;
            } else {
                throw new exceptionHandler(__METHOD__ . ": requiredLevel is not valid");
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    /**  setUserLevel
     * @param mixed $userLevel
     * @return boolean
     */
    public function setUserLevel()
    {
        try {
            if ( $this->checkSessionSet() ) {
                $this->userLevel = $_SESSION['user_type'];
            } else {
                throw new exceptionHandler(__METHOD__ . ": userLevel is not valid");
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    // ************ USER LEVEL CHECK FUNCTION ************ //
    // ******************************************* //
    public function tryUserLevelCheck(){
        if( $this->checkSessionSet() ){
            if($this->userLevelCheck()){

            }
            else{
                //TODO: log the user_id and activity
                redirect_invalid_user();
            }
        }
        else{
            //TODO: log the user IP information

            redirect_invalid_user();
        }
    }

    /** userLevelCheck
     * @return bool
     */
    function userLevelCheck() {
        if($this->checkSessionSet()){
            foreach($this->userLevel as $level)
            {
                if(in_array($level,$this->requiredLevel)){
                    return true;
                }
            }
            return false;
        } else {
            return false;
        }
    }


    protected function checkSessionSet(){
        if( isset($_SESSION['user_type']) AND !is_null($_SESSION['user_type']) ) {
            return true;
        }
        else{
            return false;
        }
    }

    protected function checkRequired()
    {
        if(isset($this->requiredLevel) AND !empty($this->requiredLevel)){
            return true;
        } else {
            return false;
        }
    }
}
/*
 *   Test for the function above
for($i =1;$i<=5;$i++){
    for($j=1;$j<=5;$j++){
        echo "USER LEVEL: $i, REQUIRED_LEVEL: $j ->".(int)userLevelCheck($i,$j). "\n";
    }
}
*/