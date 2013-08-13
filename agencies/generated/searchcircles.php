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