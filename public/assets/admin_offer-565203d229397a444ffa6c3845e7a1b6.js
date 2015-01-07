(function() {
  var cent_to_text;

  jQuery(document).ready(function() {
    $("#offer_business_id").focusout(function() {
      return $("#preview-business-name > span").html($("#offer_business_id").children("option:selected").text());
    });
    $("#offer_favorite").focusout(function() {
      return $("#preview-favorite").html(this.value);
    });
    return $("#offer_full_price").focusout(function() {
      var new_subtitle, subtitle, subtitle_array;
      subtitle = $("#preview-subtitle > span").html();
      subtitle_array = subtitle.split(" ");
      print($("#offer_full_price").val);
      subtitle_array[0] = "$" + Math.round(Number($("#offer_full_price").val) / 100.0);
      new_subtitle = subtitle_array.join(" ");
      return $("#preview-subtitle > span").html(new_subtitle);
    });
  });

  cent_to_text = function(cent) {
    return Math.round(Number(cent) / 100.0);
  };

}).call(this);
