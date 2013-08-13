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
 * Class viewBilling_PlanAgency
 *
 * @category Model
 * @package  viewBilling_Plan
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewBilling_PlanAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewBilling_PlanAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewBilling_PlanAgency)){
            self::$viewBilling_PlanAgency = new viewBilling_PlanAgency($dbc);
        }
        return self::$viewBilling_PlanAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewBilling_Plan ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewBilling_Plan");
        }
    }

}