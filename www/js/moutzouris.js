var me={token:null,p_turn:null};
var game_status={};
var deck={};
var last_update=new Date().getTime();
var timer=null;
var ore=0;
var anata=0;
const oredesu=document.querySelector('.sc1');
const anatadesu=document.querySelector('.sc2');
const p1cardslot=document.querySelector('.p1-card-slot');
const p2cardslot=document.querySelector('.p2-card-slot');
const cardmove=document.getElementById('cardpick');
const turnnotif=document.getElementById('turnnotif');
const widget=document.querySelector('.widget');


let drawCard={
    basic:function(data){
        let carddiv=document.createElement('div')
        const color=data.suits==="♣"||data.suits==="♠" ? 'black' : 'red' 
        carddiv.innerText=data.suits
        carddiv.classList.add("card",color)
        carddiv.dataset.value=`${data.val} ${data.suits}`
        carddiv.setAttribute("id",data.cardid)
        return carddiv;

    }
    ,moutzouris: function(data){
        let carddiv=document.createElement('div')
        carddiv.innerText='??'
        carddiv.classList.add("card",'moutz')
        carddiv.setAttribute("id",data.cardid)
        return carddiv;
    }
    ,back: function(data){
        let carddiv=document.createElement('div')
        carddiv.innerText='??'
        carddiv.classList.add("card",'back')
        carddiv.setAttribute("id",data.cardid)
        return carddiv;}
}


let playaudio={
    picking : function(){
        cardmove.play();
    }
    ,turn:function(){
        turnnotif.play(); 
    }
}



$(function () {
	$('#game_login').click( login_to_game);
	$('#game_reset').click( reset_deck);


	game_status_update();

});
function fill_deck() {
    
	$.ajax({url: "moutzouris.php/deck/", 
		headers: {"X-Token": me.token},
		success: fill_deck_by_data });
}

function reset_deck() {
    if(me.p_turn=='p2'&&game_status.status!='initialized'){
    widget.innerText='Please wait for your turn...';

    }
    if(me.p_turn=='p1'&&game_status.status!='initialized'){
        widget.innerText='Its your turn to play now';;
    
        }
	$.ajax({url: "moutzouris.php/deck/", headers: {"X-Token": me.token}, method: 'POST',  success: fill_deck_by_data });
    
   

}
function reset_database(){
    if(confirm('Are you sure you want to delete everything in the database(users,status reset etc)?')){
        reset_database2();
        
    }
 
}
function reset_database2() {
	$.ajax({url: "moutzouris.php/deck/", headers: {"X-Token": me.token}, method: 'PUT',  success: fill_deck_by_data });
    resets()
	

}
function resets(){
    $('#game_initializer').show(2000);
    me={token:null,p_turn:null};
    cleandivs();
    ore=0;
    anata=0;
    oredesu.innerText='Me: '+ore;
    anatadesu.innerText='Other player: '+anata;
    result(2);

}


function fill_deck_by_data(data){
    if(deck==data){
        return;
    }
    cleandivs();

    deck=data;
    var compar;
    if(me.p_turn!=null){
    for(let i=0;i<data.length;i++) {

        if(me.p_turn=='p1'){
            compar='player1'
        }
        else{
            compar='player2'
        }
        var o=data[i]
        
        if(o.owning==compar){	
            if(o.val=='K'){
                p1cardslot.appendChild(drawCard.moutzouris(o))
            }
            else{
            p1cardslot.appendChild(drawCard.basic(o))
            }
            }
        else {	
        p2cardslot.appendChild(drawCard.back(o))
        document.getElementById(o.cardid).addEventListener("click",do_move)
        }}

    }}

    function update_status(data) {
        last_update=new Date().getTime();
        var game_stat_old = game_status;
        game_status=data[0];
        fill_deck();
        clearTimeout(timer);
        if(game_status.status=='not active'){
            resets()
        }
        if(game_stat_old.result!=game_status.result){
            result(1);
            
        }
        else{
            result(2);
        }
        if(game_status.p_turn==me.p_turn &&  me.p_turn!=null) {
            
            
            
            if(game_stat_old.p_turn!=game_status.p_turn&&game_status.status=='started') {
                
                playaudio.turn();
                fill_deck();
            }
        
            timer=setTimeout(function() { game_status_update();}, 15000);
        } else {
           
       
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

function result(norm){
if(me.token!=null){  
if(game_status.result!=null){
    if(game_status.result==me.p_turn){
        widget.innerText='YOU WON!'
        if(norm==1){
        ore++;
        oredesu.innerText='Me: '+ore;}

    }
    else{
        widget.innerText='YOU LOST!'
        if(norm==1){
        anata++;
        anatadesu.innerText='Other player: '+anata;}

    }
}
else{
   if(game_status.status=='initialized'){
    widget.innerText='Game initialized wait for another player';
   }
   else{
    
    if(game_status.p_turn==me.p_turn){
    widget.innerText='Its your turn to play now';
    }
    else{
        widget.innerText='Please wait for your turn...';

    }
}
}
 }else{
    widget.innerText='Please login';

 }
}

    function login_to_game() {
        if($('#username').val()=='') {
            alert('You have to set a username');
            return;
        }
        var pturn = $('#pturn').val();
       

        $.ajax({url: "moutzouris.php/players/"+pturn, 
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
        
        game_status_update()
        fill_deck()
    }

    function login_error(data,y,z,c) {
        var x = data.responseJSON;
        alert(x.errormesg);
    }

    function game_status_update() {
        clearTimeout(timer);
        $.ajax({url: "moutzouris.php/status/", success: update_status,headers: {"X-Token": me.token} });
    }





   

    function move_result(data){
        playaudio.picking();
        game_status_update();
        fill_deck_by_data(data);
    }

    function cleandivs() {
        while (p1cardslot.firstChild) {
            p1cardslot.removeChild(p1cardslot.firstChild);
        }
        while (p2cardslot.firstChild) {
            p2cardslot.removeChild(p2cardslot.firstChild);
        }
    }