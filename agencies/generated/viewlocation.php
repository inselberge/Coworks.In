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