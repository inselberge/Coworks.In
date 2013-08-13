<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewLocationCoworkingAgency
 */
class viewLocationCoworkingAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewLocationCoworkingAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewLocationCoworkingAgency)){
            self::$viewLocationCoworkingAgency = new viewLocationCoworkingAgency($dbc);
        }
        return self::$viewLocationCoworkingAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewLocationCoworking ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewLocationCoworking");
        }
    }

}