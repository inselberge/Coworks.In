<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class searchCirclesAgency
 */
class searchCirclesAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchCirclesAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchCirclesAgency)){
            self::$searchCirclesAgency = new searchCirclesAgency($dbc);
        }
        return self::$searchCirclesAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchCircles ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchCircles");
        }
    }

}