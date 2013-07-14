<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewUser_TagsAgency
 */
class viewUser_TagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_TagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_TagsAgency)){
            self::$viewUser_TagsAgency = new viewUser_TagsAgency($dbc);
        }
        return self::$viewUser_TagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Tags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Tags");
        }
    }

}