<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewEvent_AttendanceAgency
 */
class viewEvent_AttendanceAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewEvent_AttendanceAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewEvent_AttendanceAgency)){
            self::$viewEvent_AttendanceAgency = new viewEvent_AttendanceAgency($dbc);
        }
        return self::$viewEvent_AttendanceAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewEvent_Attendance ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewEvent_Attendance");
        }
    }

}