<?php 
/**
 * PHP version 5.4.17-1~dotdeb.1
 * Created by Amphibian
 * Project: Coworks.In
 * User: 
 * Date: 08/14/2013
 * Time: 00:46:10
 */
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewPaying_CustomersAgency
 *
 * @category Model
 * @package  viewPaying_Customers
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewPaying_CustomersAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewPaying_CustomersAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewPaying_CustomersAgency)){
            self::$viewPaying_CustomersAgency = new viewPaying_CustomersAgency($dbc);
        }
        return self::$viewPaying_CustomersAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewPaying_Customers ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewPaying_Customers");
        }
    }

}