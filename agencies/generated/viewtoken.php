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
 * Class viewTokenAgency
 *
 * @category Model
 * @package  viewToken
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewTokenAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewTokenAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewTokenAgency)){
            self::$viewTokenAgency = new viewTokenAgency($dbc);
        }
        return self::$viewTokenAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewToken ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewToken");
        }
    }

}