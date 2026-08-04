// --- Info de dialogos

enum NomesConhecidos{
    Lucas,
    Manu,
    size
}
global.nomes = array_create(NomesConhecidos.size)
// --- Funções de Atalho para Facilitar a Escrita ---
function Texto(_speaker, _text, _type = -1, _card = -1, _func = -1){
    return {
        speaker: _speaker,
        text: _text,
		tipo: _type,
		card : _card,
        func: _func
    };
}
function Create_dialogue(falas){
    var inst = instance_create_layer(x,y,layer,oDialogo)
    inst.text = falas
}
// --- Montagem do Diálogo ---
Dialogo_Teste = [
	Texto("Miguel","e na estrada, esta uma figura familiar"),
	Texto("Marcelo","o * caminhando, ele esta prestes a agir!",TIPOS.PERSONAGEM,get_card(CARD.BARDO),
	function(){
		switch global.card.id{
			case CARD.REI: global.cutscene_query = 1; global.card = -1
			break;
			case CARD.BARDO: global.cutscene_query = 2; global.card = -1
			break;
			case CARD.SAPO: global.cutscene_query = 3; global.card = -1
			break;
		}
	}
	)
];
Dialogo_Teste1 = [
	Texto("Miguel","o rei sobe!"),
	
]
Dialogo_Teste2 = [
	Texto("Miguel","o bardo desce!")
	
]
Dialogo_Teste3 = [
	Texto("Miguel","o sapo volta!")
	
]
global.dialogues = [Dialogo_Teste,Dialogo_Teste1,Dialogo_Teste2,Dialogo_Teste3];
