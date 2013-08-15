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
 * Class viewUser_TokenAgency
 *
 * @category Model
 * @package  viewUser_Token
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_TokenAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_TokenAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_TokenAgency)){
            self::$viewUser_TokenAgency = new viewUser_TokenAgency($dbc);
        }
        return self::$viewUser_TokenAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Token ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Token");
        }
    }

}