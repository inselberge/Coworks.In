<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewHelp_TagsAgency
 */
class viewHelp_TagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewHelp_TagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewHelp_TagsAgency)){
            self::$viewHelp_TagsAgency = new viewHelp_TagsAgency($dbc);
        }
        return self::$viewHelp_TagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewHelp_Tags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewHelp_Tags");
        }
    }

}