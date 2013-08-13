<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewCompany_LocationAgency
 */
class viewCompany_LocationAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCompany_LocationAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCompany_LocationAgency)){
            self::$viewCompany_LocationAgency = new viewCompany_LocationAgency($dbc);
        }
        return self::$viewCompany_LocationAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCompany_Location ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCompany_Location");
        }
    }

}