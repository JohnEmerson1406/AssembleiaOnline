$(document).ready(function () {
  $('.btn-open-close').click(function() {
    let id = $(this).attr('id').split('-')[1]
    $.ajax({
      url: `/admin/assemblies/${id}/open_close_state`,
      method: 'put'
    }).done(function (data) {
      if (data['success']) {
        if (data['state'] == 'open') {
          $('#assembly-' + id).removeClass('btn-outline-success')
          $('#assembly-' + id).addClass('btn-outline-danger')
          $('#assembly-' + id).text('Fechar')

          $('#badge-' + id).removeClass('badge-danger badge-warning')
          $('#badge-' + id).addClass('badge-success')
          $('#badge-' + id).text('Ativa')
        } else {
          $('#assembly-' + id).removeClass('btn-outline-danger')
          $('#assembly-' + id).addClass('btn-outline-success')
          $('#assembly-' + id).text('Abrir')

          $('#badge-' + id).removeClass('badge-success')
          $('#badge-' + id).addClass('badge-danger')
          $('#badge-' + id).text('Finalizado')
        }
      } else {
        alert('Algo deu errado')
      }
    })
  })
});