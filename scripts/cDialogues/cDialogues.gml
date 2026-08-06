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
    var inst = instance_create_layer(x,y,layer,oDialogo)
    inst.text = falas
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
					show_message("oi")
                break;

                case CARD.ESCURIDAO:
                    global.cutscene_query = CUTSCENE.CUT_ESCURIDAO;
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
        "Pois estava com MUITA pressa, e se demorasse demais para resgatar a princesa, sabe lá Deus o que poderia acontecer!"
    ),

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
        "O que no fim não foi tão eficiente assim..."
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
					room_goto(rm_fluxograma)
                break;

                case CARD.BOM:
                    global.cutscene_query = CUTSCENE.CUT_MGBOM;
					libera_node(global.node_names.p5)
					room_goto(rm_fluxograma)
                break;
				case CARD.SAPO:
                    global.cutscene_query = CUTSCENE.CUT_MGSAPO;
					libera_node(global.node_names.p6)
					room_goto(rm_fluxograma)
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
        "Apareceu e matou o herói, que fim cruel."
    )
]
dialogo_Porta_MgBom = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Apareceu e ajudou ele a subir a torre."
    )
]
dialogo_Porta_MgSapo = [
    Texto(
        "Miguel",
        spr_text_box_idoso,
        "Apareceu e engoliu o herói, não lembrava dessa parte..."
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
                break;

                case CARD.GRITAR:
                    global.cutscene_query = CUTSCENE.CUT_GRITAR;
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

			room_goto(rm_fluxograma)
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
        "Ela logo jogou uma corda que aparentava ser feita de seus lençóis, e não demorou muito para que o herói escalasse..."
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
                break;

                case CARD.CASA:
                    global.cutscene_query = CUTSCENE.CUT_CASA;
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
        "O herói acabou caindo em uma armadilha de urso, que o fez sangrar até a morte."
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
                break;

                case CARD.BATER:
                    global.cutscene_query = CUTSCENE.CUT_BATER;
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
        "E o transformou em um [c_yellow]SAPO[/c] para que nunca mais fizesse essas coisas feias."
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
        "O Herói explicou ao mago a situação de sua amada, e o mago compreendeu totalmente, e estalou os dedos para que a princesa fosse teletransportada até sua casa."
    )
]
//======================================================
// CAPÍTULO 1 - PRINCESA
//======================================================

Dialogo_Princesa = [

Texto(
    "Miguel",
    spr_text_box_idoso,
    "E lá, no alto da torre, anseia a princesa... pensando se um dia conseguiria sair de dentro daquele minúsculo quarto."
),

Texto(
    "Miguel",
    spr_text_box_idoso,
    "Todo esse pensamento a levantou um questionamento, sobre *",
    [CARD.PRINCIPE, CARD.JANELA],
    function(){

        switch(global.card.id)
        {
            case CARD.PRINCIPE:
                global.cutscene_query = CUTSCENE.CUT_PRINCIPE;
            break;

            case CARD.JANELA:
                global.cutscene_query = CUTSCENE.CUT_PRINCESA_JANELA;
            break;
        }

        global.card = -1;

    }
)

];


//======================================================
// PRÍNCIPE CHEGOU
//======================================================

Dialogo_Principe = [

Texto(
    "Miguel",
    spr_text_box_idoso,
    "Se o príncipe chegou ao castelo..."
),

Texto(
    "Miguel",
    spr_text_box_idoso,
    "A princesa decide *",
    [CARD.ABRACAR, CARD.MATAR, CARD.PORTA],
    function(){

        switch(global.card.id)
        {
            case CARD.ABRACAR:
                global.cutscene_query = CUTSCENE.CUT_PABRACAR;
            break;

            case CARD.MATAR:
                global.cutscene_query = CUTSCENE.CUT_PMATAR;
            break;

            case CARD.PORTA:
                global.cutscene_query = CUTSCENE.CUT_PPORTA;
            break;
        }

        global.card = -1;

    }
)

];


//======================================================
// PORTA
//======================================================

Dialogo_Princesa_Porta = [

Texto(
    "Miguel",
    spr_text_box_idoso,
    "Embora a porta sempre estivesse ali para ser aberta, a princesa nunca ousou abrir ela. Mas ao lado de seu salvador, se sentiu mais confiante."
),

Texto(
    "Miguel",
    spr_text_box_idoso,
    "Logo o príncipe arrombou a porta, e não foi muito agradável o que encontraram..."
),

Texto(
    "Miguel",
    spr_text_box_idoso,
    "Um grande * surgiu em sua frente.",
    [CARD.REI, CARD.BOM, CARD.MALIGNO, CARD.SAPO],
    function(){

        switch(global.card.id)
        {
            case CARD.REI:
                global.cutscene_query = CUTSCENE.CUT_PREI;
            break;

            case CARD.BOM:
                global.cutscene_query = CUTSCENE.CUT_PMGBOM;
            break;

            case CARD.MALIGNO:
                global.cutscene_query = CUTSCENE.CUT_PMGMAL;
            break;

            case CARD.SAPO:
                global.cutscene_query = CUTSCENE.CUT_PSAPO;
            break;
        }

        global.card = -1;

    }
)

];


//======================================================
// FINAIS
//======================================================

Dialogo_Abracar = [

Texto(
    "Miguel",
    spr_text_box_idoso,
    "A princesa correu aos braços fortes de seu salvador, e da mesma forma na qual o príncipe veio a subir a torre, os dois desceram juntos."
)

];

Dialogo_Matar = [

Texto(
    "Miguel",
    spr_text_box_idoso,
    "A princesa associou a imagem do príncipe a um caçador que queria seu coração, e o empurrou da torre."
),

Texto(
    "Miguel",
    spr_text_box_idoso,
    "Pelo menos ela conseguiu descer da torre pela janela."
)

];

Dialogo_Princesa_Janela = [

Texto(
    "Miguel",
    spr_text_box_idoso,
    "A princesa decidiu que não precisaria de um príncipe para salvá-la. Afinal, ela era muito responsável sobre suas próprias decisões."
)

];

Dialogo_PRei = [

Texto(
    "Miguel",
    spr_text_box_idoso,
    "Era o próprio rei! Pai da princesa. Os dois voltaram para casa em segurança."
)

];

Dialogo_PMgBom = [

Texto(
    "Miguel",
    spr_text_box_idoso,
    "Era um mago bom. Ele compreendeu a situação e teletransportou os dois de volta ao castelo."
)

];

Dialogo_PMgMal = [

Texto(
    "Miguel",
    spr_text_box_idoso,
    "Era um mago maligno. Ao ver os dois tentando fugir, desintegrou ambos com sua magia."
)

];

Dialogo_PSapo = [

Texto(
    "Miguel",
    spr_text_box_idoso,
    "O sapo abriu sua enorme boca e engoliu o príncipe. Enquanto isso, a princesa conseguiu fugir."
)

];
// ===============================

global.dialogues = [
    Dialogo_Floresta,
    Dialogo_Torre,
    Dialogo_Porta,
    Dialogo_Janela,
    Dialogo_Escuridao,
    Dialogo_Luz,
    Dialogo_Casa
];
