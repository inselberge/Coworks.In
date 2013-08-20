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
 * Class viewLocationCoworkingAgency
 *
 * @category Model
 * @package  viewLocationCoworking
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewLocationCoworkingAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewLocationCoworkingAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewLocationCoworkingAgency)){
            self::$viewLocationCoworkingAgency = new viewLocationCoworkingAgency($dbc);
        }
        return self::$viewLocationCoworkingAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewLocationCoworking ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewLocationCoworking");
        }
    }

}