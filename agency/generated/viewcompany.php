<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewCompanyAgency
 */
class viewCompanyAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCompanyAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCompanyAgency)){
            self::$viewCompanyAgency = new viewCompanyAgency($dbc);
        }
        return self::$viewCompanyAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCompany ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCompany");
        }
    }

}