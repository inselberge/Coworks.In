<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewLink_TagsAgency
 */
class viewLink_TagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewLink_TagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewLink_TagsAgency)){
            self::$viewLink_TagsAgency = new viewLink_TagsAgency($dbc);
        }
        return self::$viewLink_TagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewLink_Tags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewLink_Tags");
        }
    }

}