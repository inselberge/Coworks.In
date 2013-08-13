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
 * Class viewEvent_TagsAgency
 *
 * @category Model
 * @package  viewEvent_Tags
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewEvent_TagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewEvent_TagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewEvent_TagsAgency)){
            self::$viewEvent_TagsAgency = new viewEvent_TagsAgency($dbc);
        }
        return self::$viewEvent_TagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewEvent_Tags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewEvent_Tags");
        }
    }

}