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
 * Class viewTagsAgency
 *
 * @category Model
 * @package  viewTags
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewTagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewTagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewTagsAgency)){
            self::$viewTagsAgency = new viewTagsAgency($dbc);
        }
        return self::$viewTagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewTags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewTags");
        }
    }

}