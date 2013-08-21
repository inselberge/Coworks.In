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
 * Class viewOfficeAgency
 *
 * @category Model
 * @package  viewOffice
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewOfficeAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewOfficeAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewOfficeAgency)){
            self::$viewOfficeAgency = new viewOfficeAgency($dbc);
        }
        return self::$viewOfficeAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewOffice ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewOffice");
        }
    }

}