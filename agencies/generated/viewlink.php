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
 * Class viewLinkAgency
 *
 * @category Model
 * @package  viewLink
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewLinkAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewLinkAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewLinkAgency)){
            self::$viewLinkAgency = new viewLinkAgency($dbc);
        }
        return self::$viewLinkAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewLink ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewLink");
        }
    }

}