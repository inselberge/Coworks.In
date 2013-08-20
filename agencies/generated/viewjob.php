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
 * Class viewJobAgency
 *
 * @category Model
 * @package  viewJob
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewJobAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewJobAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewJobAgency)){
            self::$viewJobAgency = new viewJobAgency($dbc);
        }
        return self::$viewJobAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewJob ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewJob");
        }
    }

}