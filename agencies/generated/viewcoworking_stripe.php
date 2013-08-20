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
 * Class viewCoworking_StripeAgency
 *
 * @category Model
 * @package  viewCoworking_Stripe
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewCoworking_StripeAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCoworking_StripeAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCoworking_StripeAgency)){
            self::$viewCoworking_StripeAgency = new viewCoworking_StripeAgency($dbc);
        }
        return self::$viewCoworking_StripeAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCoworking_Stripe ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCoworking_Stripe");
        }
    }

}