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
 * Class newMembershipsByPricePlanPerMonthAgency
 *
 * @category Model
 * @package  newMembershipsByPricePlanPerMonth
 * @author   
 * @license  TBD
 * @link     TBD
 */
class newMembershipsByPricePlanPerMonthAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $newMembershipsByPricePlanPerMonthAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$newMembershipsByPricePlanPerMonthAgency)){
            self::$newMembershipsByPricePlanPerMonthAgency = new newMembershipsByPricePlanPerMonthAgency($dbc);
        }
        return self::$newMembershipsByPricePlanPerMonthAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM newMembershipsByPricePlanPerMonth ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM newMembershipsByPricePlanPerMonth");
        }
    }

}