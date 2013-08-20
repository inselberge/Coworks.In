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
 * Class viewHelp_TagsAgency
 *
 * @category Model
 * @package  viewHelp_Tags
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewHelp_TagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewHelp_TagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewHelp_TagsAgency)){
            self::$viewHelp_TagsAgency = new viewHelp_TagsAgency($dbc);
        }
        return self::$viewHelp_TagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewHelp_Tags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewHelp_Tags");
        }
    }

}