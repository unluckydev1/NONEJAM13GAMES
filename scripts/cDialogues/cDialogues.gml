// --- Info de dialogos

enum NomesConhecidos{
    Lucas,
    Manu,
    size
}
global.nomes = array_create(NomesConhecidos.size)
// --- Funções de Atalho para Facilitar a Escrita ---
function Texto(_speaker, _portrait, _text , _card = [], _func = -1){
    return {
        speaker: _speaker,
		portrait: _portrait,
        text: _text,
		card : _card,
        func: _func
    };
}
function Create_dialogue(falas){
    var inst = instance_create_depth(x,y,-999,oDialogo)
    inst.text = falas
}

function debug()
{
    var _strings = [];
    
    for (var i = 0; i < array_length(global.liberados); i++) {
    	array_push(_strings, global.liberados[i].id);
    }
    
    show_message(_strings);
    show_message(global.liberados);
}

function libera_chave(){

	oCutscene.has_key = true;

}

function libera_lencol(){

	oCutscene.has_lencol = true;

}

// ===============================
// CAPÍTULO 1 - A PRINCESA
// ===============================


// FLORESTA
Dialogo_Floresta = [

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Era uma vez uma *...",
        [CARD.FLORESTA],
        function(){
            global.cutscene_query = CUTSCENE.CUT_FLORESTA;
            global.card = -1;

        }
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Densa onde bravos heróis ousam se aventurar todos os dias blablabla games."
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Após caminhar alguns instantes, encontrou uma intersecção em seu caminho..."
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "O que levou nosso bravo herói a seguir a *",
        [CARD.TORRE,CARD.ESCURIDAO],
        function(){

            switch(global.card.id)
            {
                case CARD.TORRE:
                    global.cutscene_query = CUTSCENE.CUT_TORRE;
					libera_node(global.node_names.p2)
					//debug();
                break;

                case CARD.ESCURIDAO:
                    global.cutscene_query = CUTSCENE.CUT_ESCURIDAO;
					libera_node(global.node_names.p10)
                break;
            }

            global.card = -1;

        }
    )
];



// ===============================
// TORRE
// ===============================

Dialogo_Torre = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Após uma loooonga caminhada e várias pedras no caminho, nosso herói chega a alta torre onde sua amada fora presa pelo grandioso mago mal."
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Uma chama dentro de seu peito acende, e sente que precisa salva-la o quanto antes..."
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Nosso herói então decide agir pela *",
        [CARD.PORTA,CARD.JANELA],
        function(){

            switch(global.card.id)
            {
                case CARD.PORTA:
                    global.cutscene_query = CUTSCENE.CUT_PORTA;
					libera_node(global.node_names.p3)
                break;

                case CARD.JANELA:
                    global.cutscene_query = CUTSCENE.CUT_JANELA;
					libera_node(global.node_names.p7)
					//libera_node(global.node_names.p21)
                break;
            }

            global.card = -1;

        }
    )
];



// ===============================
// PORTA DA TORRE
// ===============================

Dialogo_Porta = [

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "De entrada da torre, e pensou que seria uma boa ideia tentar entrar diretamente por ela."
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "O que no fim algo inesperado aconteceu..."
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Pois o mago *...",
        [CARD.BOM,CARD.MALIGNO,CARD.SAPO],
        function(){

            switch(global.card.id)
            {
                case CARD.MALIGNO:
                    global.cutscene_query =	CUTSCENE.CUT_MGMAL;
					libera_node(global.node_names.p4)
                break;

                case CARD.BOM:
                    global.cutscene_query = CUTSCENE.CUT_MGBOM;
					libera_node(global.node_names.p5)
					
                break;
				case CARD.SAPO:
                    global.cutscene_query = CUTSCENE.CUT_MGSAPO;
					libera_node(global.node_names.p6)
					

                break;
            }

            global.card = -1;

        }
    )
];


