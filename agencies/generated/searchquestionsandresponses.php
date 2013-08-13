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
 * Class searchQuestionsAndResponsesAgency
 *
 * @category Model
 * @package  searchQuestionsAndResponses
 * @author   
 * @license  TBD
 * @link     TBD
 */
class searchQuestionsAndResponsesAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $searchQuestionsAndResponsesAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$searchQuestionsAndResponsesAgency)){
            self::$searchQuestionsAndResponsesAgency = new searchQuestionsAndResponsesAgency($dbc);
        }
        return self::$searchQuestionsAndResponsesAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM searchQuestionsAndResponses ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM searchQuestionsAndResponses");
        }
    }

}