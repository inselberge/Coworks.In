<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewHelpAgency
 */
class viewHelpAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewHelpAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewHelpAgency)){
            self::$viewHelpAgency = new viewHelpAgency($dbc);
        }
        return self::$viewHelpAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewHelp ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewHelp");
        }
    }

}