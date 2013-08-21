<?php
/*
ToDo:
    pass the dynamic query type to JavaScript
    Implement AJAX append using PHP and previously specified dynamic query
    file:///home/carl/Public/AffCell/includes/jquery-tablesorter/docs/example-widgets.html
Required: 
    a valid initial result set, database connection, id for the table
css:
    //Original
	<style type="text/css">@import "../docs/css/jq.css";</style>
	<style type="text/css">@import "../themes/blue/style.css";</style>
    //Moved to:
	<style type="text/css">@import "../css/jq.css";</style>
	<style type="text/css">@import "../css/tableSorter.css";</style>

js:
    //Original
	<script type="text/javascript" src="../jquery-latest.js"></script>
	<script type="text/javascript" src="../jquery.tablesorter.js"></script>
    <script type="text/javascript" src=".js/appendTableSorter.js"></script>
	<script type="text/javascript" src="../addons/pager/jquery.tablesorter.pager.js"></script>
	<script type="text/javascript" src="js/chili/chili-1.8b.js"></script>
	<script type="text/javascript" src="js/docs.js"></script>
    //Moved to:
	<script type="text/javascript" src="../js/jquery-latest.js"></script>
	<script type="text/javascript" src="../js/jquery.tablesorter.js"></script>
    <script type="text/javascript" src="../js/appendTableSorter.js"></script>
	<script type="text/javascript" src="../js/jquery.tablesorter.pager.js"></script>
	//Doesn't seem to exist: <script type="text/javascript" src="js/chili/chili-1.8b.js"></script>
	<script type="text/javascript" src="../js/docs.js"></script>
    <script type="text/javascript" src="../js/repeatHeaders.js"></script>
*/
/**
 *
 */
class tableBuilder
{

    //class variables
    public $result;
    public $connection;
    public $id;

    private $columnNames;
    private $tableHead;
    private $tableBody;
    private $tableFoot;

    //options
    public $limitResult;
    public $bgColor;
    public $textColor;
    public $bgColorAlt;
    public $textColorAlt;
    public $width;
    public $height;
    public $checkBoxes;

    //internal variables
    private $status;
    private $i;

    /**
     * @param $dbc
     * @param $r
     * @param $id
     * @throws Exception
     */
    public function __construct( $dbc, $r, $id )
    {
        if ( isset($dbc, $r, $id) AND !is_null($dbc) AND !is_null($r) AND is_string($id) ) {
            $this->connection = $dbc;
            $this->result = $r;
            $this->id = $id;
            $this->setOptionDefault();
            return TRUE;
        } else {
            //throw new Exception(utf8_encode(__CLASS__."::".__FUNCTION__.": Insufficent or invalid input."));
            echo utf8_encode(__CLASS__ . "::" . __FUNCTION__ . ": FAILED due to insufficient or invalid input \n");
            return FALSE;
        }
    }

    /**
     * @param $key
     * @param $value
     * @return bool
     * @throws Exception
     */
    public function setOption( $key, $value )
    {
        if ( isset($key, $value) AND !is_null($key) ) {
            switch ( $key ) {
                case 'limitResult':
                    if ( is_int($value) === TRUE ) {
                        $this->limitResult = $value;
                    } else {
                        $this->limitResult = 25;
                    }
                    ;
                    return TRUE;
                    break;
                case 'bgColor':
                    if ( is_string($value) === TRUE ) {
                        $this->bgColor = $value;
                    } else {
                        $this->bgColor = "white";
                    }
                    ;
                    return TRUE;
                    break;
                case 'textColor':
                    if ( is_string($value) === TRUE ) {
                        $this->textColor = $value;
                    } else {
                        $this->textColor = "black";
                    }
                    ;
                    return TRUE;
                    break;
                case 'bgColorAlt':
                    if ( is_string($value) === TRUE ) {
                        $this->bgColorAlt = $value;
                    } else {
                        $this->bgColorAlt = "gray";
                    }
                    ;
                    return TRUE;
                    break;
                case 'textColorAlt':
                    if ( is_string($value) === TRUE ) {
                        $this->textColorAlt = $value;
                    } else {
                        $this->textColorAlt = "white";
                    }
                    ;
                    return TRUE;
                    break;
                case 'width':
                    if ( is_int($value) AND ($value > 0) ) {
                        $this->width = $value . "%";
                    } else {
                        $this->width = "100%";
                    }
                    ;
                    return TRUE;
                    break;
                case 'height':
                    if ( is_int($value) AND ($value > 0) ) {
                        $this->height = $value . "%";
                    } else {
                        $this->height = "100%";
                    }
                    ;
                    return TRUE;
                    break;
                case 'checkBoxes':
                    if ( $value === TRUE ) {
                        $this->checkBoxes = $value;
                    } else {
                        $this->checkBoxes = FALSE;
                    }
                    ;
                    return TRUE;
                    break;
                default:
                    return FALSE;
                    break;
            }
        } else {
            //didn't pass in the required parameter
            //throw new Exception(utf8_encode(__CLASS__.'::'.__FUNCTION__.':Insufficent input.'));
            echo utf8_encode(__CLASS__ . '::' . __FUNCTION__ . ": FAILED due to insufficient input \n");
            return FALSE;
        }
    }

