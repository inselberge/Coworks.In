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
 * Class TokenModel
 *
 * @category Model
 * @package  Token
 * @author   
 * @license  TBD
 * @link     TBD
 */
class TokenModel
    extends basicModel
    implements concreteModelInterface
{
    /*** Attributes: ***/
    private $id;
    protected $title;
    protected $expire_length;
    protected $authenticate_url;
    protected $validate_url;
    protected $status;
    protected $create_date;
    protected $modify_date;
    protected $modify_user;
    protected $modify_reason;
    static public $TokenModel;
    static protected $acceptableKeys = array("id", "title", "expire_length", "authenticate_url", "validate_url", "status", "create_date", "modify_date", "modify_user", "modify_reason");


    /** instance
     *
     * @param resource $dbc a valid database connection
     *
     * @return object
    */
    static public function instance($dbc) {
        if(!isset(self::$TokenModel) ) {
            self::$TokenModel = new TokenModel($dbc);
        } else {
            self::$TokenModel->connection = $dbc;
        }
        return self::$TokenModel;
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
                case 'title' :
                    if($this->checkValue("varchar(128)",128,$value)){
                        $this->title=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'expire_length' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->expire_length=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'authenticate_url' :
                    if($this->checkValue("tinytext",NULL,$value)){
                        $this->authenticate_url=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'validate_url' :
                    if($this->checkValue("tinytext",NULL,$value)){
                        $this->validate_url=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'status' :
                    if($this->checkValue("enum('pending','enabled','disabled','retired')",4,$value)){
                        $this->status=$value;
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
                case 'modify_date' :
                    if($this->checkValue("timestamp",NULL,$value)){
                        $this->modify_date=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'modify_user' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->modify_user=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'modify_reason' :
                    if($this->checkValue("varchar(128)",128,$value)){
                        $this->modify_reason=$value;
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
                    case "varchar(128)":
                        if (  is_string($value) AND $max >= strlen($value)  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "tinytext":
                        if (  true  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "enum('pending','enabled','disabled','retired')":
                        if (  in_array($value,array( 'pending' , 'enabled' , 'disabled' , 'retired' ))  ) {
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
    	           if ( $this->query->execute("CALL getToken('$id')") ) {
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
                    if ( $this->query->execute("CALL updateToken(
                        '$this->id'
                        ,'$this->title'
                        ,'$this->expire_length'
                        ,'$this->authenticate_url'
                        ,'$this->validate_url'
                        ,'$this->status'
                        ,'$this->create_date'
                        ,'$this->modify_date'
                        ,'$this->modify_user'
                        ,'$this->modify_reason'
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
                    if ( $this->query->execute("CALL insertToken(
                        '$this->title'
                        ,'$this->expire_length'
                        ,'$this->authenticate_url'
                        ,'$this->validate_url'
                        ,'$this->status'
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
                if ( $this->query->execute("CALL validateToken('$id')") ) {
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
            if (checkInput::checkNewInputArray(array('$this->title','$this->expire_length','$this->authenticate_url','$this->validate_url','$this->status','$this->create_date'))) {
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
