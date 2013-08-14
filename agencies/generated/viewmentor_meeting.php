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