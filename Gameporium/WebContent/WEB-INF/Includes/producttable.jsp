      <tr>
        <td><a href="singleProduct?selProd=${item.codiceProdotto}&selCat=${item.codCategoria}">${item.titolo}</a></td>
        <td>${item.codiceProdotto}</td>
        <td>${item.prezzo }</td>
        <td><a href="/adminServlet?operation=4&codiceProdotto=${item.codiceProdotto}">Cancella</a></td>
        <td><a href="/Gameporium/productoperation.jsp?operation=2&codiceProdotto=${item.codiceProdotto}">Modifica</a></td>
      </tr>

