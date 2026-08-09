global.card = noone

enum CARD {
	//Cena
	FLORESTA,

	// PERSONAGENS
	PRINCIPE,
    REI,
    BARDO,
    SAPO,
	
    //DIRECTION
    TORRE,
    ESCURIDAO,
	
	// Substantivos
    LUZ,
    CASA,
    JANELA,
	PORTA,
	QUADRO,
	RELOGIO,
	BOLA_CRISTAL,
	LENCOL,
	CAMA,
	CHAVE,

    // Verbos
    ESCALAR,
    GRITAR,
    ENTRAR,
    BATER,
    ABRACAR,
    MATAR,
    ESPERAR,

    // Adjetivos
    BOM,
    MALIGNO,

    // Sujeitos
    MAGO,

    HEIGHT
}

enum TIPOS {
	CENA,
	DIRECTION,
    PERSONAGEM,
    SUBSTANTIVO,
    VERBO,
    ADJETIVO
}

global.card_db = [];

/// PERSONAGENS

global.card_db[CARD.REI] = {
    id: CARD.REI,
    nome: "Rei",
    color: c_blue,
    tipo: TIPOS.PERSONAGEM,
    unlocked: true, sprite: spr_rei
};

global.card_db[CARD.BARDO] = {
    id: CARD.BARDO,
    nome: "Bardo",
    color: c_red,
    tipo: TIPOS.PERSONAGEM,
    unlocked: true, sprite: sCarta
};

global.card_db[CARD.SAPO] = {
    id: CARD.SAPO,
    nome: "Sapo",
    color: c_green,
    tipo: TIPOS.PERSONAGEM,
    unlocked: true, sprite: spr_sapo,
};

global.card_db[CARD.MAGO] = {
    id: CARD.MAGO,
    nome: "Mago",
    color: c_purple,
    tipo: TIPOS.PERSONAGEM,
    unlocked: true, sprite: spr_bruxo_verde,
};

/// SUBSTANTIVOS

global.card_db[CARD.TORRE] = {
    id: CARD.TORRE,
    nome: "Torre",
    color: c_gray,
    tipo: TIPOS.SUBSTANTIVO,
    unlocked: true, sprite: spr_torre,
};

global.card_db[CARD.ESCURIDAO] = {
    id: CARD.ESCURIDAO,
    nome: "Escuridão",
    color: c_black,
    tipo: TIPOS.SUBSTANTIVO,
    unlocked: true, sprite: spr_bosque
};

global.card_db[CARD.LUZ] = {
    id: CARD.LUZ,
    nome: "Luz",
    color: c_yellow,
    tipo: TIPOS.SUBSTANTIVO,
    unlocked: true, sprite: spr_brilho
};

global.card_db[CARD.CASA] = {
    id: CARD.CASA,
    nome: "Casa",
    color: make_color_rgb(150,100,50),
    tipo: TIPOS.SUBSTANTIVO,
    unlocked: true, sprite: spr_carta_casa
};

global.card_db[CARD.JANELA] = {
    id: CARD.JANELA,
    nome: "Janela",
    color: c_aqua,
    tipo: TIPOS.SUBSTANTIVO,
    unlocked: true, sprite: spr_carta_janela
};

global.card_db[CARD.PORTA] = {
    id: CARD.PORTA,
    nome: "Porta",
    color: c_yellow,
    tipo: TIPOS.SUBSTANTIVO,
    unlocked: true, sprite: spr_carta_porta
};

global.card_db[CARD.CAMA] = {
    id: CARD.CAMA,
    nome: "Cama",
    color: c_fuchsia,
    tipo: TIPOS.SUBSTANTIVO,
    unlocked: true, sprite: sCarta
};

/// VERBOS

global.card_db[CARD.ESCALAR] = {
    id: CARD.ESCALAR,
    nome: "Escalar",
    color: c_lime,
    tipo: TIPOS.VERBO,
    unlocked: true, sprite: spr_carta_escalar
};

