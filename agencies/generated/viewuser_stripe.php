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
 * Class viewUser_StripeAgency
 *
 * @category Model
 * @package  viewUser_Stripe
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_StripeAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_StripeAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_StripeAgency)){
            self::$viewUser_StripeAgency = new viewUser_StripeAgency($dbc);
        }
        return self::$viewUser_StripeAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Stripe ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Stripe");
        }
    }

}