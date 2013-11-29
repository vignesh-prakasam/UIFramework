jQuery(function($) {

    $('[data-rel=tooltip]').tooltip();

    $(".select2").css('width', '200px').select2({allowClear: true})
        .on('change', function() {
            $(this).closest('form').validate().element($(this));
        });


    var $validation = false;
    $('#fuelux-wizard').ace_wizard().on('change', function(e, info) {
        if (info.step == 1)
        {
            var file = ajaxfileget("service_selection.php","#step2");
            $("h4").html("Service Selection");
        }
        if (info.step == 2)
        {
            var file = ajaxfileget("payment.php","#step3");
            $("h4").html("Payment");
        }

        if (info.step == 1 && $validation) {
            if (!$('#validation-form').valid())
                return false;
        }
    }).on('finished', function(e) {
            bootbox.dialog({
                message: "Thank you! Your information was successfully saved!",
                buttons: {
                    "success": {
                        "label": "OK",
                        "className": "btn-sm btn-primary"
                    }
                }
            });
        }).on('stepclick', function(e) {
            //return false;//prevent clicking on steps
        });


    $('#skip-validation').removeAttr('checked').on('click', function() {
        $validation = this.checked;
        if (this.checked) {
            $('#sample-form').hide();
            $('#validation-form').removeClass('hide');
        }
        else {
            $('#validation-form').addClass('hide');
            $('#sample-form').show();
        }
    });

    $.mask.definitions['~'] = '[+-]';
    $('.input-mask-date').mask('99/99/9999');
    $('.input-mask-phone').mask('(999) 999-9999');
    $('.input-mask-eyescript').mask('~9.99 ~9.99 999');
    $(".input-mask-product").mask("a*-999-a999", {placeholder: " ", completed: function() {
        alert("You typed the following: " + this.val());
    }});


    //documentation : http://docs.jquery.com/Plugins/Validation/validate


    $.mask.definitions['~'] = '[+-]';
    $('#phone').mask('(999) 999-9999');

//    jQuery.validator.addMethod("phone", function(value, element) {
//        return this.optional(element) || /^\(\d{3}\) \d{3}\-\d{4}( x\d{1,6})?$/.test(value);
//    }, "Enter a valid phone number.");
//
    $('#validation-form').validate({
        errorElement: 'div',
        errorClass: 'help-block',
        focusInvalid: false,
        rules: {
            email: {
                required: true,
                email: true
            },
            password: {
                required: true,
                minlength: 5
            },
            password2: {
                required: true,
                minlength: 5,
                equalTo: "#password"
            },
            name: {
                required: true
            },
            phone: {
                required: true,
                phone: 'required'
            },
            url: {
                required: true,
                url: true
            },
            comment: {
                required: true
            },
            state: {
                required: true
            },
            platform: {
                required: true
            },
            subscription: {
                required: true
            },
            gender: 'required',
            agree: 'required'
        },
        messages: {
            email: {
                required: "Please provide a valid email.",
                email: "Please provide a valid email."
            },
            password: {
                required: "Please specify a password.",
                minlength: "Please specify a secure password."
            },
            subscription: "Please choose at least one option",
            gender: "Please choose gender",
            agree: "Please accept our policy"
        },
        invalidHandler: function(event, validator) { //display error alert on form submit
            $('.alert-danger', $('.login-form')).show();
        },
        highlight: function(e) {
            $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
        },
        success: function(e) {
            $(e).closest('.form-group').removeClass('has-error').addClass('has-info');
            $(e).remove();
        },
        errorPlacement: function(error, element) {
            if (element.is(':checkbox') || element.is(':radio')) {
                var controls = element.closest('div[class*="col-"]');
                if (controls.find(':checkbox,:radio').length > 1)
                    controls.append(error);
                else
                    error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
            }
            else if (element.is('.select2')) {
                error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
            }
            else if (element.is('.chosen-select')) {
                error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
            }
            else
                error.insertAfter(element.parent());
        },
        submitHandler: function(form) {
        },
        invalidHandler: function(form) {
        }
    });




    $('#modal-wizard .modal-header').ace_wizard();
    $('#modal-wizard .wizard-actions .btn[data-dismiss=modal]').removeAttr('disabled');
})
function ajaxfileget(get_url,id)
{

    $.ajax({
        type: 'GET',
        url: get_url,
        //data: data,
        success: function(data) {
            $(id).html(data)
        },
        failure: function(data) {
        }
    });
}

