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
 * Class viewCompanyAgency
 *
 * @category Model
 * @package  viewCompany
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewCompanyAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCompanyAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCompanyAgency)){
            self::$viewCompanyAgency = new viewCompanyAgency($dbc);
        }
        return self::$viewCompanyAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCompany ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCompany");
        }
    }

}