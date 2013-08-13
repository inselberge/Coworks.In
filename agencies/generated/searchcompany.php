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
 * Class searchCompanyAgency
 *
 * @category Model
 * @package  searchCompany
 * @author   
 * @license  TBD
 * @link     TBD
 */
class searchCompanyAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchCompanyAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchCompanyAgency)){
            self::$searchCompanyAgency = new searchCompanyAgency($dbc);
        }
        return self::$searchCompanyAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchCompany ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchCompany");
        }
    }

}