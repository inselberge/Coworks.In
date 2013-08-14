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
 * Class viewCoworking_SpaceAgency
 *
 * @category Model
 * @package  viewCoworking_Space
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewCoworking_SpaceAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCoworking_SpaceAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCoworking_SpaceAgency)){
            self::$viewCoworking_SpaceAgency = new viewCoworking_SpaceAgency($dbc);
        }
        return self::$viewCoworking_SpaceAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCoworking_Space ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCoworking_Space");
        }
    }

}