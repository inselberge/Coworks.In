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
 * Class viewUser_LoginAgency
 *
 * @category Model
 * @package  viewUser_Login
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_LoginAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_LoginAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_LoginAgency)){
            self::$viewUser_LoginAgency = new viewUser_LoginAgency($dbc);
        }
        return self::$viewUser_LoginAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Login ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Login");
        }
    }

}