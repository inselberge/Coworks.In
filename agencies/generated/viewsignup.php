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
 * Class viewSignupAgency
 *
 * @category Model
 * @package  viewSignup
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewSignupAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewSignupAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewSignupAgency)){
            self::$viewSignupAgency = new viewSignupAgency($dbc);
        }
        return self::$viewSignupAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewSignup ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewSignup");
        }
    }

}