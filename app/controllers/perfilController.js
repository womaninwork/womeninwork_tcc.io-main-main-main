// const usuario = require("../models/");
const { body, validationResult } = require("express-validator");
const bcrypt = require("bcryptjs");
var salt = bcrypt.genSaltSync(12);
 
const perfilController = {
        regrasValidacaoPerfil: [
            body("nome_usu")
            .isLength({ min: 3, max: 45}).withMessage("Nome deve ter de 3 a 45 caracteres!"),
            body("nomeusu_usu")
            .isLength({ min: 8, max: 45}).withMessage("Nome de usuário deve ter de 8 a 45 caracteres!"),
            body("email")
            .isEmail().withMessage("Digite um e-mail válido!"),
            body("fone_usu")
                .isLength({ min: 12, max: 15 }).withMessage("Digite um telefone válido!"),
            body("cep")
                .isPostalCode('BR').withMessage("Digite um CEP válido!"),
            body("numero")
                .isNumeric().withMessage("Digite um número para o endereço!"),
            verificarUsuAutorizado([1, 2, 3], "pages/restrito"),
        ],
    
        logar: (req, res) => {
            const erros = validationResult(req);
            if (!erros.isEmpty()) {
                return res.render("pages/login", { listaErros: erros, dadosNotificacao: null })
            }
            if (req.session.autenticado.autenticado != null) {
                res.redirect("/");
            } else {
                res.render("pages/login", {
                    listaErros: null,
                    dadosNotificacao: { titulo: "Falha ao logar!", mensagem: "Usuário e/ou senha inválidos!", tipo: "error" }
                })
            }
        },
    
    
        cadastrar: (req, res) => {
            const erros = validationResult(req);
            var dadosForm = {
                user_usuario: req.body.nomeusu_usu,
                senha_usuario: bcrypt.hashSync(req.body.senha_usu, salt),
                nome_usuario: req.body.nome_usu,
                email_usuario: req.body.email_usu,
            };
            if (!erros.isEmpty()) {
                return res.render("pages/cadastro", { listaErros: erros, dadosNotificacao: null, valores: req.body })
            }
            try {
                let create = usuario.create(dadosForm);
                res.render("pages/cadastro", {
                    listaErros: null, dadosNotificacao: {
                        titulo: "Cadastro realizado!", mensagem: "Novo usuário criado com sucesso!", tipo: "success"
                    }, valores: req.body
                })
            } catch (e) {
                console.log(e);
                res.render("pages/cadastro", {
                    listaErros: erros, dadosNotificacao: {
                        titulo: "Erro ao cadastrar!", mensagem: "Verifique os valores digitados!", tipo: "error"
                    }, valores: req.body
                })
            }
        },
    
    
        mostrarPerfil: async (req, res) => {
            try {
                let results = await usuario.findId(req.session.autenticado.id);
                if (results[0].cep_usuario != null) {
                    const httpsAgent = new https.Agent({
                        rejectUnauthorized: false,
                    });
                    const response = await fetch(`https://viacep.com.br/ws/${results[0].cep_usuario}/json/`,
                        { method: 'GET', headers: null, body: null, agent: httpsAgent, });
                    var viaCep = await response.json();
                    var cep = results[0].cep_usuario.slice(0,5)+ "-"+results[0].cep_usuario.slice(5)
                }else{
                    var viaCep = {logradouro:"", bairro:"", localidade:"", uf:""}
                    var cep = null;
                }
    
                let campos = {
                    nome_usu: results[0].nome_usuario, email_usu: results[0].email_usuario,
                    cep:  cep, 
                    numero: results[0].numero_usuario,
                    complemento: results[0].complemento_usuario, logradouro: viaCep.logradouro,
                    bairro: viaCep.bairro, localidade: viaCep.localidade, uf: viaCep.uf,
                    img_perfil_pasta: results[0].img_perfil_pasta,
                    img_perfil_banco: results[0].img_perfil_banco != null ? `data:image/jpeg;base64,${results[0].img_perfil_banco.toString('base64')}` : null,
                    nomeusu_usu: results[0].user_usuario, fone_usu: results[0].fone_usuario, senha_usu: ""
                }
    
                res.render("pages/perfil", { listaErros: null, dadosNotificacao: null, valores: campos })
            } catch (e) {
                console.log(e);
                res.render("pages/perfil", {
                    listaErros: null, dadosNotificacao: null, valores: {
                        img_perfil_banco: "", img_perfil_pasta: "", nome_usu: "", email_usu: "",
                        nomeusu_usu: "", fone_usu: "", senha_usu: "", cep: "", numero: "", complemento: "",
                        logradouro: "", bairro: "", localidade: "", uf: ""
                    }
                })
            }
        },
    
        gravarPerfil: async (req, res) => {
    
            const erros = validationResult(req);
            const erroMulter = req.session.erroMulter;
            if (!erros.isEmpty() || erroMulter != null ) {
                lista =  !erros.isEmpty() ? erros : {formatter:null, errors:[]};
                if(erroMulter != null ){
                    lista.errors.push(erroMulter);
                } 
                return res.render("pages/perfil", { listaErros: lista, dadosNotificacao: null, valores: req.body })
            }
            try {
                var dadosForm = {
                    user_usuario: req.body.nomeusu_usu,
                    nome_usuario: req.body.nome_usu,
                    email_usuario: req.body.email_usu,
                    fone_usuario: req.body.fone_usu,
                    cep_usuario: req.body.cep.replace("-",""),
                    numero_usuario: req.body.numero,
                    complemento_usuario: req.body.complemento,
                    img_perfil_banco: req.session.autenticado.img_perfil_banco,
                    img_perfil_pasta: req.session.autenticado.img_perfil_pasta,
                };
                if (req.body.senha_usu != "") {
                    dadosForm.senha_usuario = bcrypt.hashSync(req.body.senha_usu, salt);
                }
                if (!req.file) {
                    console.log("Falha no carregamento");
                } else {
                    //Armazenando o caminho do arquivo salvo na pasta do projeto 
                    caminhoArquivo = "imagem/perfil/" + req.file.filename;
                    //Se houve alteração de imagem de perfil apaga a imagem anterior
                    if(dadosForm.img_perfil_pasta != caminhoArquivo ){
                        removeImg(dadosForm.img_perfil_pasta);
                    }
                    dadosForm.img_perfil_pasta = caminhoArquivo;
                    dadosForm.img_perfil_banco = null;
    
                    // //Armazenando o buffer de dados binários do arquivo 
                    // dadosForm.img_perfil_banco = req.file.buffer;                
                    // //Apagando a imagem armazenada na pasta
                    // if(dadosForm.img_perfil_pasta != null ){
                    //     removeImg(dadosForm.img_perfil_pasta);
                    // }
                    // dadosForm.img_perfil_pasta = null; 
                }
                let resultUpdate = await usuario.update(dadosForm, req.session.autenticado.id);
                if (!resultUpdate.isEmpty) {
                    if (resultUpdate.changedRows == 1) {
                        var result = await usuario.findId(req.session.autenticado.id);
                        var autenticado = {
                            autenticado: result[0].nome_usuario,
                            id: result[0].id_usuario,
                            tipo: result[0].id_tipo_usuario,
                            img_perfil_banco: result[0].img_perfil_banco != null ? `data:image/jpeg;base64,${result[0].img_perfil_banco.toString('base64')}` : null,
                            img_perfil_pasta: result[0].img_perfil_pasta
                        };
                        req.session.autenticado = autenticado;
                        var campos = {
                            nome_usu: result[0].nome_usuario, email_usu: result[0].email_usuario,
                            img_perfil_pasta: result[0].img_perfil_pasta, img_perfil_banco: result[0].img_perfil_banco,
                            nomeusu_usu: result[0].user_usuario, fone_usu: result[0].fone_usuario, senha_usu: ""
                        }
                        res.render("pages/perfil", { listaErros: null, dadosNotificacao: { titulo: "Perfil! atualizado com sucesso", mensagem: "Alterações Gravadas", tipo: "success" }, valores: campos });
                    }else{
                        res.render("pages/perfil", { listaErros: null, dadosNotificacao: { titulo: "Perfil! atualizado com sucesso", mensagem: "Sem alterações", tipo: "success" }, valores: dadosForm });
                    }
                }
            } catch (e) {
                console.log(e)
                res.render("pages/perfil", { listaErros: erros, dadosNotificacao: { titulo: "Erro ao atualizar o perfil!", mensagem: "Verifique os valores digitados!", tipo: "error" }, valores: req.body })
            }
        }
    }
    
    module.exports = {perfilController}
        
