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
 * Class searchCirclesAgency
 *
 * @category Model
 * @package  searchCircles
 * @author   
 * @license  TBD
 * @link     TBD
 */
class searchCirclesAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchCirclesAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchCirclesAgency)){
            self::$searchCirclesAgency = new searchCirclesAgency($dbc);
        }
        return self::$searchCirclesAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchCircles ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchCircles");
        }
    }

}