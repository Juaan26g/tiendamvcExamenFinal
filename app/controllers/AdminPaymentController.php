<?php

class AdminPaymentController extends Controller
{
    private $model;

    public function __construct()
    {
        $this->model = $this->model('AdminPayment');
    }

    public function index()
    {
        $session = new Session();

        if ($session->getLogin()) {

            $payments = $this->model->getPayments();

            $data = [
                'titulo' => 'Administración de Metodos de pago',
                'menu' => false,
                'admin' => true,
                'payments' => $payments,
            ];

            $this->view('admin/payments/index', $data);
        } else {
            header('LOCATION:' . ROOT . 'admin');
        }
    }

    public function update($id)
    {
        $errors = [];
        $dataForm = [];
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $name = Validate::text($_POST['name'] ?? '');

            // Validamos la información
            if (empty($name)) {
                array_push($errors, 'El nombre del producto es requerido');
            }
            

            // Creamos el array de datos
            $dataForm = [
                'id' => $id,
                'name'  => $name,
            ];

            if (!$errors) {

                if (count($this->model->updatePayment($dataForm)) == 0) {

                    header('location:' . ROOT . 'AdminPayment');
                }
                array_push($errors, 'Se ha producido un error en la inserción en la BD');
            }
        }

        $payment = $this->model->getPaymentsById($id);

        $data = [
            'titulo' => 'Administración de Productos - Edición',
            'menu' => false,
            'admin' => true,
            'errors' => $errors,
            'data' => $payment,
        ];

        $this->view('admin/payments/update', $data);
    }
    public function create()
    {
        $errors = [];
        $dataForm = [];

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $name = Validate::text($_POST['name'] ?? '');

            if (empty($name)) {
                array_push($errors, 'El nombre es requerido');
            }
        
        
        $dataForm = [
            'name'  => $name,
        ];

        if (!$errors) {

            if ($this->model->createPayment($dataForm)) {

                header('location:' . ROOT . 'AdminPayment');
            }
            array_push($errors, 'Se ha producido un error en la inserción en la BD');
        }
    }
        $data = [
            'errors' => $errors,
            'titulo' => 'Administración de Metodos de pago',
            'menu' => false,
            'admin' => true,
            'errors' => $errors,
            'data' => $dataForm,
        ];

        $this->view('admin/payments/create', $data);
    }


    public function delete($id)
    {
        $errors = [];

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            $errors = $this->model->delete($id);

            if (empty($errors)) {
                header('location:' . ROOT . 'AdminPayment');
            }
        }

        $payment = $this->model->getPaymentsById($id);

        $data = [
            'titulo' => 'Administración de Metodos de Pagos - Eliminación',
            'menu' => false,
            'admin' => true,
            'errors' => $errors,
            'data' => $payment,
        ];
        $this->view('admin/payments/delete', $data);
    }
}
