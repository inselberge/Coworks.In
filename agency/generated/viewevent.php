<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewEventAgency
 */
class viewEventAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewEventAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewEventAgency)){
            self::$viewEventAgency = new viewEventAgency($dbc);
        }
        return self::$viewEventAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewEvent ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewEvent");
        }
    }

}