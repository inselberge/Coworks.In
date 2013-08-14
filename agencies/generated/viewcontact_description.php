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
 * Class viewContact_DescriptionAgency
 *
 * @category Model
 * @package  viewContact_Description
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewContact_DescriptionAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewContact_DescriptionAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewContact_DescriptionAgency)){
            self::$viewContact_DescriptionAgency = new viewContact_DescriptionAgency($dbc);
        }
        return self::$viewContact_DescriptionAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewContact_Description ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewContact_Description");
        }
    }

}