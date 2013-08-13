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
 * Class searchConferenceRoomsAgency
 *
 * @category Model
 * @package  searchConferenceRooms
 * @author   
 * @license  TBD
 * @link     TBD
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