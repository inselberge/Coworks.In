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
 * Class viewLocation_User_StatusAgency
 *
 * @category Model
 * @package  viewLocation_User_Status
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewLocation_User_StatusAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewLocation_User_StatusAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewLocation_User_StatusAgency)){
            self::$viewLocation_User_StatusAgency = new viewLocation_User_StatusAgency($dbc);
        }
        return self::$viewLocation_User_StatusAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewLocation_User_Status ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewLocation_User_Status");
        }
    }

}