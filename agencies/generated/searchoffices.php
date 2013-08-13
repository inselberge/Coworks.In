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
 * Class searchOfficesAgency
 *
 * @category Model
 * @package  searchOffices
 * @author   
 * @license  TBD
 * @link     TBD
 */
class searchOfficesAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchOfficesAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchOfficesAgency)){
            self::$searchOfficesAgency = new searchOfficesAgency($dbc);
        }
        return self::$searchOfficesAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchOffices ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchOffices");
        }
    }

}