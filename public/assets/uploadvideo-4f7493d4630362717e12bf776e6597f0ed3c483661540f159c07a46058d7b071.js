$(function(){var e=0,t=0,o=0,r=0;$(".directUpload").find("input:file").each(function(i,a){var d=$(a);console.log(d);var l,n=$(d.parents("form:first"));l="video_video_url"==$(this).attr("id")?n.data("video-form-data"):n.data("poster-form-data");var s=n.find('input[type="submit"]'),u=$("<div class='bar'></div>"),p=$("<div class='progress'></div>").append(u);d.after(p),d.fileupload({fileInput:d,url:n.data("url"),type:"POST",autoUpload:!0,formData:l,paramName:"file",dataType:"XML",replaceFileInput:!1,add:function(o,r){"video_video_url"==$(this).attr("id")&&(e=1),"video_poster_url"==$(this).attr("id")&&(t=1),s.click(function(){1==e&&1==t&&""!=$("#video_title").val()&&r.submit()})},progressall:function(e,t){var o=parseInt(t.loaded/t.total*100,10);u.css("width",o+"%").text("Loading...("+o+"%)")},start:function(){s.prop("disabled",!0),u.css("background","green").css("display","block").css("width","0%").text("Loading...")},done:function(e,t){"video_video_url"==$(this).attr("id")&&(o=1),"video_poster_url"==$(this).attr("id")&&(r=1),u.text("Uploading done");var i=$(t.jqXHR.responseXML).find("Key").text(),a="//"+n.data("host")+"/"+i,l=$("<input />",{type:"hidden",name:d.attr("name"),value:a});n.append(l),1==o&&1==r&&(s.prop("disabled",!1),n.submit())},fail:function(){s.prop("disabled",!1),u.css("background","red").text("Failed")}})})}),$(function(){function e(){var e=!0;return""==$("#video_title").val()?(0==$("#error_msg ul").has("#no_title").length&&$("#error_msg ul").append('<li id="no_title">Title can\'t be blank.</li>'),e=!1):0!=$("#error_msg ul").has("#no_title").length&&$("#error_msg ul #no_title").remove(),""==$("#video_video_url").val()?(0==$("#error_msg ul").has("#no_video").length&&$("#error_msg ul").append('<li id="no_video">You need to choose a video file to upload.</li>'),e=!1):0!=$("#error_msg ul").has("#no_video").length&&$("#error_msg ul #no_video").remove(),""==$("#video_poster_url").val()?(0==$("#error_msg ul").has("#no_poster").length&&$("#error_msg ul").append('<li id="no_poster">You need to choose a poster file to upload.</li>'),e=!1):0!=$("#error_msg ul").has("#no_poster").length&&$("#error_msg ul #no_poster").remove(),e}$(".directUpload").find('input[type="submit"]').click(function(t){e()||t.preventDefault()})});