<?php
// TODO: remove the config require once confirmed success, as it should be included elsewhere.
//require_once __DIR__."/../../config/Members.Geekdom.config.inc.php";
require_once CORE_CLASS . "databaseQueryMySQLi.php";
class Password
{
    private $query;
    private $insecurePassword;
    private $securePassword;
    private $databasePassword;
    private $ip;
    private $email;
    private $user_id;
    private $salt;
    private $result;

    public function __construct( $dbc )
    {
        try {
            if ( checkInput::checkNewInput($dbc) ) {
                if ( $dbc->ping() ) {
                    $this->query = databaseQueryMySQLi::instance($dbc);
                    if(isset($live,$_SERVER["REMOTE_ADDR"])){
                        $this->ip = $_SERVER["REMOTE_ADDR"];
                    } else {
                        //TODO : remove this and setup something for remote IP checking
                        $this->ip = "127.0.0.1";
                    }
                } else {
                    throw new exceptionHandler(__METHOD__.": The connection is dead.");
                }
            }
        } catch ( exceptionHandler $e ) {
            echo $e;
        }
    }

    public function login( $email, $pass )
    {
        try {
            if ( checkInput::checkNewInput($email) AND checkInput::checkNewInput($pass) ) {
                $this->email            = $this->clean($email);
                $this->insecurePassword = $this->clean($pass);
                $this->generatePasswordHash();
                if ( $this->attemptLogin() ) {
                    if($this->getAttemptResult()){
                        $this->setId();
                    } else {

                    }
                } else {

                }
            } else {
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    private function attemptLogin()
    {
        $this->result=$this->query->execute("CALL loginAttempt('$this->email','$this->securePassword','$this->ip',@user_id);");
        return $this->result;
    }

    private function getAttemptResult(){
        if(isset($this->result)){
            if($this->query->execute("SELECT @user_id as user_id;")){
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    private function setId(){
        $this->query->getRow();
        $this->user_id=$this->query->row["user_id"];
        if($this->user_id > 0){
            return true;
        } else {
            return false;
        }
    }

    public function getId(){
        return $this->user_id;
    }

    public function getEmail(){
        return $this->email;
    }

    public function find( $email )
    {
        try {
            if ( checkInput::checkNewInput($email) ) {
                $this->get($this->clean($email));
            } else {
                throw new exceptionHandler(__METHOD__.": The email is required to proceed.");
            }
        } catch ( exceptionHandler $e ) {
            echo $e;
        }
    }

    private function clean( $string )
    {
        return $this->query->clean($string);
    }

    private function get( $email )
    {
        try {
            if ( checkInput::checkNewInput($email) ) {
                $this->result = $this->query->execute("Call getPassword('$email')");
                if ( $this->result ) {
                    $row = mysqli_fetch_assoc($this->result);
                    if ( checkInput::checkNewInput($row) ) {
                        $this->databasePassword = $row["password"];
                        $this->user_id          = $row["id"];
                    } else {
                        throw new exceptionHandler(__METHOD__.": There was no information in the result set.");
                    }
                } else {
                    throw new exceptionHandler(__METHOD__.": The password information could not be pulled from the database.");
                }
            } else {
                throw new exceptionHandler(__METHOD__.": The email address is required.");
            }
        } catch ( exceptionHandler $e ) {
            echo $e;
        }
    }

    public function reset( $email )
    {
        $this->email=$this->query->clean($email);
        $this->generateTemporaryPassword();
        $this->generatePasswordHash();
        $this->update();
    }

    private function update( )
    {
        try {
            if ( checkInput::checkNewInput($this->email) ) {
                $this->query->execute("Call updatePassword('$this->email','$this->securePassword')");
            } else {
                throw new exceptionHandler(__METHOD__.": The email address is required.");
            }
        } catch ( exceptionHandler $e ) {
            echo $e;
        }
    }

    static public function checkPasswordRegEx( $pass )
    {
        return preg_match('/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{6,20}$/', $pass);
    }

    private function generateSalt()
    {
        $this->salt = md5($this->ip . microtime() . rand(1, 100000000));
    }

    private function generatePasswordHash()
    {
        $this->securePassword = $this->query->clean(hash('whirlpool', $this->insecurePassword));
    }

    private function generateTemporaryPassword()
    {
        $start = rand(0, 19);
        $this->generateSalt();
        $this->insecurePassword = substr($this->salt, $start, 12);
        unset($start);
    }

    public function getPassword(){
        return $this->insecurePassword;
    }

    public function printPassword()
    {
        echo $this->insecurePassword;
    }

    public function getIP(){
        echo $this->ip;
    }
}
//require_once DATABASE_CONNECTIONS."mysql_user.inc.php";
/* Reset Password
$p= new Password($dbcUser);
$p->reset("texmorgan@gmail.com");
$p->printPassword();
*/
/*
 *  Login
$p= new Password($dbcUser);
$p->login("texmorgan@gmail.com","36db8599800a");
echo $p->getId();
*/