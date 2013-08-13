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
 * Class Monthly_Recurring_RevenueModel
 *
 * @category Model
 * @package  Monthly_Recurring_Revenue
 * @author   
 * @license  TBD
 * @link     TBD
 */
class Monthly_Recurring_RevenueModel
    extends basicModel
    implements concreteModelInterface
{
    /*** Attributes: ***/
    private $id;
    protected $coworking_space_id;
    protected $start_of_month_recurring_revenue;
    protected $new_recurring_revenue_from_new_customers;
    protected $new_recurring_revenue_from_expansion;
    protected $total_new_recurring_revenue;
    protected $lost_recurring_revenue_from_contraction;
    protected $churn_rate;
    protected $net_new_recurring_revenue;
    protected $end_of_month_recurring_revenue;
    protected $month_over_month_growth;
    protected $average_revenue_per_account;
    protected $average_revenue_per_new_account;
    protected $create_date;
    protected $modify_date;
    static public $Monthly_Recurring_RevenueModel;
    static protected $acceptableKeys = array("id", "coworking_space_id", "start_of_month_recurring_revenue", "new_recurring_revenue_from_new_customers", "new_recurring_revenue_from_expansion", "total_new_recurring_revenue", "lost_recurring_revenue_from_contraction", "churn_rate", "net_new_recurring_revenue", "end_of_month_recurring_revenue", "month_over_month_growth", "average_revenue_per_account", "average_revenue_per_new_account", "create_date", "modify_date");


    /** instance
     *
     * @param resource $dbc a valid database connection
     *
     * @return object
    */
    static public function instance($dbc) {
        if(!isset(self::$Monthly_Recurring_RevenueModel) ) {
            self::$Monthly_Recurring_RevenueModel = new Monthly_Recurring_RevenueModel($dbc);
        } else {
            self::$Monthly_Recurring_RevenueModel->connection = $dbc;
        }
        return self::$Monthly_Recurring_RevenueModel;
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
                case 'start_of_month_recurring_revenue' :
                    if($this->checkValue("double unsigned",NULL,$value)){
                        $this->start_of_month_recurring_revenue=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'new_recurring_revenue_from_new_customers' :
                    if($this->checkValue("double unsigned",NULL,$value)){
                        $this->new_recurring_revenue_from_new_customers=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'new_recurring_revenue_from_expansion' :
                    if($this->checkValue("double unsigned",NULL,$value)){
                        $this->new_recurring_revenue_from_expansion=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'total_new_recurring_revenue' :
                    if($this->checkValue("double unsigned",NULL,$value)){
                        $this->total_new_recurring_revenue=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'lost_recurring_revenue_from_contraction' :
                    if($this->checkValue("double unsigned",NULL,$value)){
                        $this->lost_recurring_revenue_from_contraction=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'churn_rate' :
                    if($this->checkValue("float",NULL,$value)){
                        $this->churn_rate=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'net_new_recurring_revenue' :
                    if($this->checkValue("double",NULL,$value)){
                        $this->net_new_recurring_revenue=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'end_of_month_recurring_revenue' :
                    if($this->checkValue("double unsigned",NULL,$value)){
                        $this->end_of_month_recurring_revenue=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'month_over_month_growth' :
                    if($this->checkValue("float",NULL,$value)){
                        $this->month_over_month_growth=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'average_revenue_per_account' :
                    if($this->checkValue("double unsigned",NULL,$value)){
                        $this->average_revenue_per_account=$value;
                    } else {
                        return false;
                    };
                    break;
                case 'average_revenue_per_new_account' :
                    if($this->checkValue("double unsigned",NULL,$value)){
                        $this->average_revenue_per_new_account=$value;
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
                    case "double unsigned":
                        if (  is_double(doubleval($value)) AND $value >=0  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "float":
                        if (  is_float(floatval($value)) AND $max >= strlen($value)  ) {
                            return true;
                        } else {
                            return false;
                        }
                        break;
                    case "double":
                        if (  is_double(doubleval($value)) ) {
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
    	           if ( $this->query->execute("CALL getMonthly_Recurring_Revenue('$id')") ) {
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
                    if ( $this->query->execute("CALL updateMonthly_Recurring_Revenue(
                        '$this->id'
                        ,'$this->coworking_space_id'
                        ,'$this->start_of_month_recurring_revenue'
                        ,'$this->new_recurring_revenue_from_new_customers'
                        ,'$this->new_recurring_revenue_from_expansion'
                        ,'$this->total_new_recurring_revenue'
                        ,'$this->lost_recurring_revenue_from_contraction'
                        ,'$this->churn_rate'
                        ,'$this->net_new_recurring_revenue'
                        ,'$this->end_of_month_recurring_revenue'
                        ,'$this->month_over_month_growth'
                        ,'$this->average_revenue_per_account'
                        ,'$this->average_revenue_per_new_account'
                        ,'$this->create_date'
                        ,'$this->modify_date'
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
                    if ( $this->query->execute("CALL insertMonthly_Recurring_Revenue(
                        '$this->coworking_space_id'
                        ,'$this->start_of_month_recurring_revenue'
                        ,'$this->new_recurring_revenue_from_new_customers'
                        ,'$this->new_recurring_revenue_from_expansion'
                        ,'$this->total_new_recurring_revenue'
                        ,'$this->lost_recurring_revenue_from_contraction'
                        ,'$this->churn_rate'
                        ,'$this->net_new_recurring_revenue'
                        ,'$this->end_of_month_recurring_revenue'
                        ,'$this->month_over_month_growth'
                        ,'$this->average_revenue_per_account'
                        ,'$this->average_revenue_per_new_account'
                        ,'$this->modify_date'
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
                if ( $this->query->execute("CALL validateMonthly_Recurring_Revenue('$id')") ) {
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
            if (checkInput::checkNewInputArray(array('$this->coworking_space_id','$this->start_of_month_recurring_revenue','$this->new_recurring_revenue_from_new_customers','$this->new_recurring_revenue_from_expansion','$this->total_new_recurring_revenue','$this->lost_recurring_revenue_from_contraction','$this->churn_rate','$this->net_new_recurring_revenue','$this->end_of_month_recurring_revenue','$this->month_over_month_growth','$this->average_revenue_per_account','$this->average_revenue_per_new_account','$this->create_date','$this->modify_date'))) {
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
