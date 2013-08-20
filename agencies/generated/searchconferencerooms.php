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