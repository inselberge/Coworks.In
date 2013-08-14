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