dialogo_Porta_MgMal = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Apareceu e matou o herói, que fim cruel.",
        noone,
		function(){

			//transicao(rm_fluxograma)
			global.cutscene_query = CUTSCENE.CUT_QUARTO_PRINCESA_SEMPRIN
			global.Fluxo2 = true;
			libera_node(global.node_names.q0,global.nodes.fluxo2,global.liberados.fluxo2)
			libera_node(global.node_names.q2,global.nodes.fluxo2,global.liberados.fluxo2)
		}
    )
]
dialogo_Porta_MgBom = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Apareceu e ajudou ele a subir a torre.",
        noone,
		function(){
			global.cutscene_query = CUTSCENE.CUT_QUARTO_PRINCESA_COMPRIN
			global.Fluxo2 = true;
			libera_node(global.node_names.q0,global.nodes.fluxo2,global.liberados.fluxo2)
			libera_node(global.node_names.q1,global.nodes.fluxo2,global.liberados.fluxo2)
			//transicao(rm_fluxograma)
		}
    )
]
dialogo_Porta_MgSapo = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Apareceu e engoliu o herói, não lembrava dessa parte...",
        noone,
		function(){
			global.cutscene_query = CUTSCENE.CUT_QUARTO_PRINCESA_SEMPRIN
			global.Fluxo2 = true;
			libera_node(global.node_names.q0,global.nodes.fluxo2,global.liberados.fluxo2)
			libera_node(global.node_names.q2,global.nodes.fluxo2,global.liberados.fluxo2)
			//transicao(rm_fluxograma)
		}
    )
]
// ===============================
// JANELA DA TORRE
// ===============================

Dialogo_Janela = [

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Da torre, pois é uma das partes de mais fácil acesso..."
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "E pensou que seria uma boa ideia tentar *...",
        [CARD.ESCALAR,CARD.GRITAR],
        function(){

            switch(global.card.id)
            {
                case CARD.ESCALAR:
                    global.cutscene_query = CUTSCENE.CUT_ESCALAR;
					libera_node(global.node_names.p8)
                break;

                case CARD.GRITAR:
                    global.cutscene_query = CUTSCENE.CUT_GRITAR;
					libera_node(global.node_names.p9)
                break;
            }

            global.card = -1;

        }
    )
];

Dialogo_Cair = [

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "A torre. Então nosso herói de dispõe a fazer um grande esforço, mas ao chegar lá em cima, acaba falhando no ultimo tijolo...."
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "O que de fato não daria certo, pois estamos em um conto medieval, e não em histórias de super heróis que não possuem fadiga.",
        noone,
		function(){
			global.cutscene_query = CUTSCENE.CUT_QUARTO_PRINCESA_SEMPRIN
			global.Fluxo2 = true;
			libera_node(global.node_names.q0,global.nodes.fluxo2,global.liberados.fluxo2)
			libera_node(global.node_names.q2,global.nodes.fluxo2,global.liberados.fluxo2)
			//transicao(rm_fluxograma)
		}
    )
];

Dialogo_Gritar = [

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Pela princesa. Então não pensou duas vezes, e gritou o nome de sua querida amada..."
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Ela logo jogou uma corda que aparentava ser feita de seus lençóis, e não demorou muito para que o herói escalasse...",
        noone,
		function(){
			global.cutscene_query = CUTSCENE.CUT_QUARTO_PRINCESA_COMPRIN
			global.Fluxo2 = true;
			libera_node(global.node_names.q0,global.nodes.fluxo2,global.liberados.fluxo2)
			libera_node(global.node_names.q1,global.nodes.fluxo2,global.liberados.fluxo2)
			//transicao(rm_fluxograma)
		}
    )
];




// ===============================
// ESCURIDÃO
// ===============================

Dialogo_Escuridao = [

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Que não parecia ser um dos caminhos mais seguros, mas ainda assim seguiu adiante com toda a determinação que havia dentro de seu coração."
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Caminhando um pouco mais, avistou uma *",
        [CARD.LUZ,CARD.CASA],
        function(){

            switch(global.card.id)
            {
                case CARD.LUZ:
                    global.cutscene_query = CUTSCENE.CUT_LUZ;
					libera_node(global.node_names.p11)
                break;

                case CARD.CASA:
                    global.cutscene_query = CUTSCENE.CUT_CASA;
					libera_node(global.node_names.p12)
                break;
            }

            global.card = -1;

        }
    )
];



// ===============================
// LUZ
// ===============================

Dialogo_Luz = [

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "E decidiu se aproximar, pois poderia ser algo valioso, ou um poderoso artefato que ajudaria a chegar na torre!"
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Mas, é... Não era nenhum dos dois."
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "O herói acabou caindo em uma armadilha de urso, que o fez sangrar até a morte.",
        noone,
		function(){
			global.cutscene_query = CUTSCENE.CUT_QUARTO_PRINCESA_SEMPRIN
			global.Fluxo2 = true;
			libera_node(global.node_names.q0,global.nodes.fluxo2,global.liberados.fluxo2)
			libera_node(global.node_names.q2,global.nodes.fluxo2,global.liberados.fluxo2)
			//transicao(rm_fluxograma)
		}
    )
];