    private function setOptionDefault()
    {
        $this->limitResult = 25;
        $this->bgColor = "white";
        $this->bgColorAlt = "gray";
        $this->textColor = "black";
        $this->textColorAlt = "white";
        $this->width = "100%";
        $this->height = "100%";
        $this->checkBoxes = FALSE;
    }

    /**
     * @param $row
     */
    private function setColumnNames( $row )
    {
        $finfo = array_keys($row);
        foreach ( $finfo AS $key => $val ) {
            $this->columnNames .= "\t\t\t" . '<th class="header">' . $val . '</th>' . "\n";
        }
        //echo $this->columnNames;
    }

    private function setHead()
    {
        $this->tableHead = "\t" . '<thead>' . "\n";
        $this->tableHead .= "\t\t" . '<tr>' . "\n";
        $this->tableHead .= $this->columnNames;
        $this->tableHead .= "\t\t" . '</tr>' . "\n";
        $this->tableHead .= "\t" . '</thead>' . "\n";
    }

    private function setFoot()
    {
        $this->tableFoot = "\t" . '<tfoot>' . "\n";
        $this->tableFoot .= "\t\t" . '<tr>' . "\n";
        $this->tableFoot .= $this->columnNames;
        $this->tableFoot .= "\t\t" . '</tr>' . "\n";
        $this->tableFoot .= "\t" . '</tfoot>' . "\n";
    }

    public function printHead()
    {
        echo $this->tableHead;
    }

    public function printBody()
    {
        echo $this->tableBody;
    }

    public function printFoot()
    {
        echo $this->tableFoot;
    }

    public function printStartTable()
    {
        echo '<p><a href="#" id="appendStart">Add 25 rows of data </a> (can be clicked many times, more than a 1000 rows can be slow)</p>' . "\n";
        echo '<table id="' . $this->id . '" cellspacing="1" cellpadding="0" class="tablesorter shadow roundedSmall">' . "\n";
    }

    static public function printEndTable()
    {
        echo '</table>' . "\n";
        echo '<p><a href="#" id="appendEnd">Add 25 rows of data </a> (can be clicked many times, more than a 1000 rows can be slow)</p>' . "\n";
    }

    static public function printStartBody()
    {
        echo "\t" . '<tbody>' . "\n";
    }

    static public function printEndBody()
    {
        echo "\t" . '</tbody>' . "\n";
    }

    /**
     * @param $row
     */
    private function printRow( $row )
    {
        if ( is_array($row) ) {
            if ( fmod($this->i, 2) == 0 ) {
                echo "\t\t" . '<tr class="even" bgcolor="' . $this->bgColor . '">' . "\n";
            } else {
                echo "\t\t" . '<tr class="odd" bgcolor="' . $this->bgColorAlt . '">' . "\n";
            }
            foreach ( $row as $key => $value ) {
                echo "\t\t\t" . '<td>' . $value . '</td>' . "\n";
            }
            echo "\t\t" . '</tr>' . "\n";
        } else {
        }
    }

    public function printPager()
    {
        echo '<div id="pager" class="pager">
	<form>
		<a class="first shadow"><<</a>
		<a class="prev shadow"><</a>
		<input type="text" class="pagedisplay shadow"/>
		<a class="next shadow">></a>
		<a class="last shadow">>></a>
		<select class="pagesize">
			<option selected="selected"  value="25">25</option>
			<option  value="50">50</option>
			<option  value="100">100</option>
		</select>
	</form>
</div>';
    }

    public function printScripts()
    {
        echo '
                    <script type="text/javascript" src="../js/jquery-latest.js"></script>
                    <script type="text/javascript" src="../js/jquery.tablesorter.js"></script>
                    <script type="text/javascript" src="../js/appendTableSorter.js"></script>
                    <script type="text/javascript" src="../js/jquery.tablesorter.pager.js"></script>
                    <script type="text/javascript" src="../js/docs.js"></script>
                    <script type="text/javascript" src="../js/repeatHeaders.js"></script>
                ';
    }

    public function printCSS()
    {
        echo '
                    <style type="text/css">@import "../css/jq.css";</style>
                    <style type="text/css">@import "../css/tableSorter.css";</style>
                ';
    }

    public function execute()
    {
        $this->printStartTable();
        $this->i = 0;
        $row = mysqli_fetch_assoc($this->result);
        while ( $row ) {
            if ( $this->i == 0 ) {
                $this->setColumnNames($row);
                $this->setHead();
                $this->setFoot();
                $this->printHead();
                $this->printStartBody();
            }
            $this->printRow($row);
            $this->i++;
            $row = mysqli_fetch_assoc($this->result);
        }
        $this->printEndBody();
        $this->printFoot();
        $this->printEndTable();
        //$this->printPager();
    }
}


//Set the database access information as constants:
/*
require("../../config/config.inc.php");
require_once(MYSQL);
require_once("../../config/databaseHelp.php");

$r=mysqli_query($dbc,"SELECT * from Category");
$id="blargh";
try{
$tb = new TableBuilder($dbc,$r,$id);
$tb->printCSS();
$tb->printScripts();
$tb->execute();
}
catch (Exception $e){
		echo $e;
}
*/
