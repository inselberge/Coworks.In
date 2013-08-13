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
 * Class viewCircleAgency
 *
 * @category Model
 * @package  viewCircle
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewCircleAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCircleAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCircleAgency)){
            self::$viewCircleAgency = new viewCircleAgency($dbc);
        }
        return self::$viewCircleAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCircle ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCircle");
        }
    }

}