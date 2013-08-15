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
 * Class viewMonthly_Recurring_RevenueAgency
 *
 * @category Model
 * @package  viewMonthly_Recurring_Revenue
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewMonthly_Recurring_RevenueAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewMonthly_Recurring_RevenueAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewMonthly_Recurring_RevenueAgency)){
            self::$viewMonthly_Recurring_RevenueAgency = new viewMonthly_Recurring_RevenueAgency($dbc);
        }
        return self::$viewMonthly_Recurring_RevenueAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewMonthly_Recurring_Revenue ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewMonthly_Recurring_Revenue");
        }
    }

}