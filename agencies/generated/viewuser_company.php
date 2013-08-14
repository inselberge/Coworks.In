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
 * Class viewUser_CompanyAgency
 *
 * @category Model
 * @package  viewUser_Company
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_CompanyAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_CompanyAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_CompanyAgency)){
            self::$viewUser_CompanyAgency = new viewUser_CompanyAgency($dbc);
        }
        return self::$viewUser_CompanyAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Company ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Company");
        }
    }

}