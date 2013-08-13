<?php 
require_once CORE_CLASS . "basicAgency.php";
require_once CORE_INTERFACES . "concreteAgencyInterface.php";
/**
 * Class viewUser_InviteAgency
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