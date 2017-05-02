# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  $('#consump_link').click (event) ->
    event.preventDefault()
    $('#consump_section').fadeToggle()

  $('#date1').change ->
    car_id = $('#date1').data('carid')
    $.ajax
      url: "/cars/#{car_id}/refuellings/update_date2.js",
      data: {
        carid : car_id,
        refuelling_id_date1: $('#date1').val()
        refuelling_id_date2: $('#date2').val() 
      },
      type: 'GET'

  $('#date2,#date1').change (event) ->
    date1_id = $('#date1').val()
    date2_id = $('#date2').val()
    car_id = $('#date1').data('carid')
    data_for_calc_consump = {date1_id: date1_id, date2_id: date2_id, car_id: car_id}
    $.ajax
      url:"/cars/calc_consump.json",
      data: data_for_calc_consump,
      type: 'GET',
      success: (json) ->
        result = $.parseJSON(json)
        ###
        if result is not null
        ###
        if result
          answer= "#{result} l pro 100km"
          $('#consump_result_fig').children('b').text(answer);
          $('#consump_result').show()

$(document).on('turbolinks:load', ready)