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
 * Class viewUser_TagsAgency
 *
 * @category Model
 * @package  viewUser_Tags
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_TagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_TagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_TagsAgency)){
            self::$viewUser_TagsAgency = new viewUser_TagsAgency($dbc);
        }
        return self::$viewUser_TagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Tags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Tags");
        }
    }

}