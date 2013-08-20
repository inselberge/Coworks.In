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
 * Class viewGeo_NamesAgency
 *
 * @category Model
 * @package  viewGeo_Names
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewGeo_NamesAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewGeo_NamesAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewGeo_NamesAgency)){
            self::$viewGeo_NamesAgency = new viewGeo_NamesAgency($dbc);
        }
        return self::$viewGeo_NamesAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewGeo_Names ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewGeo_Names");
        }
    }

}