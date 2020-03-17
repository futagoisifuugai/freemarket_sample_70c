$(function(){
  function buildChildHTML(child){
   
    var html =`<li class="left__item--left__children__child">
    <a class="child_category" id="${child.id}" href="#">${child.name}</a>
    </li>`;
    return html;
  }
  $(".parent_category").on("mouseover",function(){
    var id = this.id
    $(".left__item--left__children__child").remove();
    $(".left__item--left__grand__children-child").remove();
    $.ajax({
      type: 'GET',
      url: '/tops/new',
      data: {parent_id: id},
      dataType: 'json'
    })
    .done(function(children) {
      children.forEach(function (child) {
        var html = buildChildHTML(child);
        $(".left__item--left__children").append(html);
      })
    });
  });
  function buildGrandChildHTML(child){
    var html =`<li class="left__item--left__grand__children-child">
    <a class="parent_category" id="${child.id}" href="#">${child.name}</a>
    </li>`;
    return html;
  }
  $(document).on("mouseover",".child_category",function(){
    var id = this.id
    $(".left__item--left__grand__children-child").remove();
    $.ajax({
      type: 'GET',
      url: '/tops/new',
      data: {parent_id: id},
      dataType: 'json'
    })
    .done(function(children) {
      children.forEach(function (child) {
        var html = buildGrandChildHTML(child);
        $(".left__item--left__grand__children").append(html);
      });
    });
  });
});

