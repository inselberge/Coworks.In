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
 * Class searchEventsFutureAgency
 *
 * @category Model
 * @package  searchEventsFuture
 * @author   
 * @license  TBD
 * @link     TBD
 */
class searchEventsFutureAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchEventsFutureAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchEventsFutureAgency)){
            self::$searchEventsFutureAgency = new searchEventsFutureAgency($dbc);
        }
        return self::$searchEventsFutureAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchEventsFuture ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchEventsFuture");
        }
    }

}