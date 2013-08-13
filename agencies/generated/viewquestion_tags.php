<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewQuestion_TagsAgency
 */
class viewQuestion_TagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewQuestion_TagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewQuestion_TagsAgency)){
            self::$viewQuestion_TagsAgency = new viewQuestion_TagsAgency($dbc);
        }
        return self::$viewQuestion_TagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewQuestion_Tags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewQuestion_Tags");
        }
    }

}