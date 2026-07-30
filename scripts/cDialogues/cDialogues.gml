// --- Info de dialogos

enum NomesConhecidos{
    Lucas,
    Manu,
    size
}
global.nomes = array_create(NomesConhecidos.size)
// --- Funções de Atalho para Facilitar a Escrita ---
function Texto(_speaker, _text, _next = 0, _func = -1){
    return {
        speaker: _speaker,
        text: _text,
        next: _next - 1, 
        func: _func,
    };
}
function NewStart(_index ){
    var D = oDialogo
    D.father.TextP = _index
    return(_index)
}
function Escolhas(_speaker, _text, _array_choices) {
    return {
        speaker: _speaker,
        text: _text,
        choices: _array_choices,
        next: -1
    };
}
function Opcao(_text, _next_func, _show = true) {
    return {
        text: _text,
        flagged: false,
        next: _next_func,
        show: _show
    };
}
// --- Funções de Lógica do Sistema ---
function Flag(){
    var D = oDialogo
    var _page = D.page
    var _arr = D.text[_page].choices
    var _select = D.selected
    _arr[_select].flagged = true
}
function RemoveChoice(){
    var D = oDialogo
    var _page = D.page
    var _arr = D.text[_page].choices
    var _select = D.selected
    if (array_length(_arr) == 1){
        variable_struct_remove(D.text[_page], "choices")
        return 0
    }
    _arr = array_delete(_arr, _select, 1)
}
function GetLen(_topage = -1){
    var D = oDialogo
    var _page = D.page
    if (_topage != -1) {_page = _topage - 1}
    var _arr = D.text[_page].choices
    return array_length(_arr)
}
function LastChoice(_page, num_choice = 1,_bool = 1){
    var D = oDialogo

    if (GetLen(_page) == 1){
       D.text[_page - 1].choices[num_choice - 1].show = _bool
    }
}
// --- Funções de atalho pra criação de dialogos ---
function Create_dialogue(falas, script = -1){
    var inst = instance_create_layer(x,y,layer,oDialogo)
    inst.text = falas
}
// --- Montagem do Diálogo ---
Dialogo_Teste = [
	Texto("Miguel","Oxente Painho!!!"),
	Texto("Marcelo o Rato","Cuscuz"),
	Escolhas("Miguel", "Marcelo...", [
	Opcao("Te odeio marcelo",function(){ return -1 } ,-1),	
	Opcao("Te amo marcelo",function(){ return -1 } ,-1)
	])
];

global.dialogues = [Dialogo_Teste];