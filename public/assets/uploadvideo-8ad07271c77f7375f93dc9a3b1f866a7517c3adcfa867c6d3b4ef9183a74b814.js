$(function(){function e(){var e=!0;return""==$("#video_title").val()?(0==$("#error_msg ul").has("#no_title").length&&$("#error_msg ul").append('<li id="no_title">Title can\'t be blank.</li>'),e=!1):(0!=$("#error_msg ul").has("#no_title").length&&$("#error_msg ul #no_title").remove(),$("#video_title").val().match(/^[0-9a-zA-Z\s\.\-\_]+$/)?0!=$("#error_msg ul").has("#invalid_title").length&&$("#error_msg ul #invalid_title").remove():(0==$("#error_msg ul").has("#invalid_title").length&&$("#error_msg ul").append("<li id=\"invalid_title\">Title is invalid. It should not contain special characters other than '.', '-', '_'</li>"),e=!1)),""==$("#video_video_url").val()?(0==$("#error_msg ul").has("#no_video").length&&$("#error_msg ul").append('<li id="no_video">You need to choose a video file to upload.</li>'),e=!1):0!=$("#error_msg ul").has("#no_video").length&&$("#error_msg ul #no_video").remove(),""==$("#video_poster_url").val()?(0==$("#error_msg ul").has("#no_poster").length&&$("#error_msg ul").append('<li id="no_poster">You need to choose a poster file to upload.</li>'),e=!1):0!=$("#error_msg ul").has("#no_poster").length&&$("#error_msg ul #no_poster").remove(),e}var i=0,o=0;$(".directUpload").find("input:file").each(function(t,l){var r,a=$(l),n=$(a.parents("form:first")),d=/(\.|\/)(mp4|jpe?g|png){1}$/i;"video_video_url"==$(this).attr("id")?(r=n.data("video-form-data"),d=/(\.|\/)(mp4){1}$/i):(r=n.data("poster-form-data"),d=/(\.|\/)(jpe?g|png){1}$/i);var s=n.find('input[type="submit"]'),p=$("#video_video_url"),u=$("#video_poster_url"),_=$("<div class='bar'></div>"),v=$("<div class='progress'></div>").append(_);a.after(v),a.fileupload({fileInput:a,url:n.data("url"),type:"POST",autoUpload:!1,formData:r,paramName:"file",dataType:"XML",replaceFileInput:!1,add:function(i,o){var t=!0;console.log(o.originalFiles[0].type),0!=o.originalFiles[0].type.length&&d.test(o.originalFiles[0].type)||(t=!1,alert("The file format is not acceptable."),$(this).val("")),s.click(function(){t&&e()&&(console.log(e()),o.submit())})},progressall:function(e,i){var o=parseInt(i.loaded/i.total*100,10);_.css("width",o+"%").text("Loading...("+o+"%)")},start:function(){s.prop("disabled",!0),p.prop("disabled",!0),u.prop("disabled",!0),_.css("background","green").css("display","block").css("width","0%").text("Loading...")},done:function(e,t){_.text("Uploading done"),"video_video_url"==$(this).attr("id")?i=1:o=1;var l=$(t.jqXHR.responseXML).find("Key").text(),r="//"+n.data("host")+"/"+l,d=$("<input />",{type:"hidden",name:a.attr("name"),value:r});n.append(d),1==i&&1==o&&n.submit()},fail:function(){s.prop("disabled",!1),p.prop("disabled",!1),u.prop("disabled",!1),_.css("background","red").text("Failed")}}).on("fileuploadadded",function(e,i){alert("ASDF"),console.log(i.files.valid)})}),$(".directUpload").find('input[type="submit"]').click(function(i){e(),i.preventDefault()})});