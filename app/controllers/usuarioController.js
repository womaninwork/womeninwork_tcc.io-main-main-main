const usuario = require("../models/usuarioModel");
const { body, validationResult } = require("express-validator");
const { criptografarSenha, compararSenha } = require("../util/criptografia");
const { enviarEmail } = require("../util/email");

const usuarioController = {

  regrasValidacaoFormLogin: [
    body("nome_usu")
      .isLength({ min: 8, max: 45 })
      .withMessage("O nome de usuário/e-mail deve ter de 8 a 45 caracteres"),
    body("senha_usu")
      .isStrongPassword()
      .withMessage("A senha deve ter no mínimo 8 caracteres (mínimo 1 letra maiúscula, 1 caractere especial e 1 número)")
  ],

  regrasValidacaoFormCad: [
    body("email_usuario")
      .isLength({ min: 5, max: 35 }).withMessage("O nome de usuário/e-mail deve ter de 5 a 35 caracteres"),
    body("nome_usuario")
      .isLength({ min: 8, max: 45 }).withMessage("Nome de usuário deve ter de 8 a 45 caracteres!")
      .custom(async value => {
        const nomeUsu = await usuario.findCampoCustom({ 'nome_usuario': value });
        if (nomeUsu > 0) {
          throw new Error('Nome de usuário em uso!');
        }
      }),
    body("email_usuario")
      .isEmail().withMessage("Digite um e-mail válido!")
      .custom(async value => {
        const emailUsu = await usuario.findCampoCustom({ 'email_usuario': value });
        if (emailUsu > 0) {
          throw new Error('E-mail em uso!');
        }
      })
  ],

  regrasValidacaoPerfil: [
    body("nome_usu")
      .isLength({ min: 3, max: 45 }).withMessage("Nome deve ter de 3 a 45 caracteres!"),
    body("nomeusu_usu")
      .isLength({ min: 8, max: 45 }).withMessage("Nome de usuário deve ter de 8 a 45 caracteres!"),
    body("email_usu")
      .isEmail().withMessage("Digite um e-mail válido!"),
    body("fone_usu")
      .isLength({ min: 12, max: 15 }).withMessage("Digite um telefone válido!"),
    body("cep")
      .isPostalCode('BR').withMessage("Digite um CEP válido!"),
    body("numero")
      .isNumeric().withMessage("Digite um número para o endereço!"),
    verificarUsuAutorizado([1, 2, 3], "pages/restrito"),
  ],

  regrasValidacaoFormRecSenha: [
    body("email_usu")
      .isEmail()
      .withMessage("Digite um e-mail válido!")
      .custom(async (value) => {
        const nomeUsu = await usuario.findCampoCustom({ email_usuario: value });
        if (nomeUsu == 0) {
          throw new Error("E-mail não encontrado");
        }
      }),
  ],


  regrasValidacaoFormNovaSenha: [
    body("senha_usu")
      .isStrongPassword()
      .withMessage(
        "A senha deve ter no mínimo 8 caracteres (mínimo 1 letra maiúscula, 1 caractere especial e 1 número)"
      )
      .custom(async (value, { req }) => {
        if (value !== req.body.csenha_usu) {
          throw new Error("As senhas não são iguais!");
        }
      }),
    body("csenha_usu")
      .isStrongPassword()
      .withMessage(
        "A senha deve ter no mínimo 8 caracteres (mínimo 1 letra maiúscula, 1 caractere especial e 1 número)"
      ),
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

  cadastrar: async (req, res) => {
    // Coleta os erros de validação
    const erros = validationResult(req);

    // Cria o objeto de dados do formulário (sem criptografar a senha aqui)
    const dadosForm = {
      nome_usuario: req.body.nome_usuario,
      sobrenome_usuario: req.body.sobrenome_usuario,
      email_usuario: req.body.email_usuario,
      celular_usuario: req.body.celular_usuario,
      senha_usuario: req.body.senha_usuario,  // senha será criptografada no model
    };

    // Verifica se há erros de validação
    if (!erros.isEmpty()) {
      // Remove a senha do formulário ao reenviar os dados para evitar expor senhas no front-end
      const { senha_usuario, confirmPassword, ...safeForm } = req.body;
      return res.render("pages/cadastro", {
        listaErros: erros.array(),
        dadosNotificacao: null,
        valores: safeForm // envia o formulário sem a senha
      });
    }

    try {
      // Chama o model para criar o novo usuário
      await usuario.create(dadosForm);

      res.render("pages/cadastro", {
        listaErros: null,
        dadosNotificacao: {
          titulo: "Cadastro realizado!",
          mensagem: "Novo usuário criado com sucesso!",
          tipo: "success"
        },
        valores: {}  // Limpa os campos após o sucesso
      });
    } catch (e) {
      console.error(e);
      // Renderiza a página com erro caso haja algum problema na criação
      res.render("pages/cadastro", {
        listaErros: null,
        dadosNotificacao: {
          titulo: "Erro ao cadastrar",
          mensagem: "Ocorreu um erro ao criar o usuário. Tente novamente mais tarde.",
          tipo: "danger"
        },
        valores: req.body // Retorna os valores do formulário
      });
    }
  },
  cadastrarCurso: async (req, res) => {
    // Coleta os erros de validação


    // Cria o objeto de dados do formulário (sem criptografar a senha aqui)
    const dadosForm = {
      nome_curso: req.body.nome_curso,
      descricao_cursos: req.body.descricao_cursos,
      categoria_curso: req.body.categoria_curso,
      duraco_curso: req.body.duraco_curso,
      preco_curso: req.body.preco_curso,
      image: req.body.image,  // senha será criptografada no model
    };
    console.log(dadosForm);

    try {
      // Chama o model para criar o novo usuário
      let resultado = await usuario.createCurso(dadosForm);
      console.log(resultado);
      res.render("pages/cursos", {
        listaErros: null,
        dadosNotificacao: {
          titulo: "Cadastro de curso realizado!",
          mensagem: "Novo curso criado com sucesso!",
          tipo: "success"
        },
        valores: {}  // Limpa os campos após o sucesso
      });
    } catch (e) {
      console.error(e);
      // Renderiza a página com erro caso haja algum problema na criação
      res.render("pages/cadastro", {
        listaErros: null,
        dadosNotificacao: {
          titulo: "Erro ao cadastrar",
          mensagem: "Ocorreu um erro ao criar o usuário. Tente novamente mais tarde.",
          tipo: "danger"
        },
        valores: req.body // Retorna os valores do formulário
      });
    }
  }
}


module.exports = { usuarioController }