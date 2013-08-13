<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewJobAgency
 */
class viewJobAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewJobAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewJobAgency)){
            self::$viewJobAgency = new viewJobAgency($dbc);
        }
        return self::$viewJobAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewJob ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewJob");
        }
    }

}