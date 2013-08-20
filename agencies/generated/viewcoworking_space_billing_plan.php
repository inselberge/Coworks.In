<?php 
/**
 * PHP version 5.4.17-1~dotdeb.1
 * Created by Amphibian
 * Project: Coworks.In
 * User: 
 * Date: 08/20/2013
 * Time: 16:34:15
 */
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewCoworking_Space_Billing_PlanAgency
 *
 * @category Model
 * @package  viewCoworking_Space_Billing_Plan
 * @author   
 * @license  TBD
 * @link     TBD
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