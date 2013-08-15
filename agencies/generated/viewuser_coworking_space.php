<?php 
/**
 * PHP version 5.4.17-1~dotdeb.1
 * Created by Amphibian
 * Project: Coworks.In
 * User: 
 * Date: 08/14/2013
 * Time: 00:46:10
 */
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewUser_Coworking_SpaceAgency
 *
 * @category Model
 * @package  viewUser_Coworking_Space
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_Coworking_SpaceAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_Coworking_SpaceAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_Coworking_SpaceAgency)){
            self::$viewUser_Coworking_SpaceAgency = new viewUser_Coworking_SpaceAgency($dbc);
        }
        return self::$viewUser_Coworking_SpaceAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Coworking_Space ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Coworking_Space");
        }
    }

}