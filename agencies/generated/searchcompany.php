<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class searchCompanyAgency
 */
class searchCompanyAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchCompanyAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchCompanyAgency)){
            self::$searchCompanyAgency = new searchCompanyAgency($dbc);
        }
        return self::$searchCompanyAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchCompany ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchCompany");
        }
    }

}