# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
#  $('#team_playerone_id').parent().hide()
  playerone = $('#team_playerone_id').html()
  $('#team_division_id').change ->
    division = $('#team_division_id :selected').text()
    escaped_division = division.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(playerone).filter("optgroup[label=#{escaped_division}]").html()
    if options
      $('#team_playerone_id').html(options)
      $('#team_playerone_id').parent().show()      
    else
      $('#team_playerone_id').empty()
      $('#team_playerone_id').parent().hide()
      
#  $('#team_playertwo_id').parent().hide()
  playertwo = $('#team_playertwo_id').html()
  $('#team_division_id').change ->
    division = $('#team_division_id :selected').text()
    escaped_division = division.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(playertwo).filter("optgroup[label=#{escaped_division}]").html()
    if options
      $('#team_playertwo_id').html(options)
      $('#team_playertwo_id').parent().show()      
    else
      $('#team_playertwo_id').empty()
      $('#team_playertwo_id').parent().hide()