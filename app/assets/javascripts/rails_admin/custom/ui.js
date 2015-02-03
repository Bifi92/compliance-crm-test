<script type="text/javascript">
  $(document).on('rails_admin.dom_ready', function(){ 
   $("#lead_country_id_field").change(function() {
      getEstadosṔorPais("id="+$("#lead_country_id_field").val());
    });
  });

  function getEstadosṔorPais(id) {
    $.getJSON("/estados_por_pais", id, function(j) {
      var options = '<option value="">Escolha o estado</option>';
      $.each(j.est, function(i, item) {
        options += '<option value="' + item.id + '">' + item.n + '</option>';
      });
      $("#lead_estado_id_field").html(options);
    });
  }
</script>

<script type="text/javascript">
  $(document).on('rails_admin.dom_ready', function(){ 
   $("#lead_estado_id_field").change(function() {
      getCidadesṔorEstado("id="+$("#lead_estado_id_field").val());
    });
  });

  function getCidadesṔorEstado(id) {
    $.getJSON("/cidades_por_estado", id, function(j) {
      var options = '<option value="">Escolha a cidade</option>';
      $.each(j.cid, function(i, item) {
        options += '<option value="' + item.id + '">' + item.n + '</option>';
      });
      $("#lead_cidade_id_field").html(options);
    });
  }
</script>

<script type="text/javascript">
  $(document).on('rails_admin.dom_ready', function(){ 
   $("#lead_country_id_field").change(function() {
      getCidadesNil("id="+$("#lead_country_id_field").val());
    });
  });

  function getCidadesNil(id) {
    $.getJSON("/cidades_nil", id, function(j) {
      var options = '<option value="">Escolha a cidade</option>';
      $.each(j.cid, function(i, item) {
        options += '<option value="' + item.id + '">' + item.n + '</option>';
      });
      $("#lead_cidade_id_field").html(options);
    });
  }
</script>