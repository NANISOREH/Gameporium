  <table class="table">
    <thead>
      <tr>
        <th>Codice Prodotto</th>
        <th>Titolo</th>

        <th>Prezzo</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><a href="singleProduct?selProd=${item.codiceProdotto}&selCat=${item.codCategoria}">${item.codiceProdotto}</a></td>
        <td>${item.titolo}</td>

        <td>${item.prezzo }</td>
      </tr>
    </tbody>
  </table>
