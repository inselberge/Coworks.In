<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class searchOfficesAgency
 */
class searchOfficesAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchOfficesAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchOfficesAgency)){
            self::$searchOfficesAgency = new searchOfficesAgency($dbc);
        }
        return self::$searchOfficesAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchOffices ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchOffices");
        }
    }

}