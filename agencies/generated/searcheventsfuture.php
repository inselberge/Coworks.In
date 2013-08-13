<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class searchEventsFutureAgency
 */
class searchEventsFutureAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchEventsFutureAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchEventsFutureAgency)){
            self::$searchEventsFutureAgency = new searchEventsFutureAgency($dbc);
        }
        return self::$searchEventsFutureAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchEventsFuture ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchEventsFuture");
        }
    }

}