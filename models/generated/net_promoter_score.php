<?php 
/**
 * PHP version 5.4.9-4ubuntu2.2
 * Created by Amphibian
 * Project: Coworks.In
 * User: 
 * Date: 08/13/2013
 * Time: 00:57:57
 */
require_once CORE_CLASS."basicModel.php";
require_once CORE_INTERFACES."concreteModelInterface.php";
/**
 * Class Net_Promoter_ScoreModel
 *
 * @category Model
 * @package  Net_Promoter_Score
 * @author   
 * @license  TBD
 * @link     TBD
 */
class Net_Promoter_ScoreModel
    extends basicModel
    implements concreteModelInterface
{
    /*** Attributes: ***/
    private $id;
    protected $coworking_space_id;
    protected $quantitative_question;
    protected $quantitative_max;
    protected $qualitative_question;
    protected $views;
    protected $incompletes;
    protected $completes;
    protected $status;
    protected $create_date;
    protected $modify_date;
    protected $modify_user;
    protected $modify_reason;
    static public $Net_Promoter_ScoreModel;
    static protected $acceptableKeys = array("id", "coworking_space_id", "quantitative_question", "quantitative_max", "qualitative_question", "views", "incompletes", "completes", "status", "create_date", "modify_date", "modify_user", "modify_reason");


    /** instance
     *
     * @param resource $dbc a valid database connection
     *
     * @return object
    */
    static public function instance($dbc) {
        if(!isset(self::$Net_Promoter_ScoreModel) ) {
            self::$Net_Promoter_ScoreModel = new Net_Promoter_ScoreModel($dbc);
        } else {
            self::$Net_Promoter_ScoreModel->connection = $dbc;
        }
        return self::$Net_Promoter_ScoreModel;
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
                case 'coworking_space_id' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->coworking_space_id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'quantitative_question' :
                    if($this->checkValue("text",NULL,$value)){
                        $this->quantitative_question=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'quantitative_max' :
                    if($this->checkValue("tinyint(4)",4,$value)){
                        $this->quantitative_max=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'qualitative_question' :
                    if($this->checkValue("text",NULL,$value)){
                        $this->qualitative_question=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'views' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->views=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'incompletes' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->incompletes=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'completes' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->completes=$value;
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
                    case "text":
                        if (  true  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "tinyint(4)":
                        if (  is_int($value) AND $max >= strlen($value)  ) {
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
                    case "varchar(128)":
                        if (  is_string($value) AND $max >= strlen($value)  ) {
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
    	           if ( $this->query->execute("CALL getNet_Promoter_Score('$id')") ) {
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
                    if ( $this->query->execute("CALL updateNet_Promoter_Score(
                        '$this->id'
                        ,'$this->coworking_space_id'
                        ,'$this->quantitative_question'
                        ,'$this->quantitative_max'
                        ,'$this->qualitative_question'
                        ,'$this->views'
                        ,'$this->incompletes'
                        ,'$this->completes'
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
                    if ( $this->query->execute("CALL insertNet_Promoter_Score(
                        '$this->coworking_space_id'
                        ,'$this->quantitative_question'
                        ,'$this->quantitative_max'
                        ,'$this->qualitative_question'
                        ,'$this->views'
                        ,'$this->incompletes'
                        ,'$this->completes'
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
                if ( $this->query->execute("CALL validateNet_Promoter_Score('$id')") ) {
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
            if (checkInput::checkNewInputArray(array('$this->coworking_space_id','$this->quantitative_question','$this->quantitative_max','$this->qualitative_question','$this->views','$this->incompletes','$this->completes','$this->status'))) {
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
