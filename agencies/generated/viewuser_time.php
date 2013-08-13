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
 * Class viewUser_TimeAgency
 *
 * @category Model
 * @package  viewUser_Time
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_TimeAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_TimeAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_TimeAgency)){
            self::$viewUser_TimeAgency = new viewUser_TimeAgency($dbc);
        }
        return self::$viewUser_TimeAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Time ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Time");
        }
    }

}