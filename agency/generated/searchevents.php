<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class searchEventsAgency
 */
class searchEventsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchEventsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchEventsAgency)){
            self::$searchEventsAgency = new searchEventsAgency($dbc);
        }
        return self::$searchEventsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchEvents ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchEvents");
        }
    }

}