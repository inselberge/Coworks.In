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
 * Class searchEventsAgency
 *
 * @category Model
 * @package  searchEvents
 * @author   
 * @license  TBD
 * @link     TBD
 */
class searchEventsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchEventsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchEventsAgency)){
            self::$searchEventsAgency = new searchEventsAgency($dbc);
        }
        return self::$searchEventsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchEvents ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchEvents");
        }
    }

}