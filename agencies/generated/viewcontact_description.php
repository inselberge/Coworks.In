<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewContact_DescriptionAgency
 */
class viewContact_DescriptionAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewContact_DescriptionAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewContact_DescriptionAgency)){
            self::$viewContact_DescriptionAgency = new viewContact_DescriptionAgency($dbc);
        }
        return self::$viewContact_DescriptionAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewContact_Description ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewContact_Description");
        }
    }

}