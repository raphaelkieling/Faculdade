<?php
use Slim\Http\Request;
use Slim\Http\Response;
// Routes

$app->get('/comentario/post/{id}', function (Request $request, Response $response) {
    $id = $request->getAttribute('id');
    $sql = "SELECT * FROM comentario where codPost= $id order by idComentario desc";
    //pega do banco
    $dbO = new Db();
    $stmt = $dbO->query($sql);
    $comentarios = $stmt->fetchAll(PDO::FETCH_OBJ);

    return $response->withStatus(200)->withJson($comentarios);
});


$app->post('/comentario', function (Request $request, Response $response) {
    $body = json_decode($request->getBody());
    $valid = new Utils();
    $valid = $valid->validate($body, ["texto","codPost"]);

    if (!$valid) {
        return $response->withStatus(400);
    }

    $sql = "INSERT INTO comentario SET texto='$body->texto' , codPost=$body->codPost;";

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