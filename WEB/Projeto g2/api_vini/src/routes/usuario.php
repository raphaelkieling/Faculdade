<?php
use Slim\Http\Request;
use Slim\Http\Response;

// Routes

$app->get('/usuario', function (Request $request, Response $response) {
	$sql = "SELECT * FROM usuario";
        //pega do banco
	$dbO = new Db();
	$stmt = $dbO->query($sql);
	$usuarios = $stmt->fetchAll(PDO::FETCH_OBJ);

	return $response->withStatus(200)->withJson($usuarios);
});

$app->get('/usuario/{id}', function (Request $request, Response $response) {
	$id = $request->getAttribute('id');

	$sql = "SELECT * FROM usuario where idUsuario = $id";
        //pega do banco
	$dbO = new Db();
	$stmt = $dbO->query($sql);
	$usuario = $stmt->fetchAll(PDO::FETCH_OBJ)[0];

	if ($usuario) {
		return $response->withStatus(200)->withJson($usuario);
	}
	return $response->withStatus(400);
});

$app->get('/usuario/{id}/sala', function (Request $request, Response $response) {
	$id = $request->getAttribute('id');

	$sql = "SELECT * FROM salatousuario inner join sala on sala.idSala = codSala where codUsuario = $id";
        //pega do banco
	$dbO = new Db();
	$stmt = $dbO->query($sql);
	$usuario = $stmt->fetchAll(PDO::FETCH_OBJ);

	return $response->withStatus(200)->withJson($usuario);
});

$app->post('/usuario', function (Request $request, Response $response) {
	$body = json_decode($request->getBody());
	$valid = new Utils();
	$valid = $valid->validate($body, ["nome", "senha", "idade", "tipo", "email"]);
	if (!$valid) {
		return $response->withStatus(400);
	}

	$sql = "INSERT INTO usuario(nome,senha,idade,tipo,email) values('$body->nome','$body->senha',$body->idade,'$body->tipo','$body->email');";
	$db = new Db();
	$stmt = $db->query($sql);

	if ($stmt) {
		return $response->withStatus(201);
	} else {
		return $response->withStatus(400);
	}
});

$app->post('/usuario/authenticate', function (Request $request, Response $response) {
	$body = json_decode($request->getBody());
	$valid = new Utils();
	$valid = $valid->validate($body, ["email", "senha"]);
	if (!$valid) {
		return $response->withStatus(400);
	}

	$sql = "SELECT * FROM usuario where email='$body->email' and senha='$body->senha'";
	$db = new Db();
	$stmt = $db->query($sql);
	$usuario = $stmt->fetchAll(PDO::FETCH_OBJ)[0];
	
	
	if ($usuario) {
		$usuario->senha = '****';
		return $response->withStatus(201)->withJson($usuario);
	} else {
		return $response->withStatus(400);
	}
});

$app->delete('/usuario/{id}', function (Request $request, Response $response) {
	$id = $request->getAttribute('id');
	if (!$id) {
		return $response->withStatus(400);
	}

	$sql = "DELETE FROM sala where idSala = $id";
	$db = new Db();
	$stmt = $db->query($sql);

	if ($stmt) {
		return $response->withStatus(200);
	} else {
		return $response->withStatus(400);
	}
});

$app->put('/usuario/{id}', function (Request $request, Response $response) {
	$body = json_decode($request->getBody());
	$id = $request->getAttribute('id');
	if (!$id) {
		return $response->withStatus(400);
	}

	$valid = new Utils();
	$valid = $valid->validate($body, ["nome", "senha", "idade", "tipo", "email"]);

	if (!$valid) {
		return $response->withStatus(400);
	}


	$sql = "UPDATE usuario SET nome='$body->nome', senha='$body->senha', idade=$body->idade, tipo='$body->tipo', email='$body->email' where idUsuario = $id";
	$db = new Db();
	$stmt = $db->query($sql);

	if ($stmt) {
		return $response->withStatus(200);
	} else {
		return $response->withStatus(400);
	}
});