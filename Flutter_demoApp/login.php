<?php 
    include "config.php";

    $email = $_POST['Email'];
    $password = $_POST['Password'];

    //$email = "admin@admin.com";
    //$password = "Admin@123";

    if(!empty($email) && !empty($password)){
        $sql = "Select * from users where Email = ('$email') AND password = ('$password');";
        $res = $con->query($sql);

    if($res -> num_rows>0 ){
        if($email == 'admin@admin.com'){
            $resMessage['status'] = 'Success';
            $resMessage['account'] = 'Admin';
        }else{
            $resMessage['status'] = 'Success';
            $resMessage['account'] = 'User';
        }     
    }else{
        $resMessage['status'] = 'Error : Login Unsuccessful';

    }

    }else{
        $resMessage['status'] = 'Error : Fill Out the Fields';
    }
    
    echo json_encode($resMessage);
    
   
?>