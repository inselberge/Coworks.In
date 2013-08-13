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
 * Class viewUser_CircleAgency
 *
 * @category Model
 * @package  viewUser_Circle
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_CircleAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_CircleAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_CircleAgency)){
            self::$viewUser_CircleAgency = new viewUser_CircleAgency($dbc);
        }
        return self::$viewUser_CircleAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Circle ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Circle");
        }
    }

}