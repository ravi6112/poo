{include file="home_header.tpl"}
{include file="navigation.tpl"}
<section class="content">
	<div class="nav-tabs-custom">
		<div class="tab-content">
			<div class="row">
				<div class="col-lg-12">
					<h3><strong>Sales Payment</strong></h3>
				</div>
			</div>
			<div class="row">
				{if $error_report=='on'}
					<div class="error_report" style="margin-bottom: 50px;">
						<strong>{$error_message}</strong>
					</div>
				{/if}
				<form action="sales_payment.php?job=search" method="post" class="search">
					<div class="col-lg-5">	
						<input type="text" class='auto1 form-control' name="customer_search" value="{$customer_search}"  placeholder="Search By Customer" />
					</div>
					<div class="col-lg-5">	
						<input type="text" class='auto2 form-control' name="sales_payment_no_search" value="{$sales_payment_no_search}" placeholder="Reurn Sales Payment No" />
					</div>
					<div class="col-lg-2">	
						<input type="submit" class="btn btn-primary" value="Search"/>

					</div>


				</form>
			</div><br>
			{if $search_mode=='on'}
			{php}list_sales_payment_search($_SESSION[sales_payment_no_search], $_SESSION[customer_search]);{/php}
			{/if}
			<div class="row">
				<div class="col-lg-5">	
					<form action="sales_payment.php?job=customer" method="post">
						<input type="text" class='auto1 form-control' name="customer_name" value="{$customer_name}" placeholder="Pay For Customer Name"/>			
					</form>
				</div>
				<div class="col-lg-5">			
					<form action="sales_payment.php?job=sales" method="post">
						<input type="text" class='auto3 form-control' name="sales_no"value="{$sales_no_select}" placeholder="Pay For Sales No"/>			
					</form>
				</div>
				<div class="col-lg-2"></div>
			</div>
			{if $show=='on' }
			<div class="main_user_home" style="min-height: 300px;">
				<p style="margin-top: 20px;">Pending Sales Payments.</p>
			{if $customer_name}
			<div>
			{php}list_sales_of_customer($_SESSION['customer_name']);{/php}</div>
			{elseif $sales_no_select}
			<div>
			{php}list_sales_of_sales_no($_SESSION['sales_no']);{/php}
			</div>
			{/if}
			{if $added=='on'}
				<p style="margin-top: 10px; margin-bottom: 5px;">Added Sales Payments.</p>
			{php}list_added_sales($_SESSION['random_no']);{/php}
			{/if}

			<div class="row" style="margin-top: 50px;">
				<form name="payment" action="sales_payment.php?job=save_payment" method="post" class="product">
					
						<div>
							<div class="col-lg-6">
								
									<div>
										<div>Cheque Amount: </div>
										<div width="350"><input type="text"  class="form-control" name="cheque_amount" value="{$cheque_amount}" size="25" /></div>
										<div>Cash Amount</div>
										<div> <input type="text" class="form-control" name="cash_amount" value="{$cash_amount}"
											size="25" /></div>
									</div>
									<div>
										<div>Cheque No</div>
										<div> <input type="text" class="form-control" name="cheque_no" value="{$cheque_no}" size="25" /></div>
									</div>
									<div>
										<div>Bank</div>
										<div> <input type="text" class="form-control" name="cheque_bank" value="{$cheque_bank}" size="25" /></div>
									</div>
									<div>
										<div>Branch</div>
										<div> <input type="text" class="form-control" name="cheque_branch" value="{$branch}"	size="25" /></div>
									</div>

								
							</div>
						</div>

					<div class="col-lg-6">
					
						<div>
							<div>Cheque Date</div>
							<div> <input type="text" class="form-control" name="cheque_date" value="{$cheque_date}" class="datepicker" required size="25" /></div>
						</div>											


						<div>
							<div width="125">Date</div>
							
							<div><input type="text" class="form-control" name="date" class="datepicker" value="{$date}"size="25" /></div>
						</div>
						<div>
							<div>Remarks</div>
							
							<div><textarea name="remarks" class="form-control">{$remarks}</textarea></div>
						</div>
						<div>
							<div>Prepared By</div>
							
							<div><input type="text"  class="form-control" name="prepared_by" value="{$prepared_by}" readonly size="25" /></div>
						</div>					

						<div>
							<button type="submit" class="btn btn-block btn-success" value="Save Payment" style="width: 200px; margin-top: 20px;">Save Payment</button>
						</div>
				</form>
					</div>

			</div>
			{/if}
		</div>
	</div>
</section>
{include file="js_footer.tpl"}

	{literal}
		<script>
			 $(function () {
				 $("#example1").DataTable();
			 });
		</script>

		<script>
			 $(function () {
				 $("#example2").DataTable();
			 });
		</script>

	{/literal}
