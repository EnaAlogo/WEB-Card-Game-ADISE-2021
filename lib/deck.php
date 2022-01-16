<?php

function show_card($id) {
	global $mysqli;

	$sql = 'select * from deck where cardid=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('i',$id);
	$st->execute();
	$res = $st->get_result();
	header('Content-type: application/json');
	print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);
}

function cards_owner($id){
	global $mysqli;
	$sql = 'select * from playing_deck where cardid=?';
	$st = $mysqli->prepare($sql);
	$st->bind_param('i',$id);
	$st->execute();
	$res = $st->get_result();
	if($row=$res->fetch_assoc()) {
		return($row['owning']);
	}
	return(null);
} 
	




function move_card($id,$token) {
    
	if($token==null || $token=='') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"token is not set."]);
		exit;
	}

	$player = current_player($token);
	if($player==null ) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"You are not a player of this game."]);
		exit;
	}
	$status = read_status();
	if($status['status']!='started') {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"Game is not in action."]);
		exit;
	}
	if($status['p_turn']!=$player) {
		header("HTTP/1.1 400 Bad Request");
		print json_encode(['errormesg'=>"It is not your turn."]);
		exit;
	}
    if($player=='p1'){
		if(cards_owner($id)=='player2'){
	      do_move($id,$player);
	      exit;}
		  else{
			header("HTTP/1.1 400 Bad Request");
			print json_encode(['errormesg'=>"Illegal Move"]);
			exit;

		  }
		}
	else if($player=='p2'){
		if(cards_owner($id)=='player1'){
			do_move($id,$player);
			exit;}
			else{
			  header("HTTP/1.1 400 Bad Request");
			  print json_encode(['errormesg'=>"Illegal Move"]);
			  exit;
  
			}

	}
	header("HTTP/1.1 400 Bad Request");
	print json_encode(['errormesg'=>"Illegal Move"]);
	 exit;

}





function show_deck($input) {
	global $mysqli;
    $player = current_player($input['token']);

		header('Content-type: application/json');
		print json_encode(read_deck(), JSON_PRETTY_PRINT);
		
	
}

function reset_deck() {
	global $mysqli;
	$sql = 'call new_game();';
	$mysqli->query($sql);
}
function reset_database() {
	global $mysqli;
	$sql = 'call reset_database();';
	$mysqli->query($sql);
}

function read_deck() {
	global $mysqli;
	$sql = 'select * from playing_deck';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	return($res->fetch_all(MYSQLI_ASSOC));
}







function do_move($id,$ow) {
	
	global $mysqli;
	$sql = 'call pick_card(?,?);';
	$st = $mysqli->prepare($sql);
	$st->bind_param('is',$id,$ow );
	$st->execute();
   
	header('Content-type: application/json');
	print json_encode(read_deck($ow), JSON_PRETTY_PRINT);


	

}



/*  
kapies sinartiseis pou tha apagoreuan ton kathena na parei info gia to game
kathos kai o kathe paixtis tha eperne mono tis dikies tou kartes alla den kserw
ean itan kataliles gia tis anagkes tis ergasias

function read_deck($p) {
	global $mysqli;
	if($p=='p1'){
	$sql = 'select * from playing_deck where owning="player1"';
	}
	else if($p=='p2'){
		$sql = 'select * from playing_deck where owning="player2"';
	}
	$sql = 'select * from playing_deck';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	return($res->fetch_all(MYSQLI_ASSOC));
}

function readOther($p){
	global $mysqli;
	if($p=='p1'){
	$sql = 'select cardid,owning from playing_deck where owning="player2"';
	}
	else if($p=='p2'){
		$sql = 'select cardid,owning from playing_deck where owning="player1"';	
	}
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	return($res->fetch_all(MYSQLI_ASSOC));
}

function show_by($p){
	if($p==null){
		header("HTTP/1.1 400 Bad Request");
	print json_encode(['errormesg'=>"Access Denied"]);
	exit;

	}
	return array_merge(readOther($p),read_deck($p));
}
*/


?> 
