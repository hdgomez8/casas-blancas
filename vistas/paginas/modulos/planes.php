<?php

$planes = ControladorPlanes::ctrMostrarPlanes();

?>

<!--=====================================
PLANES
======================================-->

<div class="planes container-fluid bg-white p-0" id="planes">
	
	<div class="container p-0">
		
		<div class="grid-container">
			
			<div class="grid-item">
				
				<h1 class="text-center py-3 py-lg-5 tituloPlan text-uppercase" tituloPlan="Bienvenidos a CASAS BLANCAS Coveñas">Bienvenidos a CASAS BLANCAS Coveñas</h1>

				<p class="text-muted text-left px-4 descripcionPlan" descripcionPlan="Somos una familia dispuesta a atenderte con la mejor actitud y amabilidad para que te sientas como en casa. Vivimos en una de las instalaciones, siempre atentos a tus recomendaciones. Amamos la vida cerca del mar y llevamos más de 10 años en esta hermosa zona. Estamos felices de vivir aquí y esperamos que disfrutes del lugar tanto como nosotros. Te invitamos a vivir esta maravillosa experiencia">Somos una familia dispuesta a atenderte con la mejor actitud y amabilidad para que te sientas como en casa. Vivimos en una de las instalaciones, siempre atentos a tus recomendaciones. Amamos la vida cerca del mar y llevamos más de 10 años en esta hermosa zona. Estamos felices de vivir aquí y esperamos que disfrutes del lugar tanto como nosotros. Te invitamos a vivir esta maravillosa experiencia</p>

			</div>

			<?php foreach ($planes as $key => $value): ?>

			<div class="grid-item d-none d-lg-block" data-toggle="modal" data-target="#modalPlanes">
				
				<figure class="text-center">
					
					<h1 descripcion="<?php echo $value["descripcion"]; ?>" class="text-uppercase">PLAN <?php echo $value["tipo"]; ?></h1>

				</figure>

				<img src="<?php echo $servidor.$value["img"]; ?>" class="img-fluid" width="100%">


			</div>
				
			<?php endforeach ?>	
			
		</div>

	</div>

</div>
