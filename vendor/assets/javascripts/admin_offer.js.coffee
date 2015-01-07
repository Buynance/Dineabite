jQuery(document).ready ->
  $("#offer_business_id").focusout ->
    $("#preview-business-name > span").html($("#offer_business_id").children("option:selected").text())

  $("#offer_favorite").focusout ->
    $("#preview-favorite").html(this.value)

  $("#offer_full_price").focusout ->
    subtitle = $("#preview-subtitle > span").html()
    subtitle_array = subtitle.split(" ")
    print $("#offer_full_price").val
    subtitle_array[0] = "$" + Math.round((Number($("#offer_full_price").val) / 100.0))
    new_subtitle = subtitle_array.join(" ")
    $("#preview-subtitle > span").html(new_subtitle)


cent_to_text = (cent) ->
  return Math.round((Number(cent) / 100.0))
