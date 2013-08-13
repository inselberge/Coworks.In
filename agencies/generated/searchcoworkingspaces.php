<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class searchCoworkingSpacesAgency
 */
class searchCoworkingSpacesAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchCoworkingSpacesAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchCoworkingSpacesAgency)){
            self::$searchCoworkingSpacesAgency = new searchCoworkingSpacesAgency($dbc);
        }
        return self::$searchCoworkingSpacesAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchCoworkingSpaces ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchCoworkingSpaces");
        }
    }

}