<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewUser_CaveAgency
 */
class viewUser_CaveAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_CaveAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_CaveAgency)){
            self::$viewUser_CaveAgency = new viewUser_CaveAgency($dbc);
        }
        return self::$viewUser_CaveAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Cave ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Cave");
        }
    }

}