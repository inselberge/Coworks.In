<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewResponseAgency
 */
class viewResponseAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewResponseAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewResponseAgency)){
            self::$viewResponseAgency = new viewResponseAgency($dbc);
        }
        return self::$viewResponseAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewResponse ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewResponse");
        }
    }

}