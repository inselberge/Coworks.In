<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewCompany_TagsAgency
 */
class viewCompany_TagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCompany_TagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCompany_TagsAgency)){
            self::$viewCompany_TagsAgency = new viewCompany_TagsAgency($dbc);
        }
        return self::$viewCompany_TagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCompany_Tags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCompany_Tags");
        }
    }

}