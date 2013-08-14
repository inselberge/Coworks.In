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