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
 * Class viewUser_OfficeAgency
 *
 * @category Model
 * @package  viewUser_Office
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_OfficeAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_OfficeAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_OfficeAgency)){
            self::$viewUser_OfficeAgency = new viewUser_OfficeAgency($dbc);
        }
        return self::$viewUser_OfficeAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Office ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Office");
        }
    }

}