<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewCircleAgency
 */
class viewCircleAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCircleAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCircleAgency)){
            self::$viewCircleAgency = new viewCircleAgency($dbc);
        }
        return self::$viewCircleAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCircle ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCircle");
        }
    }

}