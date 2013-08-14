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
 * Class viewMentor_AvailabilityAgency
 *
 * @category Model
 * @package  viewMentor_Availability
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewMentor_AvailabilityAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewMentor_AvailabilityAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewMentor_AvailabilityAgency)){
            self::$viewMentor_AvailabilityAgency = new viewMentor_AvailabilityAgency($dbc);
        }
        return self::$viewMentor_AvailabilityAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewMentor_Availability ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewMentor_Availability");
        }
    }

}