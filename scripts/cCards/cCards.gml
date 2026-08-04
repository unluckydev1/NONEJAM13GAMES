
global.card = noone

enum CARD {
    REI,
    BARDO,
	SAPO,
	HEIGHT
}
enum TIPOS {
	PERSONAGEM,
	VERBOS,
	ADJETIVOS,
	DIRECTIONS,
	LOCAL
}

global.card_db = [];

global.card_db[CARD.REI] = {
    id: CARD.REI,
    nome: "Rei",
	color: c_blue,
	tipo: TIPOS.PERSONAGEM,
	unlocked: true
    //sprite: spr_rei,
    //descricao: "O governante do reino."
};

global.card_db[CARD.BARDO] = {
    id: CARD.BARDO,
    nome: "Bardo",
	color: c_red,
	tipo: TIPOS.PERSONAGEM,
	unlocked: true
    //sprite: spr_bardo,
   // descricao: "Um músico viajante."
};

global.card_db[CARD.SAPO] = {
    id: CARD.SAPO,
    nome: "Sapo",
	color: c_green,
	tipo: TIPOS.PERSONAGEM,
	unlocked: true
    //sprite: spr_bardo,
   // descricao: "Um músico viajante."
};


function get_card(_id) {
    return global.card_db[_id];
}