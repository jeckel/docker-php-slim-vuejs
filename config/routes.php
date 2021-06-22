<?php

/**
 * @author: Julien Mercier-Rojas <julien@jeckel-lab.fr>
 * Created at: 22/06/2021
 */

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\App;

return static function (App $app) {
    $app->get('/', function (Request $request, Response $response) {
        $response->getBody()->write('<h1>Hello world!</h1>');
        return $response;
    });
};
