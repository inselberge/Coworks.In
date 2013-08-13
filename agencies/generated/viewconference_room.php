<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewConference_RoomAgency
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