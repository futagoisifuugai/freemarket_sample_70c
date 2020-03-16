$(function() {
  var buildPrompt = `<option value>---</option>`
  var buildHtmlOption = function(cat) {
      var option = `<option value ="${cat.id}">${cat.name}</option>`
      return option
  }
  var buildInputFile = function(num) {
      var input = `<input data-id="${num}" type="file" name="product[images_attributes][${num}][image_url]" id="product_images_attributes_${num}_image_url">`
      return input
  }
  var product_img = $('.product_image')
  if (product_img.length)
      product_img.parents('.sell__image-select__ul-text').css('opacity',1);
      product_img.parent().next('.btn-box').css('display','block');

  $(".product-detail__top__item-image-list__inner").on({
      'mouseenter': function() {
          var child = $(this).children();
              url = $(child).attr('src');
              inner_id = $(child).data('inner_id');
              photo = $('.product-detail__top__item-image-main--photo');
              main = $("#main_" + inner_id);
          $(photo).fadeOut();
          $(main).fadeIn();
      }
  });

  $('.sell__image-select__ul-text').on('change', 'input[type="file"]', function(e) {
      var id = $(this).data('id'),
          file = e.target.files[0],
          reader = new FileReader(),
          $label = $(".ul-id-" + id),
          $li = $label.children('li')
  
      if(file.type.indexOf("image") < 0){
          return false;
      }
  
      reader.onload = (function(file) {
          return function(e) {
              
              $li.empty();
              
              $label.css('opacity', '1');
              
              $li.append($('<img>').attr({
                  src: e.target.result,
                  width: "114px",
                  height: "116px",
                  class: "preview",
                  title: file.name,
              }));
              
              $('.btn-box').css('display', 'block');
          };
      })(file);
  
      reader.readAsDataURL(file);
  });




  $(this).on("click", ".delete-btn", function() {
      var input = $(this).parent().siblings('input');
      var num = $(input).data('id');
      $(this).parent().prev().empty();
      $(input).remove();
      var html = buildInputFile(num)
      $(this).parent().parent().append(html);
      $(this).parent().parent().css('opacity', '0');
      return false;
  });

  $('#parent').change(function() {
      var parent_id = $(this).val();
      $.ajax({
          type: 'GET',
          url: '/api/sell/child',
          data: {id: parent_id},
          dataType: 'json'
      })
      .done(function(categories) {
          $('.child').css('display', 'block');
          $('#child').empty();
          $('.grand_child').css('display', 'none');
          $('#child').append(buildPrompt);

          categories.forEach(function(cat) {
              var html_option = buildHtmlOption(cat);
              $('#child').append(html_option);
          });
      })
      .fail(function() {
      });
  });
  
  $(this).on("change", "#child", function() {
      var child_id = $("#child").val();
      $.ajax({
          type: 'GET',
          url: '/api/sell/grand_child',
          data: {id: child_id},
          dataType: 'json'
      })
      .done(function(categories) {
          $('.grand_child').css('display', 'block');
          $('#grand_child').empty();
          $('#grand_child').append(buildPrompt);
          categories.forEach(function(cat) {
              var html_option = buildHtmlOption(cat);
              $('#grand_child').append(html_option);
          });
      })
      .fail(function() {
      });
  });
  
  $("#product_price").on("keyup", function() {
      var price = $(this).val();
      var fee = Math.floor(price * 0.1);
      $(".sell__about__right__wrap__fee-right").text("¥ " + fee);
      var profit = price - fee
      $(".sell__about__right__wrap__profit-right").text("¥ " + profit);
  });
 
  $("#product_price").on("keyup", function(){
      var price = $("#product_price").val();
      var fee_num = Math.floor(price * 0.1);
      var first_str = String(fee_num); 
      var fee_str = first_str.replace(/(\d)(?=(\d\d\d)+$)/g, '$1,');
      $(".sell__about__right__wrap__fee-right").text("¥ " + fee_str);
      var profit_num = price - fee_num
      var second_str = String(profit_num);
      var profit_str = second_str.replace(/(\d)(?=(\d\d\d)+$)/g, '$1,');
      $(".sell__about__right__wrap__profit-right").text("¥ " + profit_str);
  });

});