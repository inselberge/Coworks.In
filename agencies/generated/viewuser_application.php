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
 * Class viewUser_ApplicationAgency
 *
 * @category Model
 * @package  viewUser_Application
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_ApplicationAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_ApplicationAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_ApplicationAgency)){
            self::$viewUser_ApplicationAgency = new viewUser_ApplicationAgency($dbc);
        }
        return self::$viewUser_ApplicationAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Application ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Application");
        }
    }

}