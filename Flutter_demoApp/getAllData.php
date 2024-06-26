<?php
    include "config.php";
    $sql = "Select * from users order by firstName";
    $result = array();

    $res = $con -> query($sql);
    

    if($res -> num_rows > 0){
        while($row = $res-> fetch_assoc()){
            $result[] = $row;
        }
    }

    echo json_encode($result);

?>