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