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
 * Class viewCashAgency
 *
 * @category Model
 * @package  viewCash
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewCashAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCashAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCashAgency)){
            self::$viewCashAgency = new viewCashAgency($dbc);
        }
        return self::$viewCashAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCash ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCash");
        }
    }

}