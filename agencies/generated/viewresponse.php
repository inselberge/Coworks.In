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