// ===============================
// CASA
// ===============================

Dialogo_Casa = [

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Que era de fato muito engraçada, nunca havia visto nada parecido, então decidiu se aproximar..."
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Ao dar de cara com a porta, decidiu *",
        [CARD.ENTRAR,CARD.BATER],
        function(){

            switch(global.card.id)
            {
                case CARD.ENTRAR:
                    global.cutscene_query = CUTSCENE.CUT_ENTRAR;
					libera_node(global.node_names.p14)
                break;

                case CARD.BATER:
                    global.cutscene_query = CUTSCENE.CUT_BATER;
					libera_node(global.node_names.p13)
                break;
            }
			
            global.card = -1;

        }
    )
];

Dialogo_Abrir = [

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Na casa, mas mal sabia ele que havia alguém morando ali..."
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "O mago, dono da propriedade, apesar de ser [c_yellow]BOM[/c], abominou a falta de educação do herói... !"
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "E o transformou em um [c_yellow]SAPO[/c] para que nunca mais fizesse essas coisas feias.",
        noone,
		function(){
			global.cutscene_query = CUTSCENE.CUT_QUARTO_PRINCESA_SEMPRIN
			global.Fluxo2 = true;
			libera_node(global.node_names.q0,global.nodes.fluxo2,global.liberados.fluxo2)
			libera_node(global.node_names.q2,global.nodes.fluxo2,global.liberados.fluxo2)
		}
    )
]
Dialogo_Bater = [

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Na porta, na esperança de receber alguma resposta, e não demorou muito para que conseguisse uma"
    ),

    Texto(
        "Miguel",
        spr_text_box_idoso,
        "um mago cogumelo o atendeu e perguntou oque lhe aflingia..."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "O Herói explicou ao mago a situação de sua amada, e o mago compreendeu totalmente, e estalou os dedos para que a princesa fosse teletransportada até sua casa.",
        noone,
		function(){
			global.cutscene_query = CUTSCENE.CUT_QUARTO_PRINCESA_COMPRIN
			global.Fluxo2 = true;
			libera_node(global.node_names.q0,global.nodes.fluxo2,global.liberados.fluxo2)
			libera_node(global.node_names.q1,global.nodes.fluxo2,global.liberados.fluxo2)
			
		}
    )
]

// ===============================
// CAPÍTULO 12.2 - QUARTO DA PRINCESA
// ===============================

// ---------------------------------------------------------
// SE O PRÍNCIPE CHEGOU AO CASTELO
// ---------------------------------------------------------

