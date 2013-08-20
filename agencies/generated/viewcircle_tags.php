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
 * Class viewCircle_TagsAgency
 *
 * @category Model
 * @package  viewCircle_Tags
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewCircle_TagsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewCircle_TagsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewCircle_TagsAgency)){
            self::$viewCircle_TagsAgency = new viewCircle_TagsAgency($dbc);
        }
        return self::$viewCircle_TagsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewCircle_Tags ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewCircle_Tags");
        }
    }

}