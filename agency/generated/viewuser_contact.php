<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewUser_ContactAgency
 */
class viewUser_ContactAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_ContactAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_ContactAgency)){
            self::$viewUser_ContactAgency = new viewUser_ContactAgency($dbc);
        }
        return self::$viewUser_ContactAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Contact ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Contact");
        }
    }

}