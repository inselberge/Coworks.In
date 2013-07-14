<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewReferralAgency
 */
class viewReferralAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewReferralAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewReferralAgency)){
            self::$viewReferralAgency = new viewReferralAgency($dbc);
        }
        return self::$viewReferralAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewReferral ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewReferral");
        }
    }

}