<div class="content-wrapper" style="min-height: 717px;">

  <section class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1>HABITACIONES</h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="inicio">INICIO</a></li>
            <li class="breadcrumb-item active">HABITACIONES</li>
          </ol>
        </div>
      </div>
    </div>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <!-- Listado de habitaciones -->
        <div class="col-12 col-xl-5">
          <div class="card card-primary card-outline">
            <div class="card-header pl-2 pl-sm-3">
              <a href="habitaciones" class="btn btn-primary btn-lg">CREAR NUEVA HABITACION</a>
              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
              <table class="table table-bordered table-striped dt-responsive tablaHabitaciones" width="100%">
                <thead>
                  <tr>
                    <th style="width:10px">#</th>
                    <th>CATEGORIA</th>
                    <th>HABITACION</th>
                    <th style="width:10px">ACCIONES</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                  // Aquí se deben mostrar las habitaciones de la base de datos
                  $habitaciones = ControladorHabitaciones::ctrMostrarHabitaciones(null); // Asegúrate de que esta función devuelve los datos correctos
                  foreach ($habitaciones as $habitacion) {
                    echo '<tr>';
                    echo '<td>' . $habitacion['id_h'] . '</td>';
                    echo '<td>' . $habitacion['tipo'] . '</td>';
                    echo '<td>' . $habitacion['estilo'] . '</td>';
                    echo '<td><a href="default.php?pagina=habitaciones&id_h=' . $habitacion['id_h'] . '" class="btn btn-success"><i class="far fa-eye"></i></a></td>';
                    echo '</tr>';
                  }
                  ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <!-- Editor de habitaciones -->
        <?php
        if (isset($_GET["id_h"])) {
          $habitacion = ControladorHabitaciones::ctrMostrarhabitaciones($_GET["id_h"]);
        } else {
          $habitacion = null;
        }
        ?>


        <div class="col-12 col-xl-7">
          <div class="card card-primary card-outline">
            <div class="card-header">
              <h5 class="card-title text-uppercase">
                <?php
                echo isset($habitacion["tipo"]) ? $habitacion["tipo"] : "Tipo no definido";
                echo " / ";
                echo isset($habitacion["estilo"]) ? $habitacion["estilo"] : "Estilo no definido";
                ?>
              </h5>
              <div class="preload"></div>
              <div class="card-tools">
                <button type="button" class="btn btn-info guardarHabitacion">
                  <i class="fas fa-save"></i>
                </button>

                <?php
                if ($habitacion != null) {
                  $galeria = isset($habitacion["galeria"]) ? json_decode($habitacion["galeria"], true) : [];
                  if (is_array($galeria)) {
                    echo '<button type="button" class="btn btn-danger eliminarHabitacion" idEliminar="' . $habitacion["id_h"] . '" galeriaHabitacion="' . implode(",", $galeria) . '" recorridoHabitacion="' . $habitacion["recorrido_virtual"] . '">
                  <i class="fas fa-trash"></i> 
                </button>';
                  }
                }
                ?>
              </div>
            </div>

            <div class="card-body">
              <input type="hidden" class="idHabitacion" value="<?php echo $habitacion["id_h"] ?? ''; ?>">

              <!-- Categoría y nombre de la habitación -->
              <div class="d-flex flex-column flex-md-row justify-content-start mb-3">
                <div class="form-inline mx-3 px-3 border border-left-0 border-top-0 border-bottom-0">
                  <p class="mr-sm-2"><strong>ELIJE LA CATEGORIA:</strong></p>
                  <?php
                  if ($habitacion != null) {
                    echo '<select class="form-control seleccionarTipo text-uppercase" readonly>
                <option value="' . $habitacion["id"] . ',' . $habitacion["tipo"] . '">' . $habitacion["tipo"] . '</option>
               </select>';
                  } else {
                    echo '<select class="form-control seleccionarTipo text-uppercase">
                 <option value="">Seleccione</option>';
                    $categorias = ControladorCategorias::ctrMostrarCategorias(null, null);
                    foreach ($categorias as $key => $value) {
                      echo '<option value="' . $value["id"] . ',' . $value["tipo"] . '">' . $value["tipo"] . '</option>';
                    }
                    echo '</select>';
                  }
                  ?>
                </div>

                <div class="form-inline">
                  <p class="mr-sm-2"><strong>ESCRIBE EL NOMBRE DE LA HABITACION:</strong></p>
                  <input type="text" class="form-control seleccionarEstilo text-uppercase" value="<?php echo $habitacion["estilo"] ?? ''; ?>" <?php echo ($habitacion != null) ? 'readonly' : ''; ?>>
                </div>
              </div>

              <!-- Galería -->
              <div class="card rounded-lg card-danger card-outline">
                <div class="card-header pl-2 pl-sm-3">
                  <h5><strong>GALERIA:</strong></h5>
                </div>
                <div class="card-body">
                  <ul class="row p-0 vistaGaleria">
                    <?php
                    if ($habitacion != null) {
                      $galeria = json_decode($habitacion["galeria"], true);
                      foreach ($galeria as $key => $value) {
                        echo '<li class="col-12 col-md-6 col-lg-3 card px-3 rounded-0 shadow-none">
                        <img class="card-img-top" src="' . $value . '">
                        <div class="card-img-overlay p-0 pr-3">
                          <button class="btn btn-danger float-right shadow-sm quitarFotoAntigua" temporal="' . $value . '">
                            <i class="fas fa-trash"></i>
                          </button>
                        </div>
                      </li>';
                      }
                    }
                    ?>
                  </ul>
                </div>

                <input type="hidden" class="inputNuevaGaleria">
                <input type="hidden" class="inputAntiguaGaleria" value="<?php echo isset($galeria) ? implode(",", $galeria) : ''; ?>">

                <div class="card-footer">
                  <input type="file" multiple id="galeria" class="d-none">
                  <label for="galeria" class="text-dark text-center py-5 border rounded bg-white w-100 subirGaleria">
                    HAS CLIC AQUÍ O ARRASTRA LAS IMAGENES <br>
                    <span class="help-block small">Dimensiones: 940px * 480px | Peso Max. 2MB | Formato: JPG o PNG</span>
                  </label>
                </div>
              </div>

              <!-- Vídeo y 360° -->
              <div class="row">
                <div class="col-12 col-xl-6">
                  <div class="card rounded-lg card-success card-outline">
                    <div class="card-header pl-2 pl-sm-3">
                      <h5><strong>VIDEO:</strong></h5>
                    </div>
                    <div class="card-body vistaVideo">
                      <?php if ($habitacion != null && isset($habitacion["video"])): ?>
                        <iframe width="100%" height="320" src="https://www.youtube.com/embed/<?php echo $habitacion["video"]; ?>" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                      <?php endif ?>
                    </div>
                    <div class="card-footer">
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="p-2 bg-warning rounded-left small">youtube.com/embed/</span>
                        </div>
                        <input type="text" class="form-control agregarVideo" placeholder="Agregue el código del vídeo" value="<?php echo $habitacion["video"] ?? ''; ?>">
                      </div>
                    </div>
                  </div>
                </div>

                <div class="col-12 col-xl-6">
                  <div class="card rounded-lg card-primary card-outline">
                    <div class="card-header pl-2 pl-sm-3">
                      <h5><strong>360°:</strong></h5>
                    </div>
                    <div class="card-body">
                      <input type="text" class="form-control input360" placeholder="Agrega la URL de 360°" value="<?php echo $habitacion["recorrido_virtual"] ?? ''; ?>">
                    </div>
                    <div class="card-footer">
                      <button class="btn btn-outline-info py-2 mt-2 w-100" onclick="window.open($('.input360').val(), '_blank')">ABRIR 360°</button>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Descripción -->
              <div class="card rounded-lg card-info card-outline">
                <div class="card-header pl-2 pl-sm-3">
                  <h5><strong>DESCRIPCIÓN</strong></h5>
                </div>
                <div class="card-body">
                  <textarea id="descripcion" name="descripcion" class="form-control" rows="5">
            <?php echo $habitacion["descripcion"] ?? ''; ?>
          </textarea>
                </div>
              </div>
            </div>
          </div>
        </div>


      </div>
    </div>
  </section>
</div>