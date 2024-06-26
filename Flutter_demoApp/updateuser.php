<?php 
    include "config.php";
    $firstname = $_POST['FirstName'];
    $lastname = $_POST['LastName'];
    $email = $_POST['Email'];
    $address = $_POST['Address'];
    $phonenumber = $_POST['PhoneNumber'];
    $volunteerexp = $_POST['Volunteer_Exp'];

    $password = $_POST['Password'];
    $id =$_POST['ID'];
    
    if($firstname!=""&&$lastname!=""&&$email!=""&&$address!=""&&$phonenumber!=""&&$volunteerexp!=""&&$password!=""){

    $sql = "update users set FirstName = '$firstname' ,LastName = '$lastname' ,Email='$email',Password='$password',PhoneNumber='$phonenumber',Address='$address',Volunteer_Exp='$volunteerexp' where ID = $id;";

    if($con->query($sql)){
        echo "true";
    }else{
        echo "false";
    }

    }if ($firstname!=""&&$lastname!=""&&$email!=""&&$address!=""&&$phonenumber!=""&&$volunteerexp!="" ) {
        $sql = "update users set FirstName = '$firstname' ,LastName = '$lastname' ,Email='$email',PhoneNumber='$phonenumber',Address='$address',Volunteer_Exp='$volunteerexp' where ID = $id;";

        if($con->query($sql)){
            echo "true";
        }else{
            echo "false";
        }
    }
    
?>