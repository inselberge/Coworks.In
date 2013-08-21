<?php 
/**
 * PHP version 5.4.17-1~dotdeb.1
 * Created by Amphibian
 * Project: Coworks.In
 * User: 
 * Date: 08/20/2013
 * Time: 16:46:04
 */
require_once CORE_CLASS."basicModel.php";
require_once CORE_INTERFACES."concreteModelInterface.php";
/**
 * Class User_ApplicationModel
 *
 * @category Model
 * @package  User_Application
 * @author   
 * @license  TBD
 * @link     TBD
 */
class User_ApplicationModel
    extends basicModel
    implements concreteModelInterface
{
    /*** Attributes: ***/
    private $id;
    protected $user_id;
    protected $languages;
    protected $skills;
    protected $started_business;
    protected $work_habit;
    protected $other;
    protected $interests;
    protected $special;
    protected $convicted_felon;
    protected $computer_fraud_or_theft;
    protected $promo_code;
    protected $create_date;
    static public $User_ApplicationModel;
    static protected $acceptableKeys = array("id", "user_id", "languages", "skills", "started_business", "work_habit", "other", "interests", "special", "convicted_felon", "computer_fraud_or_theft", "promo_code", "create_date");


    /** instance
     *
     * @param resource $dbc a valid database connection
     *
     * @return object
    */
    static public function instance($dbc) {
        if(!isset(self::$User_ApplicationModel) ) {
            self::$User_ApplicationModel = new User_ApplicationModel($dbc);
        } else {
            self::$User_ApplicationModel->connection = $dbc;
        }
        return self::$User_ApplicationModel;
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
                case 'user_id' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->user_id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'languages' :
                    if($this->checkValue("text",NULL,$value)){
                        $this->languages=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'skills' :
                    if($this->checkValue("text",NULL,$value)){
                        $this->skills=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'started_business' :
                    if($this->checkValue("tinyint(1) unsigned",1,$value)){
                        $this->started_business=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'work_habit' :
                    if($this->checkValue("tinyint(1) unsigned",1,$value)){
                        $this->work_habit=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'other' :
                    if($this->checkValue("varchar(100)",100,$value)){
                        $this->other=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'interests' :
                    if($this->checkValue("text",NULL,$value)){
                        $this->interests=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'special' :
                    if($this->checkValue("text",NULL,$value)){
                        $this->special=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'convicted_felon' :
                    if($this->checkValue("tinyint(1) unsigned",1,$value)){
                        $this->convicted_felon=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'computer_fraud_or_theft' :
                    if($this->checkValue("tinyint(1) unsigned",1,$value)){
                        $this->computer_fraud_or_theft=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'promo_code' :
                    if($this->checkValue("varchar(45)",45,$value)){
                        $this->promo_code=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'create_date' :
                    if($this->checkValue("timestamp",NULL,$value)){
                        $this->create_date=$value;
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
                    case "text":
                        if (  true  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "tinyint(1) unsigned":
                        if (  is_int($value) AND $max >= strlen($value)  AND $value >=0  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "varchar(100)":
                        if (  is_string($value) AND $max >= strlen($value)  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "varchar(45)":
                        if (  is_string($value) AND $max >= strlen($value)  ) {
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
    	           if ( $this->query->execute("CALL getUser_Application('$id')") ) {
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
                    if ( $this->query->execute("CALL updateUser_Application(
                        '$this->id'
                        ,'$this->user_id'
                        ,'$this->languages'
                        ,'$this->skills'
                        ,'$this->started_business'
                        ,'$this->work_habit'
                        ,'$this->other'
                        ,'$this->interests'
                        ,'$this->special'
                        ,'$this->convicted_felon'
                        ,'$this->computer_fraud_or_theft'
                        ,'$this->promo_code'
                        ,'$this->create_date'
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
                    if ( $this->query->execute("CALL insertUser_Application(
                        '$this->user_id'
                        ,'$this->languages'
                        ,'$this->skills'
                        ,'$this->started_business'
                        ,'$this->work_habit'
                        ,'$this->interests'
                        ,'$this->special'
                        ,'$this->convicted_felon'
                        ,'$this->computer_fraud_or_theft'
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
                if ( $this->query->execute("CALL validateUser_Application('$id')") ) {
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
            if (checkInput::checkNewInputArray(array('$this->user_id','$this->languages','$this->skills','$this->started_business','$this->work_habit','$this->interests','$this->special','$this->convicted_felon','$this->computer_fraud_or_theft','$this->create_date'))) {
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
