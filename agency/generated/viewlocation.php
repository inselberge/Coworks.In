<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewLocationAgency
 */
class viewLocationAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewLocationAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewLocationAgency)){
            self::$viewLocationAgency = new viewLocationAgency($dbc);
        }
        return self::$viewLocationAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewLocation ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewLocation");
        }
    }

}