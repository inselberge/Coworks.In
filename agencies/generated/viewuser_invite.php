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
 * Class viewUser_InviteAgency
 *
 * @category Model
 * @package  viewUser_Invite
 * @author   
 * @license  TBD
 * @link     TBD
 */
class viewUser_InviteAgency
    extends basicAgency
    implements concreteAgencyInterface
{

    public static $viewUser_InviteAgency;

    static public function instance($dbc)
    {
        if(!isset(self::$viewUser_InviteAgency)){
            self::$viewUser_InviteAgency = new viewUser_InviteAgency($dbc);
        }
        return self::$viewUser_InviteAgency;
    }

    protected function forkQuery()
    {
        if($this->checkQueryStringAddendum()){
            return $this->query->execute("SELECT * FROM viewUser_Invite ".$this->queryStringAddendum);
        } else {
            return $this->query->execute("SELECT * FROM viewUser_Invite");
        }
    }

}