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
 * Class viewQuestion_VoteAgency
 *
 * @category Model
 * @package  viewQuestion_Vote
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewQuestion_VoteAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewQuestion_VoteAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewQuestion_VoteAgency)){
            self::$viewQuestion_VoteAgency = new viewQuestion_VoteAgency($dbc);
        }
        return self::$viewQuestion_VoteAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewQuestion_Vote ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewQuestion_Vote");
        }
    }

}