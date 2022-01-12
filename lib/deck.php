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
	
	do_move($id,$player);
	exit;
	
	

}

	/*header("HTTP/1.1 400 Bad Request");
	print json_encode(['errormesg'=>"This move is illegal.'$id'"]);
	exit;	header("HTTP/1.1 400 Bad Request");
	print json_encode(['errormesg'=>"This move is illegal.'$id','$ow'"]);
	exit;
*/




function show_deck($input) {
	global $mysqli;

	$b=current_player($input['token']);
	if($b) {
		show_deck_by_player($b);
	} else {
		header('Content-type: application/json');
		print json_encode(read_deck(), JSON_PRETTY_PRINT);
	}
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
	$sql = 'select * from deck';
	$st = $mysqli->prepare($sql);
	$st->execute();
	$res = $st->get_result();
	return($res->fetch_all(MYSQLI_ASSOC));
}

function convert_deck(&$orig_deck) {
	$deck=[];
	foreach($orig_deck as $i=>&$row) {
		$deck[$row['cardid']] = &$row;
	} 
	return($deck);
}

function show_deck_by_player($b) {

	global $mysqli;

	$orig_deck=read_deck();
	$deck=convert_deck($orig_deck);
	$status = read_status();
	if($status['status']=='started' && $status['p_turn']==$b && $b!=null) {
		
	}
	header('Content-type: application/json');
	print json_encode($orig_deck, JSON_PRETTY_PRINT);
}


function do_move($id,$ow) {
	
	global $mysqli;
	$sql = 'call pick_card(?,?);';
	$st = $mysqli->prepare($sql);
	$st->bind_param('is',$id,$ow );
	$st->execute();
   
	header('Content-type: application/json');
	print json_encode(read_deck(), JSON_PRETTY_PRINT);


	

}

?> 
