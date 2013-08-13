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
 * Class viewCompany_TagsAgency
 *
 * @category Model
 * @package  viewCompany_Tags
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewCompany_TagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCompany_TagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCompany_TagsAgency)){
            self::$viewCompany_TagsAgency = new viewCompany_TagsAgency($dbc);
        }
        return self::$viewCompany_TagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCompany_Tags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCompany_Tags");
        }
    }

}