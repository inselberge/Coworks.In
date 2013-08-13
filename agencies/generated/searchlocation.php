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
 * Class searchLocationAgency
 *
 * @category Model
 * @package  searchLocation
 * @author   
 * @license  TBD
 * @link     TBD
 */
class searchLocationAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchLocationAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchLocationAgency)){
            self::$searchLocationAgency = new searchLocationAgency($dbc);
        }
        return self::$searchLocationAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchLocation ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchLocation");
        }
    }

}