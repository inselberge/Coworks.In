<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class searchUserNameAgency
 */
class searchUserNameAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchUserNameAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchUserNameAgency)){
            self::$searchUserNameAgency = new searchUserNameAgency($dbc);
        }
        return self::$searchUserNameAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchUserName ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchUserName");
        }
    }

}