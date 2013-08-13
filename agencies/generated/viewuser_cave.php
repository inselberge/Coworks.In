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
 * Class viewUser_CaveAgency
 *
 * @category Model
 * @package  viewUser_Cave
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_CaveAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_CaveAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_CaveAgency)){
            self::$viewUser_CaveAgency = new viewUser_CaveAgency($dbc);
        }
        return self::$viewUser_CaveAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Cave ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Cave");
        }
    }

}