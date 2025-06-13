<?php
require_once __DIR__ . '/vendor/autoload.php';
// ...restante do código...
use src\Routes\Routes;
use src\Controllers\AlunoController;

$routes = new Routes();
$routes->add('POST', 'api/aluno', [new AlunoController(), 'criar']);
$routes->add('GET', '/hello', [new AlunoController(), 'hello']);
$routes->add('GET', 'aluno/cadastro',[new AlunoController(), 'mostrarFormulario']);


$routes->add('GET', 'aluno/cadastro/', [new AlunoController(), 'mostrarFormulario']);
?>