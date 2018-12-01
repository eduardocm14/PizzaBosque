-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.0.21-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para pizzaria
CREATE DATABASE IF NOT EXISTS `pizzaria` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pizzaria`;

-- Copiando estrutura para tabela pizzaria.caixas
CREATE TABLE IF NOT EXISTS `caixas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pizzaria.caixas: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `caixas` DISABLE KEYS */;
INSERT INTO `caixas` (`id`, `descricao`) VALUES
	(1, 'Caixa Noite - 1'),
	(2, 'Caixa tarde - 2');
/*!40000 ALTER TABLE `caixas` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzaria.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `fone` varchar(10) DEFAULT NULL,
  `cel` varchar(10) DEFAULT NULL,
  `cidade` varchar(60) DEFAULT NULL,
  `bairro` varchar(60) DEFAULT NULL,
  `rua` varchar(60) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `ativo` char(1) DEFAULT 'S' COMMENT 'S=Sim/N=Não',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pizzaria.clientes: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id`, `nome`, `fone`, `cel`, `cidade`, `bairro`, `rua`, `cep`, `complemento`, `numero`, `ativo`) VALUES
	(1, 'Eduardo Moraes', '30195456', '998641090', 'Porto Alegre - RS', 'Protásio Alves', 'Rua Tenente Ary Tarrago', '91225000', 'Complemento de teste', 520, 'S'),
	(2, 'Daiana Viana', '30195456', '989898989', 'Porto Alegre - RS', 'Menino Deus', 'Rua Beck', '90130030', 'Perto do Beira RIo', 110, 'S'),
	(3, 'Gabriel Moraes', '30303030', '99999999', 'Porto Alegre - RS', 'Protásio Alves', 'Rua Tenente Ary Tarrago', '91225000', 'Bloco:25/ Aptp:415', 520, 'S'),
	(4, 'Vera Lucia', '3232323', '9191199191', 'Porto Alegre - RS', 'Menino Deus', 'Rua Barão do Triunfo', '90130100', 'Casa fundos', 100, 'S');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzaria.empresa
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razao` varchar(100) NOT NULL DEFAULT '0',
  `fantasia` varchar(100) NOT NULL DEFAULT '0',
  `cnpj` varchar(14) NOT NULL DEFAULT '0',
  `ie` varchar(9) NOT NULL DEFAULT '0',
  `fone1` varchar(10) NOT NULL DEFAULT '0',
  `fone2` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pizzaria.empresa: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` (`id`, `razao`, `fantasia`, `cnpj`, `ie`, `fone1`, `fone2`) VALUES
	(1, 'PIZZARIA DE TESTE', 'PIZZARIA DO BOSQUE', '11111111111111', '111111111', '0', '0');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzaria.entregadores
CREATE TABLE IF NOT EXISTS `entregadores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pizzaria.entregadores: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `entregadores` DISABLE KEYS */;
INSERT INTO `entregadores` (`id`, `descricao`) VALUES
	(1, 'Entregador1'),
	(2, 'Entregador2');
/*!40000 ALTER TABLE `entregadores` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzaria.formaspgto
CREATE TABLE IF NOT EXISTS `formaspgto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pizzaria.formaspgto: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `formaspgto` DISABLE KEYS */;
INSERT INTO `formaspgto` (`id`, `descricao`) VALUES
	(1, 'Dinheiro'),
	(2, 'Cartão Visa Débito'),
	(3, 'Cartão Visa Crédito'),
	(4, 'Cartão Master Débito'),
	(5, 'Cartão Master Crédito'),
	(6, 'Refeisul - Banri');
/*!40000 ALTER TABLE `formaspgto` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzaria.movcaixas
CREATE TABLE IF NOT EXISTS `movcaixas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caixa` int(11) NOT NULL,
  `data_abert` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuario_abert` int(11) NOT NULL,
  `valor_abert` decimal(10,2) NOT NULL,
  `data_fech` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `usuario_fech` int(11) NOT NULL DEFAULT '-1',
  `valor_fech` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` char(1) NOT NULL DEFAULT 'A' COMMENT 'A = Aberto/F = Fechado',
  PRIMARY KEY (`id`),
  KEY `FK_caixa_usuarios` (`usuario_abert`),
  KEY `FK_abrecaixa_caixa` (`caixa`),
  CONSTRAINT `FK_abrecaixa_caixa` FOREIGN KEY (`caixa`) REFERENCES `caixas` (`id`),
  CONSTRAINT `FK_caixa_usuarios` FOREIGN KEY (`usuario_abert`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pizzaria.movcaixas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `movcaixas` DISABLE KEYS */;
