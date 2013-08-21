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
 * Class viewConference_RoomAgency
 *
 * @category Model
 * @package  viewConference_Room
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewConference_RoomAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewConference_RoomAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewConference_RoomAgency)){
            self::$viewConference_RoomAgency = new viewConference_RoomAgency($dbc);
        }
        return self::$viewConference_RoomAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewConference_Room ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewConference_Room");
        }
    }

}