Dialogo_Quarto_Princesa_ComPrincipe = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "E lá, no alto da torre, anseia a princesa...",
        noone,
        function(){
            libera_node(global.node_names.q3, global.nodes.fluxo2, global.liberados.fluxo2);
        }
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "pensando se um dia conseguiria sair de dentro daquele minúsculo quarto, e então nosso bravo heroi surge!"
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Esse pensamento trouxe um questionamento, sobre *...",
        [CARD.ABRACAR, CARD.MATAR, CARD.PORTA],
        function(){
            switch(global.card.id)
            {
                case CARD.ABRACAR:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_ABRACAR;
                    libera_node(global.node_names.q4, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
                case CARD.MATAR:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_MATAR;
                    libera_node(global.node_names.q5, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
                case CARD.PORTA:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_PORTA_PR;
                    libera_node(global.node_names.q6, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
            }
            global.card = -1;
        }
    )
];

Dialogo_Quarto_Abracar = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "O príncipe, já que ansiava tanto pela sua chegada... Então correu aos braços fortes de seu salvador..."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "E da mesma forma na qual o príncipe veio a subir a torre, eles a desceram.",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

Dialogo_Quarto_Matar = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "O príncipe. E mesmo embora não tivesse uma madrasta má, nem sido envenenada por uma maçã, e muito menos estivesse em uma casa com sete anões..."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "a princesa associou a imagem do nosso príncipe a um caçador de recompensa que queria seu coração, e o empurrou da torre."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Pelo menos ela conseguiu descer da torre pela janela.",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

Dialogo_Quarto_Porta_Pr = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "A porta de seu quarto. Embora a porta sempre estivesse ali para ser aberta, a princesa nunca ousou abrir ela..."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Mas ao lado de seu salvador, se sentiu mais confiante. Logo o príncipe arrombou a porta, e não foi muito agradável o que encontraram do outro lado...."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Um grande *",
        [CARD.MAGO, CARD.REI, CARD.SAPO],
        function(){
            switch(global.card.id)
            {
                case CARD.MAGO:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_MAGO_PR;
                    libera_node(global.node_names.q7, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
                case CARD.REI:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_REI_PR;
                    libera_node(global.node_names.q10, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
                case CARD.SAPO:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_SAPO_PR;
                    libera_node(global.node_names.q11, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
            }
            global.card = -1;
        }
    )
];

Dialogo_Quarto_Mago_Pr = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Mago surgiu em sua frente, mas mal sabiam eles que..."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Era o mago *",
        [CARD.MALIGNO, CARD.BOM],
        function(){
            switch(global.card.id)
            {
                case CARD.MALIGNO:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_MGMAL_PR;
                    libera_node(global.node_names.q8, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
                case CARD.BOM:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_MGBOM_PR;
                    libera_node(global.node_names.q9, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
            }
            global.card = -1;
        }
    )
];

Dialogo_Quarto_MgMal_Pr = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Maligno. Então, ao ver os dois tentando escapar da torre que ele deixou a princesa confinada, não pensou duas vezes em desintegrar os dois com sua magia de raio.",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

Dialogo_Quarto_MgBom_Pr = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Bom. Então o mago ajudou eles, teletransportando-os de volta ao castelo.",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

Dialogo_Quarto_Rei_Pr = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Rei surgiu em sua frente! eles ficaram surpresos, até porque não era de se esperar que o próprio Pai da princesa viesse salva-la..."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "De qualquer forma, eles voltaram para a casa em segurança.",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

Dialogo_Quarto_Sapo_Pr = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Sapo surgiu em sua frente! Eles acharam o sapo fofo, até o momento em que ele abriu sua boca e sugou o príncipe para dentro de seu estomago..."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Foi assustador, mas sobrou tempo para que a princesa pudesse correr para longe dalí.",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

// ---------------------------------------------------------
// SE O PRÍNCIPE NÃO CHEGOU AO CASTELO
// ---------------------------------------------------------

Dialogo_Quarto_Princesa_SemPrincipe = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "E lá, no alto da torre, anseia a princesa...",
        noone,
        function(){
            libera_node(global.node_names.q12, global.nodes.fluxo2, global.liberados.fluxo2);
        }
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "pensando se um dia conseguiria sair de dentro daquele minúsculo quarto."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Esse pensamento trouxe um questionamento, sobre a *...",
        [CARD.JANELA, CARD.ESPERAR, CARD.CAMA, CARD.PORTA],
        function(){
            switch(global.card.id)
            {
                case CARD.JANELA:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_JANELA;
                    libera_node(global.node_names.q14, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
                case CARD.ESPERAR:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_ESPERAR;
                    libera_node(global.node_names.q17, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
                case CARD.CAMA:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_CAMA;
                    libera_node(global.node_names.q18, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
                case CARD.PORTA:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_PORTA_SO;
                    libera_node(global.node_names.q20, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
            }
            global.card = -1;
        }
    )
];

Dialogo_Quarto_Janela = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Janela. E decidiu que não precisava de um príncipe para lhe salvar, pois afinal... ela era muito responsável sobre suas decisões.",
        noone,
        function(){
            // CHECAGEM: Substitua 'global.tem_lencol' pela sua variável/lógica de fato
            if (oCutscene.has_lencol == true) {
                global.cutscene_query = CUTSCENE.CUT_QUARTO_JANELA_LENCOL;
                libera_node(global.node_names.q15, global.nodes.fluxo2, global.liberados.fluxo2);
            } else {
                global.cutscene_query = CUTSCENE.CUT_QUARTO_JANELA_MORTE;
                libera_node(global.node_names.q16, global.nodes.fluxo2, global.liberados.fluxo2);
            }
        }
    )
];

Dialogo_Quarto_Janela_Morte = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Talvez nem tanto assim, tendo em vista de que não pensou em como pousaria no chão de forma que não se machucasse..."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "E bem... o desfecho disso já está bem óbvio.",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

Dialogo_Quarto_Janela_Lencol = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "E ela tinha razão, utilizando seu lençol, talvez ela não fosse tão burra assim no final das contas...",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

Dialogo_Quarto_Esperar = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Esperar. O príncipe, pois tinha total convicção de que um dia ele chegaria para lhe salvar."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Então ela se sentou, e esperou.... e esperou.... e esperou.... até que passou tanto tempo que ela simplesmente virou apenas ossos."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "É... parece que príncipes encantados não existem.",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

Dialogo_Quarto_Cama = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Cama. O que levou a princesa a pensar sobre a cama que dormiu em todas essas noites, talvez pudesse haver algo em baixo dela!"
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Algo que poderia salvar sua vida, e lhe tirar dali! Então a princesa se dirigiu a cama, e quando se abaixou para procurar alguma coisa..."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "O bixo papão abocanhou ela... Bem, agora ela não vai mais se preocupar em sair daquela torre...",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

Dialogo_Quarto_Porta_So = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "A porta de seu quarto. Embora a porta sempre estivesse ali para ser aberta, a princesa nunca ousou abrir ela, pois tinha muito medo...",
        noone,
        function(){
            // CHECAGEM: Substitua 'global.tem_chave' pela sua variável/lógica de fato
            if (oCutscene.has_key == true) {
                global.cutscene_query = CUTSCENE.CUT_QUARTO_PORTA_CHAVE;
                libera_node(global.node_names.q22, global.nodes.fluxo2, global.liberados.fluxo2);
            } else {
                global.cutscene_query = CUTSCENE.CUT_QUARTO_PORTA_TRANCADA;
                libera_node(global.node_names.q21, global.nodes.fluxo2, global.liberados.fluxo2);
            }
        }
    )
];

