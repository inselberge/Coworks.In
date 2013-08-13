<?php 
/**
 * PHP version 5.4.9-4ubuntu2.2
 * Created by Amphibian
 * Project: Coworks.In
 * User: 
 * Date: 08/13/2013
 * Time: 00:57:58
 */
require_once CORE_CLASS."basicModel.php";
require_once CORE_INTERFACES."concreteModelInterface.php";
/**
 * Class User_TimeModel
 *
 * @category Model
 * @package  User_Time
 * @author   
 * @license  TBD
 * @link     TBD
 */
class User_TimeModel
    extends basicModel
    implements concreteModelInterface
{
    /*** Attributes: ***/
    private $id;
    protected $giving_user_id;
    protected $taking_user_id;
    protected $help_id;
    protected $start_time;
    protected $end_time;
    protected $total_time;
    static public $User_TimeModel;
    static protected $acceptableKeys = array("id", "giving_user_id", "taking_user_id", "help_id", "start_time", "end_time", "total_time");


    /** instance
     *
     * @param resource $dbc a valid database connection
     *
     * @return object
    */
    static public function instance($dbc) {
        if(!isset(self::$User_TimeModel) ) {
            self::$User_TimeModel = new User_TimeModel($dbc);
        } else {
            self::$User_TimeModel->connection = $dbc;
        }
        return self::$User_TimeModel;
    }

    /**setValue
     *
     * @param string $key   the index you want to use
     * @param mixed  $value the value to set to that index
     *
     * @return boolean
     */
    public function setValue($key,$value) {
        if(isset($key,$value) AND !is_null($key)){
            switch($key){
                case 'id' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'giving_user_id' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->giving_user_id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'taking_user_id' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->taking_user_id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'help_id' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->help_id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'start_time' :
                    if($this->checkValue("timestamp",NULL,$value)){
                        $this->start_time=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'end_time' :
                    if($this->checkValue("timestamp",NULL,$value)){
                        $this->end_time=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'total_time' :
                    if($this->checkValue("time",NULL,$value)){
                        $this->total_time=$value;
                    } else {
                        return false;
                    };
                    break;
            default:break;
            }
            return true;
        } else {
            return false;
        }
    }

    /** checkValue
     *
     * @param string  $type  specifies the data type fully
     * @param integer $max   specifies the maximum
     * @param mixed   $value specifies the variable candidate
     *
     * @return bool
     */
    public function checkValue( $type, $max, $value )
    {
        try {
            if ( checkInput::checkNewInputArray(array($type, $max, $value)) ) {
                switch ( $type ) {
                    case "int(10) unsigned":
                        if (  is_int($value) AND $max >= strlen($value)  AND $value >=0  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "timestamp":
                        if (  true  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "time":
                        if (  true  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    default:
                        return false;
                        break;
                }
            } else {
                throw new exceptionHandler(__METHOD__.": All required variables must be provided.");
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    /**get
     *
     * @param integer $id the id of the object to fetch
     *
     * @return boolean
     */
    public function get( $id ) {
        try {
            if ( checkInput::checkNewInput($id) ) {
    	           if ( $this->query->execute("CALL getUser_Time('$id')") ) {
    	               $this->query->getRow();
    	               $this->setValuesFromRow();
    	           } else {
    	               throw new exceptionHandler (__METHOD__.": The get query returned an error.");
    	           }
    	       }
    	    } catch ( exceptionHandler $e ) {
    	       $e->execute();
    	       return false;
    	    }
    	    return true;
    }

    /** update
     *
     * @return bool
     */
    public function update()
    {
        try {
            if ( $this->checkRequired() ) {
                if ( $this->prewash() ) {
                    if ( $this->query->execute("CALL updateUser_Time(
                        '$this->id'
                        ,'$this->giving_user_id'
                        ,'$this->taking_user_id'
                        ,'$this->help_id'
                        ,'$this->start_time'
                        ,'$this->end_time'
                        ,'$this->total_time'
                            )")
                    ) {
                    $this->query->checkAffected();
                    } else {
                        throw new exceptionHandler(__METHOD__ . ": The update query returned an error.");
                    }
                }
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    /** insert
     *
     * @return bool
     */
    public function insert()
    {
        try {
            if ( $this->checkRequired()) {
                if ( $this->prewash() ) {
                    if ( $this->query->execute("CALL insertUser_Time(
                        '$this->giving_user_id'
                        ,'$this->taking_user_id'
                        ,'$this->start_time'
                            , @ceid)")
                    ) {
                        $this->getInsertId();
                    } else {
                        throw new exceptionHandler(__METHOD__.": The insert failed.");
                    }
                }
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    /** getInsertId
     *
     * @return bool
     */
    public function getInsertId()
    {
        try {
            if ( $this->query->execute("Select @ceid as id") ) {
                $this->query->getRow();
                if ( !$this->setValue("id", $this->query->row["id"]) ) {
                    throw new exceptionHandler(__METHOD__ . ": Setting the new id failed.");
                }
            } else {
                throw new exceptionHandler(__METHOD__ . ": The new id could not be retrieved.");
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    /** validate
     *
     * @param integer $id unsigned integer reference to the table primary key
     *
     * @return bool
     */
    public function validate( $id )
    {
        try {
            if ( checkInput::checkNewInput($id) ) {
                if ( $this->query->execute("CALL validateUser_Time('$id')") ) {
                    $this->query->checkAffected();
                } else {
                    throw new exceptionHandler(__METHOD__.": Validation sproc error!");
                }
            } else {
                throw new exceptionHandler(__METHOD__.": The id must be set.");
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }

    /** checkRequired
     *
     * @return bool
     */
    protected function checkRequired()
    {
        try {
            if (checkInput::checkNewInputArray(array('$this->giving_user_id','$this->taking_user_id','$this->start_time'))) {
            } else {
                throw new exceptionHandler (__METHOD__ . ": Required values are not all specified.");
            }
        } catch ( exceptionHandler $e ) {
            $e->execute();
            return false;
        }
        return true;
    }
}
