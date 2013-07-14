<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewUser_TypeAgency
 */
class viewUser_TypeAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_TypeAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_TypeAgency)){
            self::$viewUser_TypeAgency = new viewUser_TypeAgency($dbc);
        }
        return self::$viewUser_TypeAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Type ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Type");
        }
    }

}