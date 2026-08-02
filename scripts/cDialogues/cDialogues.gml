// --- Info de dialogos

enum NomesConhecidos{
    Lucas,
    Manu,
    size
}
global.nomes = array_create(NomesConhecidos.size)
// --- Funções de Atalho para Facilitar a Escrita ---
function Texto(_speaker, _text, _npc = -1, _card = -1, _func = -1){
    return {
        speaker: _speaker,
        text: _text,
		npc: _npc,
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
	Texto("Marcelo","o * caminhando, ele esta prestes a agir!",oNpcBardo,get_card(CARD.BARDO),
	function(){
		switch global.card.id{
			case 0: global.cutscene_query = 1; global.card = -1
			break;
			case 1: global.cutscene_query = 2; global.card = -1
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
global.dialogues = [Dialogo_Teste,Dialogo_Teste1,Dialogo_Teste2];
