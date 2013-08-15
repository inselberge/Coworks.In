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
 * Class viewCustomer_Acquisition_CostAgency
 *
 * @category Model
 * @package  viewCustomer_Acquisition_Cost
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewCustomer_Acquisition_CostAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCustomer_Acquisition_CostAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCustomer_Acquisition_CostAgency)){
            self::$viewCustomer_Acquisition_CostAgency = new viewCustomer_Acquisition_CostAgency($dbc);
        }
        return self::$viewCustomer_Acquisition_CostAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCustomer_Acquisition_Cost ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCustomer_Acquisition_Cost");
        }
    }

}