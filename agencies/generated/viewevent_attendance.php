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
 * Class viewEvent_AttendanceAgency
 *
 * @category Model
 * @package  viewEvent_Attendance
 * @author   
 * @license  TBD
 * @link     TBD
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