<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewCoworking_StripeAgency
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