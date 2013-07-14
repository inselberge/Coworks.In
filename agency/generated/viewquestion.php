<?php 
require_once CORE_CLASS."basicAgency.php";
require_once CORE_INTERFACES."concreteAgencyInterface.php";
/**
 * Class viewQuestionAgency
 */
class viewQuestionAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewQuestionAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewQuestionAgency)){
            self::$viewQuestionAgency = new viewQuestionAgency($dbc);
        }
        return self::$viewQuestionAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewQuestion ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewQuestion");
        }
    }

}