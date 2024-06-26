<?php 
    include 'config.php';
    
    $email = $_POST['Email'];

    $email = 'psaextra2@gmail.com';


    $sql = "select * from users where Email = '$email';";

    $res = $con->query($sql);

    if($res -> num_rows>0){
        $resMessage['message'] = 'Account available';
        $resMessage['status'] = 'Success';
    }else{
        $resMessage['message'] = 'Account Not Available';
        $resMessage['status'] = 'Failed';
    }

    echo json_encode($resMessage);
?>