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
 * Class viewUserAgency
 *
 * @category Model
 * @package  viewUser
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUserAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUserAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUserAgency)){
            self::$viewUserAgency = new viewUserAgency($dbc);
        }
        return self::$viewUserAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser");
        }
    }

}