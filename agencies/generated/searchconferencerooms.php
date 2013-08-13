<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class searchConferenceRoomsAgency
 */
class searchConferenceRoomsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchConferenceRoomsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchConferenceRoomsAgency)){
            self::$searchConferenceRoomsAgency = new searchConferenceRoomsAgency($dbc);
        }
        return self::$searchConferenceRoomsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchConferenceRooms ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchConferenceRooms");
        }
    }

}