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
 * Class searchHelpAgency
 *
 * @category Model
 * @package  searchHelp
 * @author   
 * @license  TBD
 * @link     TBD
 */
class searchHelpAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchHelpAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchHelpAgency)){
            self::$searchHelpAgency = new searchHelpAgency($dbc);
        }
        return self::$searchHelpAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchHelp ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchHelp");
        }
    }

}