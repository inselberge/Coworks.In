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
 * Class searchJobsAgency
 *
 * @category Model
 * @package  searchJobs
 * @author   
 * @license  TBD
 * @link     TBD
 */
class searchJobsAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchJobsAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchJobsAgency)){
            self::$searchJobsAgency = new searchJobsAgency($dbc);
        }
        return self::$searchJobsAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchJobs ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchJobs");
        }
    }

}