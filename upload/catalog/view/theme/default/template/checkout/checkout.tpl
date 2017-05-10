<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
        <div class="panel panel-default">
          <div class="panel-collapse" id="collapse-shipping-address">
            <div class="panel-body"></div>
          </div>
          <div class="panel-collapse" id="collapse-other">
            <form class="form-horizontal">
              <div class="panel-body">



                <!--SHIPPING_ADDRESS-->
                <form class="form-horizontal">
                  <?php if ($addresses) { ?>
                  <div class="radio">
                    <label>
                      <input type="radio" name="shipping_address" value="existing" checked="checked" />
                      <?php echo $text_address_existing; ?></label>
                  </div>
                  <div id="shipping-existing">
                    <select name="address_id" class="form-control">
                      <?php foreach ($addresses as $address) { ?>
                      <?php if ($address['address_id'] == $address_id) { ?>
                      <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                  <div class="radio">
                    <label>
                      <input type="radio" name="shipping_address" value="new" />
                      <?php echo $text_address_new; ?></label>
                  </div>
                  <?php } ?>
                  <br />
                  <div id="shipping-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-shipping-firstname">Имя</label>
                      <div class="col-sm-10">
                        <input type="text" name="firstname" value="" placeholder="Имя" id="input-shipping-firstname" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-shipping-lastname">Фамилия</label>
                      <div class="col-sm-10">
                        <input type="text" name="lastname" value="" placeholder="Фамилия" id="input-shipping-lastname" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-account-email">Электронная почта</label>
                      <div class="col-sm-10">
                        <input type="text" name="email" value="" placeholder="Электронная почта" id="input-account-email" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-account-telephone">Телефон</label>
                      <div class="col-sm-10">
                        <input type="text" name="telephone" value="" placeholder="Телефон" id="input-account-telephone" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-shipping-address">Адрес</label>
                      <div class="col-sm-10">
                        <input type="text" name="address" value="" placeholder="Адрес" id="input-shipping-address" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-shipping-city">Город</label>
                      <div class="col-sm-10">
                        <input type="text" name="city" value="" placeholder="Город" id="input-shipping-city" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-shipping-postcode">Индекс</label>
                      <div class="col-sm-10">
                        <input type="text" name="postcode" value="" placeholder="Индекс" id="input-shipping-postcode" class="form-control" />
                      </div>
                    </div>
                    <div class="form-group required">
                      <label class="col-sm-2 control-label" for="input-shipping-zone">Регион / Область</label>
                      <div class="col-sm-10">
                        <select name="zone_id" id="input-shipping-zone" class="form-control">
                          <option value="0">--Выберите регион--</option>
                          <?php foreach ($regions as $region) { ?>
                          <option value="<?php echo $region['zone_id']; ?>"><?php echo $region['name']; ?></option>
                          <?php } ?>
                        </select>
                      </div>
                    </div>
                  </div>
                </form>
                <script type="text/javascript"><!--
                $('input[name=\'shipping_address\']').on('change', function() {
                	if (this.value == 'new') {
                		$('#shipping-existing').hide();
                		$('#shipping-new').show();
                	} else {
                		$('#shipping-existing').show();
                		$('#shipping-new').hide();
                	}
                });
                //--></script>
                <script type="text/javascript"><!--
                $('#collapse-shipping-address .form-group[data-sort]').detach().each(function() {
                	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#collapse-shipping-address .form-group').length-2) {
                		$('#collapse-shipping-address .form-group').eq(parseInt($(this).attr('data-sort'))+2).before(this);
                	}

                	if ($(this).attr('data-sort') > $('#collapse-shipping-address .form-group').length-2) {
                		$('#collapse-shipping-address .form-group:last').after(this);
                	}

                	if ($(this).attr('data-sort') == $('#collapse-shipping-address .form-group').length-2) {
                		$('#collapse-shipping-address .form-group:last').after(this);
                	}

                	if ($(this).attr('data-sort') < -$('#collapse-shipping-address .form-group').length-2) {
                		$('#collapse-shipping-address .form-group:first').before(this);
                	}
                });
                //--></script>

                <!--SHIPPING METHOD -->

                <?php foreach ($shipping_methods as $shipping_method) { ?>
                <?php foreach ($shipping_method['quote'] as $quote) { ?>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="shipping_method">Способ доставки</label>
                    <div class="col-sm-10">
                      <div class="radio">
                        <label>
                          <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked" />
                          <?php echo $quote['title']; ?> - <?php echo $quote['text']; ?>
                        </label>
                      </div>
                    </div>
                  </div>
                <?php } ?>
                <?php } ?>


                <!--PAYMENT METHOD AND TOTALS-->
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="payment_method">Способ оплаты</label>
                  <div class="col-sm-10">
                    <?php foreach ($payment_methods as $payment_method) { ?>
                      <div class="radio">
                      <label>
                          <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" checked="checked" />
                          <?php echo $payment_method['title']; ?>
                          <?php if ($payment_method['terms']) { ?>
                            (<?php echo $payment_method['terms']; ?>)
                          <?php } ?>
                      </label>
                      </div>
                    <?php } ?>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 control-label" for="payment_method">Комментарий</label>
                  <div class="col-sm-10">
                      <p><strong>Вы можете добавить комментарий к своему заказу</strong></p>
                      <textarea name="comment" rows="8" class="form-control"></textarea>
                  </div>
                </div>

                <div class="table-responsive">
                  <table class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <td class="text-left">Название товара</td>
                        <td class="text-right">Количество</td>
                        <td class="text-right">Цена</td>
                        <td class="text-right">Итого</td>
                      </tr>
                    </thead>
                    <tbody>
                      <?php foreach ($products as $product) { ?>
                      <tr>
                        <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                          <?php foreach ($product['option'] as $option) { ?>
                          <br />
                          &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                          <?php } ?>
                          <?php if($product['recurring']) { ?>
                          <br />
                          <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                          <?php } ?></td>
                        <!--<td class="text-left"><?php /*echo $product['model'];*/ ?></td>-->
                        <td class="text-right"><?php echo $product['quantity']; ?></td>
                        <td class="text-right"><?php echo $product['price']; ?></td>
                        <td class="text-right"><?php echo $product['total']; ?></td>
                      </tr>
                      <?php } ?>
                    </tbody>
                    <tfoot>
                      <?php foreach($totals as $total) { ?>
                      <tr>
                        <td colspan="3" class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                        <td class="text-right"><?php echo $total['text']; ?></td>
                      </tr>
                      <?php } ?>
                    </tfoot>
                  </table>
                </div>





















              </div>
            </form>
          </div>
        </div>
		<div class="buttons clearfix">
			<div class="pull-right">
			  <input type="button" value="Подтвердить заказ" id="button-checkout-save" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
			</div>
		  </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$(document).on('change', 'input[name=\'account\']', function() {
	if ($('#collapse-payment-address').parent().find('.panel-heading .panel-title > *').is('a')) {
		if (this.value == 'register') {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_account; ?> <i class="fa fa-caret-down"></i></a>');
		} else {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');
		}
	} else {
		if (this.value == 'register') {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_account; ?>');
		} else {
			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_address; ?>');
		}
	}
});

<?php if (!$logged) { ?>
$(document).ready(function() {
	/*$.get('index.php?route=checkout/shipping_address', function(html) {
		$('#collapse-shipping-address .panel-body').html(html);
		$.get('index.php?route=checkout/shipping_method', function(html) {
			$('#collapse-other .panel-body').append(html);
			$.get('index.php?route=checkout/payment_method', function(html) {
				$('#collapse-other .panel-body').append(html);
			}, 'html');
		}, 'html');
	}, 'html');*/

    /*$.ajax({
        url: 'index.php?route=checkout/confirm',
        dataType: 'html',
        success: function(html) {
           $('#collapse-checkout-confirm .panel-body').html(html);
           $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<a href="#collapse-checkout-confirm" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_confirm; ?> <i class="fa fa-caret-down"></i></a>');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });*/
});
<?php } else { ?>
$(document).ready(function() {
    $.ajax({
        url: 'index.php?route=checkout/shipping_address',
        dataType: 'html',
        success: function(html) {
            $('#collapse-payment-address .panel-body').html(html);

			$('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');

			$('a[href=\'#collapse-payment-address\']').trigger('click');
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
<?php } ?>
$(document).delegate('#button-checkout-save', 'click', function() {
    $.ajax({
        url: 'index.php?route=checkout/checkout/save',
        type: 'post',
        data: $('form input[type=\'text\'], form input[type=\'date\'], form input[type=\'datetime-local\'], form input[type=\'time\'], form input[type=\'password\'], form input[type=\'checkbox\']:checked, form input[type=\'radio\']:checked, form textarea, form select'),
        dataType: 'json',
        beforeSend: function() {
			$('#button-shipping-address').button('loading');
	    },
        success: function(json) {
            $('.alert, .text-danger').remove();

            if (json['redirect']) {
                location = json['redirect'];
            } else if (json['error']) {
                  if (json['error']['warning']) {
                      $('#collapse-shipping-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                  }

        				for (i in json['error']) {
        					var element = $('#input-shipping-' + i.replace('_', '-'));

        					if ($(element).parent().hasClass('input-group')) {
        						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
        					} else {
        						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
        					}
        				}

        				// Highlight any found errors
        				$('.text-danger').parent().parent().addClass('has-error');
            } else {
                alert("Заказ принят!");
                location = "/index.php";
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
});
//--></script>
<?php echo $footer; ?>
