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
	<div class="cartorder">
		<c:set var="totale" value='${sessionScope["totale"]}' />
		<c:set var="cartprods" value='${sessionScope["cartitems"]}' />
		<c:set var="currentUser" value='${sessionScope["currentSessionUser"]}' />


		<c:if test="${totale != null && totale != '0.00'}">
			<div class="card" style="font-size: small; margin-top: 30px">
				<div class="card-body">
					<c:forEach items="${cartprods}" var="item" begin="0"
						end="${cartitems.size() }">

						<div class="cartable">

							<table class="table" style="padding: 0px; font-size: 12, 5px;">
								<tbody>
									<tr>
										<td><i class="fas fa-shopping-cart"></i></td>
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

					<br> <br> <br> <br> Totale: EUR ${totale }
					<c:if test="${accessDone}">
						<form action="order.jsp" method="post" name="ordinafrm">
							<button
								class="quantButton btn btn-sm btn-primary btn-block text-uppercase"
								name="ordinebtn" id="ordinebtn" type="submit" value='${currentUser.username}'>Procedi
								all'ordine</button>
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

	<div class="card" style="margin-top: 30px">
		<div class="card-body">Lorem ipsum dolor sit amet, consectetur
			adipiscing elit. Maecenas fermentum, lorem sit amet sagittis
			convallis, nunc urna efficitur purus, non faucibus quam ante in
			tortor. In ac eros feugiat, fringilla odio a, lacinia erat. Integer
			vel dui id orci vulputate pretium at ac dui. Vestibulum suscipit
			auctor enim, in bibendum nisi bibendum ut. Mauris sed luctus felis,
			et laoreet urna. Mauris id velit ac sapien tempor volutpat.
			Suspendisse ac diam sed dolor feugiat vehicula sed sed nulla. Fusce
			finibus faucibus metus a pulvinar. Phasellus nisl leo, auctor a
			dignissim et, suscipit sit amet lectus. Aenean ultricies venenatis
			lacus quis mattis. Phasellus lectus tortor, blandit nec mauris vel,
			tempor ultricies nulla. Aenean id imperdiet arcu. Vestibulum
			vehicula, leo a porttitor fermentum, risus nulla sodales sem, ut
			dictum ligula turpis in sem. Nam rhoncus purus et rutrum imperdiet.
			Proin iaculis dolor nec sapien ornare, sed varius mi varius. Proin
			dictum mattis auctor. Sed porttitor, turpis sed dapibus imperdiet,
			tellus ipsum ullamcorper ligula, at mollis nulla augue at mauris.
			Fusce porta sem sed est vulputate posuere. Proin a augue luctus,
			imperdiet sem nec, efficitur tellus. Integer volutpat convallis orci
			vitae feugiat. Nam in turpis diam. Nam porta, leo sit amet efficitur
			lacinia, lacus mauris sollicitudin dui, ac fringilla metus felis ut
			est. In leo mi, pellentesque at purus sed, auctor eleifend erat.
			Curabitur convallis elit eget dolor sodales maximus. Vestibulum ante
			ipsum primis in faucibus orci luctus et ultrices posuere cubilia
			Curae; Orci varius natoque penatibus et magnis dis parturient montes,
			nascetur ridiculus mus. Sed scelerisque, felis nec tincidunt dapibus,
			nisi tortor elementum est, nec euismod velit lorem et elit. Integer
			interdum urna a dolor tincidunt, imperdiet semper libero congue.
			Mauris quam dui, volutpat vel fringilla vitae, bibendum ac augue.
			Praesent in varius est. Mauris efficitur quam id dui aliquet, quis
			consectetur purus pellentesque. Nunc enim diam, faucibus nec magna
			ut, efficitur cursus nulla.</div>
	</div>
</body>
</html>