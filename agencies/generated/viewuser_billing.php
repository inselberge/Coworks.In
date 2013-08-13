<?php 
/**
 * PHP version 5.4.9-4ubuntu2.2
 * Created by Amphibian
 * Project: Coworks.In
 * User: 
 * Date: 08/13/2013
 * Time: 01:07:20
 */
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewUser_BillingAgency
 *
 * @category Model
 * @package  viewUser_Billing
 * @author   
 * @license  TBD
 * @link     TBD
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