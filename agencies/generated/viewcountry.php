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
 * Class viewCountryAgency
 *
 * @category Model
 * @package  viewCountry
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewCountryAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCountryAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCountryAgency)){
            self::$viewCountryAgency = new viewCountryAgency($dbc);
        }
        return self::$viewCountryAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCountry ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCountry");
        }
    }

}