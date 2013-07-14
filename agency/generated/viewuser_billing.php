<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewUser_BillingAgency
 */
class viewUser_BillingAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_BillingAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_BillingAgency)){
            self::$viewUser_BillingAgency = new viewUser_BillingAgency($dbc);
        }
        return self::$viewUser_BillingAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Billing ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Billing");
        }
    }

}