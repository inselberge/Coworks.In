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
 * Class viewLocationAgency
 *
 * @category Model
 * @package  viewLocation
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewLocationAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewLocationAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewLocationAgency)){
            self::$viewLocationAgency = new viewLocationAgency($dbc);
        }
        return self::$viewLocationAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewLocation ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewLocation");
        }
    }

}