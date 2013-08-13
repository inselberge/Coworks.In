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
 * Class viewEvent_RoomAgency
 *
 * @category Model
 * @package  viewEvent_Room
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewEvent_RoomAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewEvent_RoomAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewEvent_RoomAgency)){
            self::$viewEvent_RoomAgency = new viewEvent_RoomAgency($dbc);
        }
        return self::$viewEvent_RoomAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewEvent_Room ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewEvent_Room");
        }
    }

}