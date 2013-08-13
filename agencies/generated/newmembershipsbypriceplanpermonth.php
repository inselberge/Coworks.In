<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class newMembershipsByPricePlanPerMonthAgency
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