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