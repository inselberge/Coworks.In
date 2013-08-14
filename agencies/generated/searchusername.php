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
 * Class searchUserNameAgency
 *
 * @category Model
 * @package  searchUserName
 * @author   
 * @license  TBD
 * @link     TBD
 */
class searchUserNameAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchUserNameAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchUserNameAgency)){
            self::$searchUserNameAgency = new searchUserNameAgency($dbc);
        }
        return self::$searchUserNameAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchUserName ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchUserName");
        }
    }

}