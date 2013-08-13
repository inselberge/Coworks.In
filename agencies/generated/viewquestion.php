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
 * Class viewQuestionAgency
 *
 * @category Model
 * @package  viewQuestion
 * @author   
 * @license  TBD
 * @link     TBD
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