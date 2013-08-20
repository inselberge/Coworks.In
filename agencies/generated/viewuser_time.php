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