<!DOCTYPE html>
<html lang="es">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Alibiba</title>

<link href="<?php echo site_url() ?>assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<link href="<?php echo site_url() ?>assets/css/sb-admin-2.min.css" rel="stylesheet">
<link href="<?php echo site_url() ?>assets/css/style.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="row justify-content-center">

            <div class="col-xl-12 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Sistema de prestamos</h1>
                                    </div>
									<?php if ($this->session->flashdata('msg')): ?>
									<div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
									<?= $this->session->flashdata('msg') ?>
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									</div>
									<?php endif ?>
									<?php if(validation_errors()) { ?>
									<div class="alert alert-danger alert-dismissible fade show" role="alert">
									<?php echo validation_errors(); ?>
									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									</div>
									<?php } ?>
                                    <form class="user" action="<?php echo site_url('user/login'); ?>" method='post'>
                                        <div class="form-group">
										<input type="email" class="form-control form-control-user" name="email" placeholder="Ingresar Correo Electronico">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" name="password" placeholder="Ingrese la Contraseña">
                                        </div>
										<button type="submit" class="btn btn-primary btn-user btn-block"> Ingresar
										</button>
                                    </form>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <script src="<?php echo site_url() ?>assets/vendor/jquery/jquery.min.js"></script>
    <script src="<?php echo site_url() ?>assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
