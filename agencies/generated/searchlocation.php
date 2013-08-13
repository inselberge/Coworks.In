<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class searchLocationAgency
 */
class searchLocationAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchLocationAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchLocationAgency)){
            self::$searchLocationAgency = new searchLocationAgency($dbc);
        }
        return self::$searchLocationAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchLocation ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchLocation");
        }
    }

}