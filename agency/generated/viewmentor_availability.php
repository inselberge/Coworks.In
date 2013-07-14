<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewMentor_AvailabilityAgency
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