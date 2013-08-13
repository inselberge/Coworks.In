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
 * Class viewUser_TypeAgency
 *
 * @category Model
 * @package  viewUser_Type
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_TypeAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_TypeAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_TypeAgency)){
            self::$viewUser_TypeAgency = new viewUser_TypeAgency($dbc);
        }
        return self::$viewUser_TypeAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Type ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Type");
        }
    }

}