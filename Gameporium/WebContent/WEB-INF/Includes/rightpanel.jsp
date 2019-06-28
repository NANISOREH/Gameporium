<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>

	<c:set var="accessDone" value='${sessionScope["accessDone"]}' />
	<c:set var="totale" value='${sessionScope["totale"]}' />


	<!-- inizio right panel -->
	<div class="allpanel">
		<div class="cartorder">
			<c:set var="totale" value='${sessionScope["totale"]}' />

			<c:set var="cartprods" value='${sessionScope["cartitems"]}' />
			<c:set var="currentUser"
				value='${sessionScope["currentSessionUser"]}' />


			<c:if test="${totale != null && totale != '0.00'}">
				<div class="card panelcard cartpanel"
					style="font-size: small; margin-top: 30px">
					<div class="card-body">
						<c:forEach items="${cartprods}" var="item" begin="0"
							end="${cartitems.size() }">

							<div class="cartable">

								<table class="table cartableright">
									<tbody>
										<tr>
											<td></td>
											<td scope="row" class="col-lg-4"><a
												href="singleProduct?selProd=${item.product.codiceProdotto}&selCat=${item.product.codCategoria}">${item.product.titolo }</a>
											</td>
											<td class="text-center col-lg-4"><input
												class="quantInput" type="number" name="quantita"
												value="${item.quantita }" id="${item.quantita}"
												onchange="reloadCart(value, ${item.product.codiceProdotto})" />
											</td>
										</tr>
									</tbody>
								</table>

							</div>

						</c:forEach>

						<br> <br> <br> <br> Totale: EUR ${totale}<br>(IVA
						${sessionScope.iva}€)
						<c:if test="${accessDone}">
							<form action="order.jsp">
								<button
									class="quantButton btn btn-sm btn-primary btn-block text-uppercase"
									name="ordinebtn" id="ordinebtn" type="submit"
									value='${currentUser.username}'>Procedi all'ordine</button>
							</form>
						</c:if>


						<c:if test="${accessDone != true}">
							<strong>Attenzione,</strong>
				devi accedere o registrarti per procedere all'ordine.
				</c:if>
					</div>
				</div>
			</c:if>
		</div>

		<div class="panelcard card" style="margin-top: 30px">
			<div class="card-body" style="margin-top: 30px;">
				<img src="images/lato.png" style="width: 100%">
			</div>
		</div>
	</div>
</body>
</html>