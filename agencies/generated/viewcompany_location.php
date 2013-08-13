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
 * Class viewCompany_LocationAgency
 *
 * @category Model
 * @package  viewCompany_Location
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewCompany_LocationAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCompany_LocationAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCompany_LocationAgency)){
            self::$viewCompany_LocationAgency = new viewCompany_LocationAgency($dbc);
        }
        return self::$viewCompany_LocationAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCompany_Location ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCompany_Location");
        }
    }

}