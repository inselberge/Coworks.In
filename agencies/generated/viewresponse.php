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
 * Class viewResponseAgency
 *
 * @category Model
 * @package  viewResponse
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewResponseAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewResponseAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewResponseAgency)){
            self::$viewResponseAgency = new viewResponseAgency($dbc);
        }
        return self::$viewResponseAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewResponse ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewResponse");
        }
    }

}