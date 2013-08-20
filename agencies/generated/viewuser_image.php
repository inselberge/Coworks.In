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
 * Class viewUser_ImageAgency
 *
 * @category Model
 * @package  viewUser_Image
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_ImageAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_ImageAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_ImageAgency)){
            self::$viewUser_ImageAgency = new viewUser_ImageAgency($dbc);
        }
        return self::$viewUser_ImageAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Image ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Image");
        }
    }

}