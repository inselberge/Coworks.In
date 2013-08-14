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
 * Class viewUser_BioAgency
 *
 * @category Model
 * @package  viewUser_Bio
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_BioAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_BioAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_BioAgency)){
            self::$viewUser_BioAgency = new viewUser_BioAgency($dbc);
        }
        return self::$viewUser_BioAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Bio ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Bio");
        }
    }

}