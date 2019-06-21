<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
 <!-- pannello laterale -->
      <div class="sidebar-menu" style="margin-top:10px">
        <ul>
          <li class="sidebar-dropdown">
              <i class="fa fa-tachometer-alt"></i>
              <span>Gestione prodotti</span>

            <div class="sidebar-submenu">
              <ul>
                <li>
                  <a href="/Gameporium/productoperation.jsp?operation=1">Inserisci prodotto</a>
                </li>
                <li>
                  <a href="/Gameporium/productoperation.jsp?operation=2">Modifica prodotto</a>
                </li>
                <li>
                  <a href="/Gameporium/productoperation.jsp?operation=3">Elimina prodotto</a>
                </li>
                <li>
                  <a href="/Gameporium/productoperation.jsp?operation=4">Visualizza prodotti</a>
                </li>
              </ul>
            </div>
          </li>
          <li class="sidebar-dropdown">
              <i class="fa fa-shopping-cart"></i>
              <span>Gestione ordini</span>

            <div class="sidebar-submenu">
              <ul>
                <li>
                  <a href="/Gameporium/orderoperation.jsp?operation=1">Visualizza ordini</a>
                </li>
              </ul>
            </div>
          </li>
          <li class="sidebar-dropdown">
              <i class="far fa-gem"></i>
              <span>Gestione eventi</span>

            <div class="sidebar-submenu">
              <ul>
                <li>
                  <a href="#">Inserisci evento</a>
                </li>
                <li>
                  <a href="#">Modifica evento</a>
                </li>
                <li>
                  <a href="#">Elimina evento</a>
                </li>
                <li>
                  <a href="#">Visualizza eventi</a>
                </li>
              </ul>
            </div>
          </li>
          <li class="sidebar-dropdown">
              <i class="fa fa-chart-line"></i>
              <span>Gestione utenti</span>

            <div class="sidebar-submenu">
              <ul>
                <li>
                  <a href="#">Inserisci utente</a>
                </li>
                <li>
                  <a href="#">Modifica utente</a>
                </li>
                <li>
                  <a href="#">Elimina utente</a>
                </li>
                <li>
                  <a href="#">Visualizza utenti</a>
                </li>
              </ul>
            </div>
          </li>
        </ul>
      </div>

        <!-- fine pannello laterale -->

</body>
</html>