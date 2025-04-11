// @param text_id
function scr_game_text(_text_id){
switch (_text_id){
		
	case "event1": 
		scr_text("Meus Deus! Que susto", "player");
			//scr_text_shake(0, 26); 
		scr_text("O que aconteceu?", "player");
			//scr_text_float(0, 16);
		scr_text("To fora! Vou sair desse lugar", "player");
		scr_text("As views nao valem mais a pena que a minha vida", "player");
			//scr_text_color(0, 46, c_red, c_red, c_red, c_red);
		scr_text("Aquela porta nao estava ali antes, vou tentar ela", "player"); 
		break;
			
	case "door1":
		scr_text("Essa porta esta trancada, preciso achar algo para abrir", "player");  
		scr_text("Isso deve ser algo haver com a pedra  de antes", "player");
		scr_text("Talvez eu deva procura-la", "player"); 
		break; 
		
	case "door2":
		scr_text("Essa porta parece estar aberta, o que sera que tem la?", "player"); 
		break;	
		
	case "door3":
		scr_text("Essa porta esta tracanda", "player"); 
		scr_text("Melhor eu tentar outra", "player"); 
		break;
		
	case "door4":
		scr_text("Essa porta esta tracanda", "player"); 
		scr_text("Melhor eu tentar outra", "player"); 
		break;
			
	case "door1_key":
		scr_text("Consegui abrir a porta!", "player"); 
		scr_text("Finalmente poderei sair desse pesadelo!!", "player");
		break;		
			
	case "door3_key":
		scr_text("A outra gema deve estar nessa sala", "player"); 
		scr_text("O que sera que eu vou ter que fazer dessa vez?", "player"); 
		break;
			
		
	case "door4_key":
		scr_text("Por favor, que essa seja a porta certa!", "player"); 
		scr_text("Eu nao aguento mais!", "player"); 
		break;
		
	
	case "jwl1":
		scr_text("Esse deve ser um dos pedacos da gema de antes", "player"); 
		scr_text("Talvez eu precise juntar as tres", "player"); 
		scr_text("Onde sera que estao as outra duas?", "player");
		break;
		
	case "jwl2":
		scr_text("Mais uma pedra para  a colecao!", "player"); 
		scr_text("Preciso achar a ultima", "player"); 
		scr_text("So ha mais um corredor sobrando, essa sera facil!", "player"); 
		break;
		
	case "jwl3":
		scr_text("Com isso sao tres!", "player");
		scr_text("Sera que agora conseguirei sair daqui?", "player");
		scr_text("Melhor eu voltar para aquela porta e tentar a colocar as gemas", "player");
		break;	
		
	case "locked1":
		scr_text("MEU DEUS! Eu estou presa aqui", "player");
			scr_text_shake(0, 8); 
		scr_text("Tem uma gema ali, talvez eu precise dela para sair", "player");
			scr_text_color(8, 11, c_red,c_red, c_red,c_red);
		break;	
		
	case "locked2":
		scr_text("Nao posso sair ate conseguir a gema", "player");
			scr_text_color(31, 34, c_blue, c_blue, c_blue, c_blue);
		break;	
		
	case "locked3":
		scr_text("Nao posso sair ate conseguir a gema", "player");
			scr_text_color(31, 34, c_green, c_green, c_green, c_green);
		break;	
		
	}

}