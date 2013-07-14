<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewLocation_User_StatusAgency
 */
class viewLocation_User_StatusAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewLocation_User_StatusAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewLocation_User_StatusAgency)){
            self::$viewLocation_User_StatusAgency = new viewLocation_User_StatusAgency($dbc);
        }
        return self::$viewLocation_User_StatusAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewLocation_User_Status ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewLocation_User_Status");
        }
    }

}