//jQuery(function($) {
//	$('.easy-pie-chart.percentage').each(function(){
//		var $box = $(this).closest('.infobox');
//		var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
//		var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
//		var size = parseInt($(this).data('size')) || 50;
//		$(this).easyPieChart({
//			barColor: barColor,
//			trackColor: trackColor,
//			scaleColor: false,
//			lineCap: 'butt',
//			lineWidth: parseInt(size/10),
//			animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
//			size: size
//		});
//	})
//
//	$('.sparkline').each(function(){
//		var $box = $(this).closest('.infobox');
//		var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
//		$(this).sparkline('html', {tagValuesAttribute:'data-values', type: 'bar', barColor: barColor , chartRangeMin:$(this).data('min') || 0} );
//	});
//
//
//
//
//  var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
//  var data = [
//	{ label: "social networks",  data: 38.7, color: "#68BC31"},
//	{ label: "search engines",  data: 24.5, color: "#2091CF"},
//	{ label: "ad campaigns",  data: 8.2, color: "#AF4E96"},
//	{ label: "direct traffic",  data: 18.6, color: "#DA5430"},
//	{ label: "other",  data: 10, color: "#FEE074"}
//  ]
//  function drawPieChart(placeholder, data, position) {
// 	  $.plot(placeholder, data, {
//		series: {
//			pie: {
//				show: true,
//				tilt:0.8,
//				highlight: {
//					opacity: 0.25
//				},
//				stroke: {
//					color: '#fff',
//					width: 2
//				},
//				startAngle: 2
//			}
//		},
//		legend: {
//			show: true,
//			position: position || "ne",
//			labelBoxBorderColor: null,
//			margin:[-30,15]
//		}
//		,
//		grid: {
//			hoverable: true,
//			clickable: true
//		}
//	 })
// }
// drawPieChart(placeholder, data);
//
// /**
// we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
// so that's not needed actually.
// */
// placeholder.data('chart', data);
// placeholder.data('draw', drawPieChart);
//
//
//
//  var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
//  var previousPoint = null;
//
//  placeholder.on('plothover', function (event, pos, item) {
//	if(item) {
//		if (previousPoint != item.seriesIndex) {
//			previousPoint = item.seriesIndex;
//			var tip = item.series['label'] + " : " + item.series['percent']+'%';
//			$tooltip.show().children(0).text(tip);
//		}
//		$tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
//	} else {
//		$tooltip.hide();
//		previousPoint = null;
//	}
//
// });
//
//
//
//
//
//
//	var d1 = [];
//	for (var i = 0; i < Math.PI * 2; i += 0.5) {
//		d1.push([i, Math.sin(i)]);
//	}
//
//	var d2 = [];
//	for (var i = 0; i < Math.PI * 2; i += 0.5) {
//		d2.push([i, Math.cos(i)]);
//	}
//
//	var d3 = [];
//	for (var i = 0; i < Math.PI * 2; i += 0.2) {
//		d3.push([i, Math.tan(i)]);
//	}
//
//
//	var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
//	$.plot("#sales-charts", [
//		{ label: "Domains", data: d1 },
//		{ label: "Hosting", data: d2 },
//		{ label: "Services", data: d3 }
//	], {
//		hoverable: true,
//		shadowSize: 0,
//		series: {
//			lines: { show: true },
//			points: { show: true }
//		},
//		xaxis: {
//			tickLength: 0
//		},
//		yaxis: {
//			ticks: 10,
//			min: -2,
//			max: 2,
//			tickDecimals: 3
//		},
//		grid: {
//			backgroundColor: { colors: [ "#fff", "#fff" ] },
//			borderWidth: 1,
//			borderColor:'#555'
//		}
//	});
//
//
//	$('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
//	function tooltip_placement(context, source) {
//		var $source = $(source);
//		var $parent = $source.closest('.tab-content')
//		var off1 = $parent.offset();
//		var w1 = $parent.width();
//
//		var off2 = $source.offset();
//		var w2 = $source.width();
//
//		if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
//		return 'left';
//	}
//
//
//	$('.dialogs,.comments').slimScroll({
//		height: '300px'
//    });
//
//
//	//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
//	//so disable dragging when clicking on label
//	var agent = navigator.userAgent.toLowerCase();
//	if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
//	  $('#tasks').on('touchstart', function(e){
//		var li = $(e.target).closest('#tasks li');
//		if(li.length == 0)return;
//		var label = li.find('label.inline').get(0);
//		if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
//	});
//
//	$('#tasks').sortable({
//		opacity:0.8,
//		revert:true,
//		forceHelperSize:true,
//		placeholder: 'draggable-placeholder',
//		forcePlaceholderSize:true,
//		tolerance:'pointer',
//		stop: function( event, ui ) {//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
//			$(ui.item).css('z-index', 'auto');
//		}
//		}
//	);
//	$('#tasks').disableSelection();
//	$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
//		if(this.checked) $(this).closest('li').addClass('selected');
//		else $(this).closest('li').removeClass('selected');
//	});
//
//
//})