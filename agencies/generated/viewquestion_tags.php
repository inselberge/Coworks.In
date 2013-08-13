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
 * Class viewQuestion_TagsAgency
 *
 * @category Model
 * @package  viewQuestion_Tags
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewQuestion_TagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewQuestion_TagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewQuestion_TagsAgency)){
            self::$viewQuestion_TagsAgency = new viewQuestion_TagsAgency($dbc);
        }
        return self::$viewQuestion_TagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewQuestion_Tags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewQuestion_Tags");
        }
    }

}