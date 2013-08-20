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
 * Class viewHelpAgency
 *
 * @category Model
 * @package  viewHelp
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewHelpAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewHelpAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewHelpAgency)){
            self::$viewHelpAgency = new viewHelpAgency($dbc);
        }
        return self::$viewHelpAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewHelp ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewHelp");
        }
    }

}