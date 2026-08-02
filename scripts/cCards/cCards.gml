
global.card = noone

enum CARD {
    REI,
    BARDO
}

global.card_db = [];

global.card_db[CARD.REI] = {
    id: CARD.REI,
    nome: "Rei",
	color: c_blue
    //sprite: spr_rei,
    //descricao: "O governante do reino."
};

global.card_db[CARD.BARDO] = {
    id: CARD.BARDO,
    nome: "Bardo",
	color: c_red
    //sprite: spr_bardo,
   // descricao: "Um músico viajante."
};

function get_card(_id) {
    return global.card_db[_id];
}