<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewMentor_MeetingAgency
 */
class viewMentor_MeetingAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewMentor_MeetingAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewMentor_MeetingAgency)){
            self::$viewMentor_MeetingAgency = new viewMentor_MeetingAgency($dbc);
        }
        return self::$viewMentor_MeetingAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewMentor_Meeting ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewMentor_Meeting");
        }
    }

}