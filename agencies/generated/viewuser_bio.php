<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewUser_BioAgency
 */
class viewUser_BioAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_BioAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_BioAgency)){
            self::$viewUser_BioAgency = new viewUser_BioAgency($dbc);
        }
        return self::$viewUser_BioAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Bio ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Bio");
        }
    }

}