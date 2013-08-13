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
 * Class User_Net_Promoter_ScoreModel
 *
 * @category Model
 * @package  User_Net_Promoter_Score
 * @author   
 * @license  TBD
 * @link     TBD
 */
class User_Net_Promoter_ScoreModel
    extends basicModel
    implements concreteModelInterface
{
    /*** Attributes: ***/
    private $id;
    protected $user_id;
    protected $net_promoter_score_id;
    protected $quantitative_score;
    protected $qualitative_response;
    protected $create_date;
    static public $User_Net_Promoter_ScoreModel;
    static protected $acceptableKeys = array("id", "user_id", "net_promoter_score_id", "quantitative_score", "qualitative_response", "create_date");


    /** instance
     *
     * @param resource $dbc a valid database connection
     *
     * @return object
    */
    static public function instance($dbc) {
        if(!isset(self::$User_Net_Promoter_ScoreModel) ) {
            self::$User_Net_Promoter_ScoreModel = new User_Net_Promoter_ScoreModel($dbc);
        } else {
            self::$User_Net_Promoter_ScoreModel->connection = $dbc;
        }
        return self::$User_Net_Promoter_ScoreModel;
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
                    if($this->checkValue("bigint(20) unsigned",20,$value)){
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
                case 'net_promoter_score_id' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->net_promoter_score_id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'quantitative_score' :
                    if($this->checkValue("tinyint(4)",4,$value)){
                        $this->quantitative_score=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'qualitative_response' :
                    if($this->checkValue("text",NULL,$value)){
                        $this->qualitative_response=$value;
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
                    case "bigint(20) unsigned":
                        if (  is_int($value) AND $max >= strlen($value)  AND $value >=0  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "int(10) unsigned":
                        if (  is_int($value) AND $max >= strlen($value)  AND $value >=0  ) {
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
                    case "text":
                        if (  true  ) {
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
    	           if ( $this->query->execute("CALL getUser_Net_Promoter_Score('$id')") ) {
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
                    if ( $this->query->execute("CALL updateUser_Net_Promoter_Score(
                        '$this->id'
                        ,'$this->user_id'
                        ,'$this->net_promoter_score_id'
                        ,'$this->quantitative_score'
                        ,'$this->qualitative_response'
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
                    if ( $this->query->execute("CALL insertUser_Net_Promoter_Score(
                        '$this->user_id'
                        ,'$this->net_promoter_score_id'
                        ,'$this->quantitative_score'
                        ,'$this->qualitative_response'
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
                if ( $this->query->execute("CALL validateUser_Net_Promoter_Score('$id')") ) {
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
            if (checkInput::checkNewInputArray(array('$this->user_id','$this->net_promoter_score_id','$this->quantitative_score','$this->qualitative_response','$this->create_date'))) {
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
