<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewTagsAgency
 */
class viewTagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewTagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewTagsAgency)){
            self::$viewTagsAgency = new viewTagsAgency($dbc);
        }
        return self::$viewTagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewTags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewTags");
        }
    }

}