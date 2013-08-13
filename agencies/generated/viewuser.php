<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewUserAgency
 */
class viewUserAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUserAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUserAgency)){
            self::$viewUserAgency = new viewUserAgency($dbc);
        }
        return self::$viewUserAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser");
        }
    }

}