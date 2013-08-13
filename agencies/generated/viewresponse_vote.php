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
 * Class viewResponse_VoteAgency
 *
 * @category Model
 * @package  viewResponse_Vote
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewResponse_VoteAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewResponse_VoteAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewResponse_VoteAgency)){
            self::$viewResponse_VoteAgency = new viewResponse_VoteAgency($dbc);
        }
        return self::$viewResponse_VoteAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewResponse_Vote ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewResponse_Vote");
        }
    }

}