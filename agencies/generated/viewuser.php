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
 * Class viewUserAgency
 *
 * @category Model
 * @package  viewUser
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUserAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUserAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUserAgency)){
            self::$viewUserAgency = new viewUserAgency($dbc);
        }
        return self::$viewUserAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser");
        }
    }

}