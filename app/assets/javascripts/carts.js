$(document).ready(function() {
  $(".quantity").change(function() {
    var price = $(this).parent().next().text();
    // var price = $(this).parent().next().next().text();
    sum = price * $(this).val();
    $(this).parent().next().next().text(sum)
    // alert($(this).next().next().text());
     $.ajax({
           url: "/store/cart/update_quantity",
           type: "POST",
           data: {id: $(this).attr('id'), quantity: $(this).val(), dd: price}
        });
  });
});