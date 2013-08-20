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