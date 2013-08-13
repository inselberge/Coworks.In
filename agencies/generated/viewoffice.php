<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewOfficeAgency
 */
class viewOfficeAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewOfficeAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewOfficeAgency)){
            self::$viewOfficeAgency = new viewOfficeAgency($dbc);
        }
        return self::$viewOfficeAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewOffice ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewOffice");
        }
    }

}