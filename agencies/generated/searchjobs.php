<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class searchJobsAgency
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