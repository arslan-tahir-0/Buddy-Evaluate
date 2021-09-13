var count = 0;
$( document ).on('turbolinks:load', function() {
  // Blog report Logic

  var blog_report_action = '';
  $('#report-form-show').click(function()
  {

  if(count % 2 == 0)
  {
    //saving blog_report state
    if(count == 0){
      blog_report_action= $('#report-form-check')[0].action
    }
    //show if clicked and close if clicked again
    $('#report-form')[0].style.display="block";
  }
  else
  {
    $('#report-form')[0].style.display="none";
  }
  count=count+1;
  $('#report-form-check')[0].action = blog_report_action;

}); //report logic end


// Edit blog code
$('#blog-content').change(function(){
  $('#blog-content')[0].style.display = "block";
  $('#edit-blog-form')[0].style.display = "none";
})

// Suggestion Form Logic
$('#suggestion-form-show').click(function(){
  var original_content = $('#blog-content').first().text();

 $('.blog-container')[0].style.display= "none";
 $('#suggestion-container')[0].style.display="block";
})

});


function openReportEditForm()
{
  $('#blog-content')[0].style.display = "none";
  $('#edit-blog-form')[0].style.display = "block";
}

function sayHello(class_name)
{
  if(count%2==0)
  {
    $('#report-form')[0].style.display="block";
    document.getElementById("report-form").scrollIntoView();
    count = count+1;
  }
  else{
    $('#report-form')[0].style.display="none";
  }

  $('#report-form-check')[0].action = "/blogs/" + class_name.split(" ")[1] + "/comments/"+class_name.split(" ")[0]+"/reports/"
}




