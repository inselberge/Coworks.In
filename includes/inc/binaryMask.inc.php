<?php

class binaryMask
{
    public $userHex;
    public $requiredHex;

    protected $userBinary;
    protected $requiredBinary;
    protected $result;

    public function __construct( $userX, $requiredX)
    {
        $this->userHex=$userX;
        $this->userBinary = $this->translateHexToBinary($this->userHex);

        $this->requiredHex=$requiredX;
        $this->requiredBinary = $this->translateHexToBinary($this->requiredHex);
    }

    private function translateHexToBinary( $hex )
    {
        return base_convert($hex, 16, 2);
    }

    public function evaluate()
    {
        $this->result =  $this->requiredBinary & $this->userBinary;
    }

    public function printResult(){
        return $this->result;
    }
}
/*
for($k=0;$k<=15;$k++){
    echo "Decimal: $k \tHex:".base_convert($k,10,16)."\tBinary:".base_convert($k,10,2)."\n";
}

for($i=0x0;$i<=0xF;$i++){
    for($j=0;$j<=15;$j++){
        $bm= new binaryMask($i,$j);
        $bm->evaluate();
        echo "User Value: ".base_convert($i,10,2).", Required: ".base_convert($j,10,2)." ->".$bm->printResult()."\n";
    }
}
*/
