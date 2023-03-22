<?php include_once(VIEWS . 'header.php') ?>
<div class="card p-4 bg-light">
    <div class="card-header">
        <h1 class="text-center">Edición de un metodo de pago</h1>
    </div>
    <div class="card-body">
        <form action="<?= ROOT ?>adminPayment/update/<?= $data['data']->id ?>" method="POST">
            <div class="form-group text-left">
                <label for="name">Usuario:</label>
                <input type="text" name="name" class="form-control" placeholder="Escribe tu nombre completo" required value="<?= $data['data']->name ?? '' ?>">
            </div>
            <div class="form-group text-left">
                <input type="submit" value="Enviar" class="btn btn-success">
                <a href="<?= ROOT ?>adminPayment" class="btn btn-info">Regresar</a>
            </div>
        </form>
    </div>
    <div class="card-footer">

    </div>
</div>
<?php include_once(VIEWS . 'footer.php') ?>