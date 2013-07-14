<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class searchHelpAgency
 */
class searchHelpAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchHelpAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchHelpAgency)){
            self::$searchHelpAgency = new searchHelpAgency($dbc);
        }
        return self::$searchHelpAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchHelp ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchHelp");
        }
    }

}