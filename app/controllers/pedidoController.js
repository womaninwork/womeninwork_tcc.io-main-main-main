const {pedidoModel } = require("../models/pedidoModel");

const pedidoController = {

    gravarPedido: async (req, res) => {
        try {
            const carrinho = req.session.carrinho;
            const camposJsonPedido = {
                pagamento_data: moment().format("YYYY-MM-DD HH:mm:ss"),
                status_mp: req.query.status,
                valor_pagamento: req.query.payment_id
            }
            //const alunocurso={
               // usuario_id_usuario: req.session.autenticado.id,
               // cursos_id_cursos: 
               // pagamento_id_pagamento
            //}
            var create = await pedidoModel.createPedido(camposJsonPedido);
            carrinho.forEach(async element => {
                camposJsonItemPedido = {
                    pedido_id_pedido: create.insertId,
                    hq_id_hq: element.codproduto,
                    quantidade: element.qtde
                }
                await pedidoModel.createItemPedido(camposJsonItemPedido);
            });
            req.session.carrinho = [];
            res.redirect("/");
        } catch (e) {
            console.log(e);
        }
    }
    
}

module.exports = {pedidoController}