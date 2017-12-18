<?php
use Slim\Http\Request;
use Slim\Http\Response;
// Routes

$app->get('/post', function (Request $request, Response $response) {
    $sql = "SELECT * FROM post";
     //pega do banco
    $dbO = new Db();
    $stmt = $dbO->query($sql);
    $salas = $stmt->fetchAll(PDO::FETCH_OBJ);

    return $response->withStatus(200)->withJson($salas);
});

$app->get('/post/{id}', function (Request $request, Response $response) {
    $id = $request->getAttribute('id');

    $sql = "SELECT * FROM post where idPost = $id";
        //pega do banco
    $dbO = new Db();
    $stmt = $dbO->query($sql);
    $sala = $stmt->fetchAll(PDO::FETCH_OBJ)[0];

    if ($sala) {
        return $response->withStatus(200)->withJson($sala);
    }
    return $response->withStatus(400);
});

$app->get('/post/sala/{id}', function (Request $request, Response $response) {
    $id = $request->getAttribute('id');

    $sql = "SELECT * FROM post where codSala = $id order by idPost desc";
        //pega do banco
    $dbO = new Db();
    $stmt = $dbO->query($sql);
    $sala = $stmt->fetchAll(PDO::FETCH_OBJ);

    if ($sala) {
        return $response->withStatus(200)->withJson($sala);
    }
    return $response->withStatus(400);
});

$app->post('/post', function (Request $request, Response $response) {
    $body = json_decode($request->getBody());
    $valid = new Utils();
    $valid = $valid->validate($body, ["titulo","descricao","codUsuario","codSala"]);

    if (!$valid) {
        return $response->withStatus(400);
    }

    $sql = "INSERT INTO post SET titulo='$body->titulo' , descricao='$body->descricao' , codUsuario='$body->codUsuario' ,codSala='$body->codSala',imagemBase='$body->imagemBase'";
    $db = new Db();
    $stmt = $db->query($sql);

     if ($stmt) {
        $message = "Cadastrou com sucesso";
        return $response->withStatus(201)->withJson($message);
    } else {
        $message = "Falha no cadastro";
        return $response->withStatus(400)->withJson($message);
    }
});

$app->post('/post/entrar', function (Request $request, Response $response) {
    $body = json_decode($request->getBody());
    $valid = new Utils();
    $valid = $valid->validate($body, ["nomeSala", "codUsuario"]);
    $db = new Db();
    if (!$valid) {
        return $response->withStatus(400);
    }

    $sqlSala = "SELECT * FROM sala where nome = '$body->nomeSala'";
    $resultSala = $db->query($sqlSala);
    $sala = $resultSala->fetchAll(PDO::FETCH_OBJ)[0];
    $resultSalaToUsuario = null;

    if ($sala) {
        $sql = "INSERT INTO salatousuario SET codSala=$sala->idSala , codUsuario=$body->codUsuario ";
        $resultSalaToUsuario = $db->query($sql);
    }


    if ($resultSalaToUsuario) {
        return $response->withStatus(201)->withJson($sala);
    } else {
        return $response->withStatus(400);
    }
});

$app->delete('/post/{id}', function (Request $request, Response $response) {
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

$app->put('/post/{id}', function (Request $request, Response $response) {
    $body = json_decode($request->getBody());
    $id = $request->getAttribute('id');
    if (!$id) {
        return $response->withStatus(400);
    }

    $valid = new Utils();
    $valid = $valid->validate($body, ["nome"]);

    if (!$valid) {
        return $response->withStatus(400);
    }



    $sql = "UPDATE sala SET nome = '$body->nome' where idSala = $id";
    $db = new Db();
    $stmt = $db->query($sql);

    if ($stmt) {
        return $response->withStatus(200);
    } else {
        return $response->withStatus(400);
    }
});