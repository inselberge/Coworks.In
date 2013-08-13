<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewCoworking_Space_Billing_PlanAgency
 */
class viewCoworking_Space_Billing_PlanAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCoworking_Space_Billing_PlanAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCoworking_Space_Billing_PlanAgency)){
            self::$viewCoworking_Space_Billing_PlanAgency = new viewCoworking_Space_Billing_PlanAgency($dbc);
        }
        return self::$viewCoworking_Space_Billing_PlanAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCoworking_Space_Billing_Plan ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCoworking_Space_Billing_Plan");
        }
    }

}