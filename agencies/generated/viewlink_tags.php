<?php 
/**
 * PHP version 5.4.17-1~dotdeb.1
 * Created by Amphibian
 * Project: Coworks.In
 * User: 
 * Date: 08/20/2013
 * Time: 16:34:15
 */
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewLink_TagsAgency
 *
 * @category Model
 * @package  viewLink_Tags
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewLink_TagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewLink_TagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewLink_TagsAgency)){
            self::$viewLink_TagsAgency = new viewLink_TagsAgency($dbc);
        }
        return self::$viewLink_TagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewLink_Tags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewLink_Tags");
        }
    }

}