<?php
require_once "../lib/dbconnect.php";
require_once "../lib/deck.php";
require_once "../lib/game.php";
require_once "../lib/users.php";

$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
$input = json_decode(file_get_contents('php://input'),true);
if($input==null) {
    $input=[];
}
if(isset($_SERVER['HTTP_X_TOKEN'])) {
    $input['token']=$_SERVER['HTTP_X_TOKEN'];
} else {
    $input['token']='';
}




 
switch ($r=array_shift($request)) {
    case 'deck' : 
        switch ($b=array_shift($request)) {
            case '':
            case null: handle_deck($method,$input);
                        break;
            case 'card': handle_card($method,$input);
                        break;
	    default: header("HTTP/1.1 404 Not Found");
                            break;
			}
            break;
    case 'status': 
			if(sizeof($request)==0) {handle_status($method);}
			else {header("HTTP/1.1 404 Not Found");}
			break;
	case 'players': handle_player($method, $request,$input);
			    break;
	default:  header("HTTP/1.1 404 Not Found");
                        exit;
}


function handle_deck($method,$input) {
    if($method=='GET') {
            show_deck($input);
    } else if ($method=='POST') {
            reset_deck();
            show_deck($input);
    }
    else if($method=='PUT'){
        reset_database();
    } 
    else {
        header('HTTP/1.1 405 Method Not Allowed');
    }

}

    function handle_card($method,$input) {
         
        if($method=='GET') {
            show_card($input['cardid']);
        } else if ($method=='PUT') {
           
            
            move_card($input['cardid'],$input['token']);
        }    


}

function handle_player($method, $p,$input) {
    switch ($b=array_shift($p)) {

        case 'p2': 
		case 'p1': handle_user($method, $b,$input);
					break;
		default: header("HTTP/1.1 404 Not Found");
				 print json_encode(['errormesg'=>"Player $b not found."]);
                 break;
	}
}

function handle_status($method) {
    if($method=='GET') {
        show_status();
    } else {
        header('HTTP/1.1 405 Method Not Allowed');
    }
}



?> 