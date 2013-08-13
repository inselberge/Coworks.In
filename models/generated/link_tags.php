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
 * Class Link_TagsModel
 *
 * @category Model
 * @package  Link_Tags
 * @author   
 * @license  TBD
 * @link     TBD
 */
class Link_TagsModel
    extends basicModel
    implements concreteModelInterface
{
    /*** Attributes: ***/
    private $id;
    protected $link_id;
    protected $tag_id;
    protected $create_date;
    static public $Link_TagsModel;
    static protected $acceptableKeys = array("id", "link_id", "tag_id", "create_date");


    /** instance
     *
     * @param resource $dbc a valid database connection
     *
     * @return object
    */
    static public function instance($dbc) {
        if(!isset(self::$Link_TagsModel) ) {
            self::$Link_TagsModel = new Link_TagsModel($dbc);
        } else {
            self::$Link_TagsModel->connection = $dbc;
        }
        return self::$Link_TagsModel;
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
                    if($this->checkValue("int(20) unsigned",20,$value)){
                        $this->id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'link_id' :
                    if($this->checkValue("bigint(20) unsigned",20,$value)){
                        $this->link_id=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'tag_id' :
                    if($this->checkValue("int(10) unsigned",10,$value)){
                        $this->tag_id=$value;
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
                    case "int(20) unsigned":
                        if (  is_int($value) AND $max >= strlen($value)  AND $value >=0  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
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
    	           if ( $this->query->execute("CALL getLink_Tags('$id')") ) {
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
                    if ( $this->query->execute("CALL updateLink_Tags(
                        '$this->id'
                        ,'$this->link_id'
                        ,'$this->tag_id'
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
                    if ( $this->query->execute("CALL insertLink_Tags(
                        '$this->link_id'
                        ,'$this->tag_id'
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
                if ( $this->query->execute("CALL validateLink_Tags('$id')") ) {
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
            if (checkInput::checkNewInputArray(array('$this->link_id','$this->tag_id','$this->create_date'))) {
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
