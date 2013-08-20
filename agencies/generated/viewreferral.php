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