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
 * Class viewReferralAgency
 *
 * @category Model
 * @package  viewReferral
 * @author   
 * @license  TBD
 * @link     TBD
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