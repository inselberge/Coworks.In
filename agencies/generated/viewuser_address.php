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
 * Class viewUser_AddressAgency
 *
 * @category Model
 * @package  viewUser_Address
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_AddressAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_AddressAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_AddressAgency)){
            self::$viewUser_AddressAgency = new viewUser_AddressAgency($dbc);
        }
        return self::$viewUser_AddressAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Address ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Address");
        }
    }

}