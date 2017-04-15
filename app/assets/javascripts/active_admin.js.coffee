#= require active_admin/base
#= require active_material
#= require select2-full

$ ->
  $('.select2').select2({
    tags: true
    width: '100%'
    allowClear: true
  })
