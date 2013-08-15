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
 * Class viewNet_Promoter_ScoreAgency
 *
 * @category Model
 * @package  viewNet_Promoter_Score
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewNet_Promoter_ScoreAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewNet_Promoter_ScoreAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewNet_Promoter_ScoreAgency)){
            self::$viewNet_Promoter_ScoreAgency = new viewNet_Promoter_ScoreAgency($dbc);
        }
        return self::$viewNet_Promoter_ScoreAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewNet_Promoter_Score ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewNet_Promoter_Score");
        }
    }

}