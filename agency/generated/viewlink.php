<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewLinkAgency
 */
class viewLinkAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewLinkAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewLinkAgency)){
            self::$viewLinkAgency = new viewLinkAgency($dbc);
        }
        return self::$viewLinkAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewLink ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewLink");
        }
    }

}