Dialogo_Quarto_Porta_Trancada = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "A princesa então se aproximou da porta, e colocou a mão na maçaneta... A porta estava trancada."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "A princesa se frustrou por ter tentado e falhado, que nunca mais tentou fazer nada, e ficou sentada no cantinho do seu quarto por toda a eternidade...",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

Dialogo_Quarto_Porta_Chave = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "A princesa então se aproxima da porta, e encaixa a chave na grande fechadura, gira duas vezes e abre a porta..."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Mas acabou não sendo muito agradável o que encontrou do outro lado..."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "O * surgiu na sua frente!",
        [CARD.MAGO, CARD.REI, CARD.SAPO],
        function(){
            switch(global.card.id)
            {
                case CARD.MAGO:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_MAGO_SO;
                    libera_node(global.node_names.q23, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
                case CARD.REI:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_REI_SO;
                    libera_node(global.node_names.q26, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
                case CARD.SAPO:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_SAPO_SO;
                    libera_node(global.node_names.q27, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
            }
            global.card = -1;
        }
    )
];

Dialogo_Quarto_Mago_So = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Mago. Mas mal sabia ela que seria..."
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "O mago *",
        [CARD.BOM, CARD.MALIGNO],
        function(){
            switch(global.card.id)
            {
                case CARD.BOM:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_MGBOM_SO;
                    libera_node(global.node_names.q24, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
                case CARD.MALIGNO:
                    global.cutscene_query = CUTSCENE.CUT_QUARTO_MGMAL_SO;
                    libera_node(global.node_names.q25, global.nodes.fluxo2, global.liberados.fluxo2);
                break;
            }
            global.card = -1;
        }
    )
];

Dialogo_Quarto_MgBom_So = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Bom! Que a tiraria dali em pouco instantes! E ainda resmungou da incompetência do principe...",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

Dialogo_Quarto_MgMal_So = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Maligno! Que não pensou duas vezes em transforma-la em pó com seus poderes de raio.",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

Dialogo_Quarto_Rei_So = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "O que deixou a princesa muito surpresa e emocionada, afinal, não esperava que seu pai lhe salvaria da torre!",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

Dialogo_Quarto_Sapo_So = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "A princesa ficou encantada! como um sapinho tão fofo daquele estava sendo aprisionado na torre junto dela?!"
    ),
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Quando a princesa abaixou-se para fazer carinho no sapo, ele acaba engolindo a princesa...",
        noone,
        function(){
            transicao(rm_fluxograma);
        }
    )
];

// Lembre-se de adicionar todos esses arrays novos à `global.dialogues` se o seu sistema for por índice numérico!
global.dialogues = [
    Dialogo_Floresta,
    Dialogo_Torre,
    Dialogo_Porta,
    Dialogo_Janela,
    Dialogo_Escuridao,
    Dialogo_Luz,
    Dialogo_Casa
];