/*!40000 ALTER TABLE `movcaixas` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzaria.produtos
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(80) DEFAULT NULL,
  `cm` int(11) DEFAULT NULL,
  `fatias` int(11) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT '0.00',
  `tipo` char(1) DEFAULT NULL COMMENT 'P=Pizza / B=Bebida',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pizzaria.produtos: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`id`, `descricao`, `cm`, `fatias`, `valor`, `tipo`) VALUES
	(1, 'Familia', 45, 20, 55.00, 'P'),
	(2, 'Média', 30, 10, 35.00, 'P'),
	(3, 'Pequena', 20, 10, 26.50, 'P'),
	(4, 'Coca - Cola(2 Litros)', NULL, NULL, 8.00, 'B'),
	(5, 'Guarana(2 Litros)', NULL, NULL, 6.50, 'B');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzaria.sabores
CREATE TABLE IF NOT EXISTS `sabores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(80) DEFAULT NULL,
  `especial` char(1) DEFAULT 'N' COMMENT 'N=Não/S=Sim',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pizzaria.sabores: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `sabores` DISABLE KEYS */;
INSERT INTO `sabores` (`id`, `descricao`, `especial`) VALUES
	(1, 'Calabresa', 'N'),
	(2, 'Quatro Queijos', 'N'),
	(3, 'Bacon', 'N'),
	(4, 'Frango com catupiry', 'N'),
	(5, 'Muçarela', 'N'),
	(6, 'Palmito', 'N'),
	(7, 'Napolitana', 'N');
/*!40000 ALTER TABLE `sabores` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzaria.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT '0',
  `usuario` varchar(30) DEFAULT '0',
  `senha` varchar(30) DEFAULT '0',
  `nivel` int(11) DEFAULT '1' COMMENT '0-Adm / 1-Operador',
  `ativo` int(11) DEFAULT '1' COMMENT '0-Não / 1-Sim',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pizzaria.usuarios: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nome`, `usuario`, `senha`, `nivel`, `ativo`) VALUES
	(1, 'Administrador', 'admin', '#admin@2017#', 0, 1),
	(2, 'Eduardo Moraes', 'eduardo', '1234', 1, 1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzaria.vendas
CREATE TABLE IF NOT EXISTS `vendas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numcaixa` int(11) NOT NULL,
  `codusuario` int(11) NOT NULL DEFAULT '0',
  `codcliente` int(11) NOT NULL,
  `codentregador` int(11) DEFAULT NULL,
  `data` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL DEFAULT 'V' COMMENT 'V=Venda/C=Cancelado',
  PRIMARY KEY (`id`),
  KEY `FK_vendas_usuarios` (`codusuario`),
  KEY `FK_vendas_clientes` (`codcliente`),
  KEY `FK_vendas_entregadores` (`codentregador`),
  KEY `FK_vendas_caixas` (`numcaixa`),
  CONSTRAINT `FK_vendas_caixas` FOREIGN KEY (`numcaixa`) REFERENCES `movcaixas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_vendas_clientes` FOREIGN KEY (`codcliente`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_vendas_entregadores` FOREIGN KEY (`codentregador`) REFERENCES `entregadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_vendas_usuarios` FOREIGN KEY (`codusuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pizzaria.vendas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzaria.vendasformapgto
CREATE TABLE IF NOT EXISTS `vendasformapgto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numvenda` int(11) DEFAULT '0',
  `codformapgto` int(11) DEFAULT '0',
  `valor` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `FK_vendasformapgto_vendas` (`numvenda`),
  KEY `FK_vendasformapgto_formaspgto` (`codformapgto`),
  CONSTRAINT `FK_vendasformapgto_formaspgto` FOREIGN KEY (`codformapgto`) REFERENCES `formaspgto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_vendasformapgto_vendas` FOREIGN KEY (`numvenda`) REFERENCES `vendas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pizzaria.vendasformapgto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vendasformapgto` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendasformapgto` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzaria.vendaspizzasabores
CREATE TABLE IF NOT EXISTS `vendaspizzasabores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numvenda` int(11) DEFAULT '0',
  `codproduto` int(11) DEFAULT '0',
  `codsabor` int(11) DEFAULT '0',
  `ordem` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_vendastipopizzasabores_tipopizzas` (`codproduto`),
  KEY `FK_vendastipopizzasabores_sabores` (`codsabor`),
  KEY `FK_vendastipopizzasabores_vendas` (`numvenda`),
  CONSTRAINT `FK_vendastipopizzasabores_sabores` FOREIGN KEY (`codsabor`) REFERENCES `sabores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_vendastipopizzasabores_tipopizzas` FOREIGN KEY (`codproduto`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_vendastipopizzasabores_vendas` FOREIGN KEY (`numvenda`) REFERENCES `vendas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pizzaria.vendaspizzasabores: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vendaspizzasabores` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendaspizzasabores` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzaria.vendasprodutos
CREATE TABLE IF NOT EXISTS `vendasprodutos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numvenda` int(11) NOT NULL,
  `codproduto` int(11) NOT NULL,
  `ordem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_vendastipopizza_tipopizza` (`codproduto`),
  KEY `FK_vendastipopizza_vendas` (`numvenda`),
  CONSTRAINT `FK_vendasprodutos_produtos` FOREIGN KEY (`codproduto`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_vendasprodutos_vendas` FOREIGN KEY (`numvenda`) REFERENCES `vendas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela pizzaria.vendasprodutos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vendasprodutos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendasprodutos` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
