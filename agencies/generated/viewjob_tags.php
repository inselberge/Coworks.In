<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewJob_TagsAgency
 */
class viewJob_TagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewJob_TagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewJob_TagsAgency)){
            self::$viewJob_TagsAgency = new viewJob_TagsAgency($dbc);
        }
        return self::$viewJob_TagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewJob_Tags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewJob_Tags");
        }
    }

}