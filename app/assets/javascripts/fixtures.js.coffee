# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
#  $('#fixture_teamone_id').parent().hide()
  teamone = $('#fixture_teamone_id').html()
  $('#fixture_division_id').change ->
    division = $('#fixture_division_id :selected').text()
    escaped_division = division.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(teamone).filter("optgroup[label=#{escaped_division}]").html()
    if options
      $('#fixture_teamone_id').html(options)
      $('#fixture_teamone_id').parent().show()      
    else
      $('#fixture_teamone_id').empty()
      $('#fixture_teamone_id').parent().hide()
      
#  $('#fixture_teamtwo_id').parent().hide()
  teamtwo = $('#fixture_teamtwo_id').html()
  $('#fixture_division_id').change ->
    division = $('#fixture_division_id :selected').text()
    escaped_division = division.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(teamtwo).filter("optgroup[label=#{escaped_division}]").html()
    if options
      $('#fixture_teamtwo_id').html(options)
      $('#fixture_teamtwo_id').parent().show()      
    else
      $('#fixture_teamtwo_id').empty()
      $('#fixture_teamtwo_id').parent().hide()