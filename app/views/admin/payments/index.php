<?php include_once(VIEWS . 'header.php') ?>
<div class="card p-4 bg-light">
    <div class="card-header">
        <h1 class="text-center">Administración de Pagos</h1>
    </div>
    <div class="card-body">
        <table class="table text-center" width="100%">
            <thead>
                <th>Id</th>
                <th>Modificar</th>
                <th>Borrar</th>
            </thead>
            <tbody>
                <?php foreach ($data['payments'] as $payment) : ?>
                    <tr>
                        <td class="text-center"><?= $payment->id ?></td>
                        <td class="text-center"><?= $payment->name ?></td>
                        <td class="text-center">
                            <a href="<?= ROOT ?>adminPayment/update/<?= $payment->id ?>" class="btn btn-info">Editar</a>
                        </td>
                        <td class="text-center">
                            <a href="<?= ROOT ?>adminPayment/delete/<?= $payment->id ?>" class="btn btn-danger">Borrar</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <div class="card-footer">
        <div class="row">
            <div class="col-sm-6">
                <a href="<?= ROOT ?>adminPayment/create" class="btn btn-success">
                    Añadir metodo de pago
                </a>
                <a href="<?= ROOT ?>adminShop" class="btn btn-info">Regresar</a>
            </div>
            <div class="col-sm-6">

            </div>
        </div>
    </div>

</div>
<?php include_once(VIEWS . 'footer.php') ?>