global.card_db[CARD.GRITAR] = {
    id: CARD.GRITAR,
    nome: "Gritar",
    color: c_lime,
    tipo: TIPOS.VERBO,
    unlocked: true, sprite: spr_carta_gritar
};

global.card_db[CARD.ENTRAR] = {
    id: CARD.ENTRAR,
    nome: "Entrar",
    color: c_lime,
    tipo: TIPOS.VERBO,
    unlocked: true, sprite: spr_carta_entrar
};

global.card_db[CARD.BATER] = {
    id: CARD.BATER,
    nome: "Bater",
    color: c_lime,
    tipo: TIPOS.VERBO,
    unlocked: true, sprite: spr_cara_bater
};

global.card_db[CARD.ABRACAR] = {
    id: CARD.ABRACAR,
    nome: "Abraçar",
    color: c_lime,
    tipo: TIPOS.VERBO,
    unlocked: true, sprite: spr_carta_hug
};

global.card_db[CARD.MATAR] = {
    id: CARD.MATAR,
    nome: "Matar",
    color: c_lime,
    tipo: TIPOS.VERBO,
    unlocked: true, sprite: sCarta
};

global.card_db[CARD.ESPERAR] = {
    id: CARD.ESPERAR,
    nome: "Esperar",
    color: c_lime,
    tipo: TIPOS.VERBO,
    unlocked: true, sprite: sCarta
};

/// ADJETIVOS

global.card_db[CARD.BOM] = {
    id: CARD.BOM,
    nome: "Bom",
    color: c_green,
    tipo: TIPOS.ADJETIVO,
    unlocked: true, sprite: spr_carta_bom
};

global.card_db[CARD.MALIGNO] = {
    id: CARD.MALIGNO,
    nome: "Maligno",
    color: c_red,
    tipo: TIPOS.ADJETIVO,
    unlocked: true, sprite: spr_carta_mal
};

global.card_db[CARD.FLORESTA] = {
    id: CARD.FLORESTA,
    nome: "Floresta",
    color: c_green,
    tipo: TIPOS.CENA,
    unlocked: true, sprite: sCarta
};

global.card_db[CARD.PRINCIPE] = {
	id: CARD.PRINCIPE,
	nome: "Príncipe",
	color: c_blue,
	tipo: TIPOS.PERSONAGEM,
	unlocked: true, sprite: sCarta
};
//======================================================
// SUBSTANTIVOS
//======================================================

global.card_db[CARD.QUADRO] = {
	id: CARD.QUADRO,
	nome: "Quadro",
	color: make_color_rgb(120,80,40),
	tipo: TIPOS.SUBSTANTIVO,
	unlocked: true, sprite: sCarta
};

global.card_db[CARD.RELOGIO] = {
	id: CARD.RELOGIO,
	nome: "Relógio",
	color: c_gray,
	tipo: TIPOS.SUBSTANTIVO,
	unlocked: true, sprite: sCarta
};

global.card_db[CARD.BOLA_CRISTAL] = {
	id: CARD.BOLA_CRISTAL,
	nome: "Bola de Cristal",
	color: c_aqua,
	tipo: TIPOS.SUBSTANTIVO,
	unlocked: true, sprite: sCarta
};

global.card_db[CARD.LENCOL] = {
	id: CARD.LENCOL,
	nome: "Lençol",
	color: c_white,
	tipo: TIPOS.SUBSTANTIVO,
	unlocked: true, sprite: sCarta
};
// Adicione a chave ao banco de dados global de cartas
global.card_db[CARD.CHAVE] = {
    id: CARD.CHAVE,
    nome: "Chave",
    color: c_yellow,
    tipo: TIPOS.SUBSTANTIVO,
    unlocked: true, sprite: sCarta
};
function get_card(_id) {
    return global.card_db[_id];
}

function libera_card(_id){
	get_card(_id).unlocked = true
}

