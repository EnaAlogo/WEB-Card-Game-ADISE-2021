var me={token:null,p_turn:null};
var game_status={};
var deck={};
var last_update=new Date().getTime();
var timer=null;
$(function () {
	
	fill_deck();
	
	$('#game_login').click( login_to_game);
	$('#game_reset').click( reset_deck);
	
	$('#move_div').hide();
	game_status_update();
	
});
function fill_deck() {
	$.ajax({url: "moutzouris.php/deck/", 
		headers: {"X-Token": me.token},
		success: fill_deck_by_data });
}

function reset_deck() {
	$.ajax({url: "moutzouris.php/deck/", headers: {"X-Token": me.token}, method: 'POST',  success: fill_deck_by_data });
	$('#move_div').hide();
	$('#game_initializer').show(2000);
}



function getHTML2(i){
    const carddiv=document.createElement('div')

carddiv.innerText='?'
carddiv.classList.add("card",'back')

carddiv.setAttribute("id",i)

return carddiv
}
function getHTML(i,data){
    
    const carddiv=document.createElement('div')
    const color=data.suits==="♣"||data.suits==="♠" ? 'black' : 'red' 
    carddiv.innerText=data.suits
    carddiv.classList.add("card",color)
    carddiv.dataset.value=`${data.val} ${data.suits}`
    carddiv.setAttribute("id",i)
    
    return carddiv

    }
function fill_deck_by_data(data){

    deck=data;
    var compar;
    for(let i=0;i<data.length;i++) {
        
        if(me.p_turn='p1'){
            compar='player1'
        }
        else{
            compar='player2'
        }
        var o=data[i]
        var id='#card_'+o.cardid;
        if(o.owning==compar){	
            p1cardslot.appendChild(getHTML(id,o))
            
            }
        if(o.owning==compar){	
        p2cardslot.appendChild(getHTML2(id))
        document.getElementById(id).addEventListener("click",movetest,false)
        }
        
    }}

    function update_status(data) {
        last_update=new Date().getTime();
        var game_stat_old = game_status;
        game_status=data[0];
        update_info();
        clearTimeout(timer);
        if(game_status.p_turn==me.p_turn &&  me.p_turn!=null) {
            x=0;
            // do play
            if(game_stat_old.p_turn!=game_status.p_turn) {
                fill_deck();
            }
            $('#move_div').show(1000);
            timer=setTimeout(function() { game_status_update();}, 15000);
        } else {
            // must wait for something
            $('#move_div').hide(1000);
            timer=setTimeout(function() { game_status_update();}, 4000);
        }
         
    }

    function do_move(event){
        var o=event.target;
        var id=o.id;
        $.ajax({url: "moutzouris.php/deck/card/"+id, 
                method: 'PUT',
                dataType: "json",
                contentType: 'application/json',
                data: JSON.stringify( {cardid: id}),
                headers: {"X-Token": me.token},
                success: move_result,
                error: login_error});
    
    
    }







    function login_to_game() {
        if($('#username').val()=='') {
            alert('You have to set a username');
            return;
        }
        var pturn = $('#pturn').val();
        draw_empty_deck(pturn);
        fill_deck();
        
        $.ajax({url: "chess.php/players/"+pturn, 
                method: 'PUT',
                dataType: "json",
                headers: {"X-Token": me.token},
                contentType: 'application/json',
                data: JSON.stringify( {username: $('#username').val(), p_turn: pturn}),
                success: login_result,
                error: login_error});
    }
    
    function login_result(data) {
        me = data[0];
        $('#game_initializer').hide();
        update_info();
        game_status_update();
    }
    
    function login_error(data,y,z,c) {
        var x = data.responseJSON;
        alert(x.errormesg);
    }
    
    function game_status_update() {
        
        clearTimeout(timer);
        $.ajax({url: "moutzouris.php/status/", success: update_status,headers: {"X-Token": me.token} });
    }
    




    function update_info(){
        $('#game_info').html("I am Player: "+me.p_turn+", my name is "+me.username +'<br>Token='+me.token+'<br>Game state: '+game_status.status+', '+ game_status.p_turn+' must play now.');
        
        
    }

    function move_result(data){
        game_status_update();
        fill_by_data(data);
    }

  