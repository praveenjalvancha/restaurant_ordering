// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require tether
//= require bootstrap-sprockets

function notify(text, type = 'info') {
  var notification;
  notification = "<div class='alert alert-" + type + " role='alert'>";
  notification += '<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
  notification += text + "</div>"
  $("html, body").animate({
    scrollTop: 0
  }, "slow");
  return notification;
}

function addItem(id) {
  $(".notify").html('');
  $(".selected-items").append($(".item-" + id));
}

function removeItem(id) {
  $(".item-list").append($(".item-" + id));
}

function SendToKitchen() {
  var member_count = parseInt($("#members")[0].value)
  if (member_count == 0) {
    $(".notify").html(notify("Please Select Number of persons", "danger"));
    return false;
  } else if (parseInt($("#members")[0].value) > $("#original-capacity").data().capacity) {
    $(".notify").html(notify("Capacity Exceeded", "danger"));
  }
  if ($(".selected-items .item-to-remove").length) {
    var selectedItems = '';
    $(".selected-items td").each(function(element) {
      var id = this.getAttribute("data-i");
      if (id) {
        selectedItems += id + ',';
      }
    })
    $.ajax({
      type: "post",
      url: "/dine_tables/send_to_kitchen",
      dataType: "json",
      data: {
        items: selectedItems,
        category: $("#category").val(),
        table_id: $("#table-number").data().table,
        member_count: member_count,
        waiter: $("#waiter").val()
      },
      success: function(response) {
        debugger
        if (response.code == 1) {
          $(".notify").html(notify(response.message, "success"));
          setTimeout(function() {
            window.location = '/orders/' + response.order_id;
          }, 1600);
        } else {
          $(".notify").html(notify(response.message, "danger"));
        }
      }
    })
  } else {
    $(".notify").html(notify("Please Select Atleast One Item", "warning"));
  }
}