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
 * Class viewMentor_MeetingAgency
 *
 * @category Model
 * @package  viewMentor_Meeting
 * @author   
 * @license  TBD
 * @link     TBD
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