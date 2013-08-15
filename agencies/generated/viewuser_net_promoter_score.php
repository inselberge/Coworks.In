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
 * Class viewUser_Net_Promoter_ScoreAgency
 *
 * @category Model
 * @package  viewUser_Net_Promoter_Score
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_Net_Promoter_ScoreAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_Net_Promoter_ScoreAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_Net_Promoter_ScoreAgency)){
            self::$viewUser_Net_Promoter_ScoreAgency = new viewUser_Net_Promoter_ScoreAgency($dbc);
        }
        return self::$viewUser_Net_Promoter_ScoreAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Net_Promoter_Score ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Net_Promoter_Score");
        }
    }

}