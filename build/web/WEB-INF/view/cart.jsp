
<div id="singleColumn">

    <c:choose>
        <c:when test="${cart.numberOfItems > 1}">
            <p>Votre panier contient ${cart.numberOfItems} items.</p>
        </c:when>
        <c:when test="${cart.numberOfItems == 1}">
            <p>Votre panier contient ${cart.numberOfItems} item.</p>
        </c:when>
        <c:otherwise>
            <p>Votre panier est vide.</p>
        </c:otherwise>
    </c:choose>

    <div id="actionBar">
        <c:if test="${!empty cart && cart.numberOfItems != 0}">

            <c:url var="url" value="viewCart">
                <c:param name="clear" value="true"/>
            </c:url>

            <a href="${url}" class="bubble hMargin">Vider Panier</a>
        </c:if>

        <%-- continue shopping widget --%>
        <c:set var="value">
            <c:choose>
                <c:when test="${!empty selectedCategory}">
                    category
                </c:when>
                <c:otherwise>
                    index.jsp
                </c:otherwise>
            </c:choose>
        </c:set>

        <c:url var="url" value="${value}"/>
        <a href="${url}" class="bubble hMargin">Continuer mes achats</a>

        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <a href="<c:url value='checkout'/>" class="bubble hMargin">Procéder au paiement &#x279f;</a>
        </c:if>
    </div>

    <c:if test="${!empty cart && cart.numberOfItems != 0}">

      <h4 id="subtotal">Sous-total: &euro; ${cart.subtotal}</h4>

      <table id="cartTable">

        <tr class="header">
            <th>Produit</th>
            <th>Nom</th>
            <th>Prix</th>
            <th>Quantité</th>
        </tr>

        <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">

          <c:set var="product" value="${cartItem.product}"/>

          <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
            <td>
              <img src="${initParam.productImagePath}${product.name}.png"
                   alt="${product.name}">
            </td>

            <td>${product.name}</td>

            <td>
                &euro; ${cartItem.total}
                <br>
                <span class="smallText">( &euro; ${product.price} / unit )</span>
            </td>

            <td>
                <form action="<c:url value='updateCart'/>" method="post">
                    <input type="hidden"
                           name="productId"
                           value="${product.id}">
                    <input type="text"
                           maxlength="2"
                           size="2"
                           value="${cartItem.quantity}"
                           name="quantity"
                           style="margin:5px">
                    <input type="submit"
                           name="submit"
                           value="Mettre à jour">
                </form>
            </td>
          </tr>

        </c:forEach>

      </table>

    </c:if>
</div>