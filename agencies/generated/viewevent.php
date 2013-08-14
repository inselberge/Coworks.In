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
 * Class viewEventAgency
 *
 * @category Model
 * @package  viewEvent
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewEventAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewEventAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewEventAgency)){
            self::$viewEventAgency = new viewEventAgency($dbc);
        }
        return self::$viewEventAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewEvent ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewEvent");
        }
    }

}