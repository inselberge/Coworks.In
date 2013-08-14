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
 * Class viewJob_TagsAgency
 *
 * @category Model
 * @package  viewJob_Tags
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewJob_TagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewJob_TagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewJob_TagsAgency)){
            self::$viewJob_TagsAgency = new viewJob_TagsAgency($dbc);
        }
        return self::$viewJob_TagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewJob_Tags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewJob_Tags");
        }
    }

}