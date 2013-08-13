<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class searchQuestionsAndResponsesAgency
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