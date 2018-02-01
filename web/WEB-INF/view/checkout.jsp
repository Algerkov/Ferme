
<script src="js/jquery.validate.js" type="text/javascript"></script>

<script type="text/javascript">

    $(document).ready(function(){
        $("#checkoutForm").validate({
            rules: {
                name: "required",
                email: {
                    required: true,
                    email: true
                },
                phone: {
                    required: true,
                    number: true,
                    minlength: 9
                },
                address: {
                    required: true
                },
                creditcard: {
                    required: true
                }
            }
        });
    });
</script>

<div id="singleColumn">

    <h2>checkout</h2>

    <p>Merci de compléter ces informations :</p>

    <c:if test="${!empty orderFailureFlag}">
        <p class="error"> Erreur, veuillez réessayer ultérieurement !</p>
    </c:if>

    <form id="checkoutForm" action="<c:url value='purchase'/>" method="post">
        <table id="checkoutTable">
          <c:if test="${!empty validationErrorFlag}">
            <tr>
                <td colspan="2" style="text-align:left">
                    <span class="error smallText">S'il vous plait saisissez des données valides pour ces champs:

                      <c:if test="${!empty nameError}">
                        <br><span class="indent"><strong>Nom</strong></span>
                      </c:if>
                      <c:if test="${!empty emailError}">
                        <br><span class="indent"><strong>Mail</strong></span>
                      </c:if>
                      <c:if test="${!empty phoneError}">
                        <br><span class="indent"><strong>Téléphone</strong></span>
                      </c:if>
                      <c:if test="${!empty addressError}">
                        <br><span class="indent"><strong>Adresse</strong></span>
                      </c:if>
                      <c:if test="${!empty cityRegionError}">
                        <br><span class="indent"><strong>Code postal</strong></span>
                      </c:if>
                      <c:if test="${!empty ccNumberError}">
                        <br><span class="indent"><strong>Numéro de carte</strong></span>
                      </c:if>

                    </span>
                </td>
            </tr>
          </c:if>
            <tr>
                <td><label for="name">Nom:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="name"
                           name="name"
                           value="${param.name}">
                </td>
            </tr>
            <tr>
                <td><label for="email">Mail:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="email"
                           name="email"
                           value="${param.email}">
                </td>
            </tr>
            <tr>
                <td><label for="phone">Telephone:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="16"
                           id="phone"
                           name="phone"
                           value="${param.phone}">
                </td>
            </tr>
            <tr>
                <td><label for="address">Adresse:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="address"
                           name="address"
                           value="${param.address}">

                    <br>
                    Département
                    <select name="cityRegion">
                      <c:forEach begin="1" end="10" var="regionNumber">
                        <option value="${regionNumber}"
                                <c:if test="${param.cityRegion eq regionNumber}">selected</c:if>>${regionNumber}</option>
                      </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="creditcard">Numéro de carte de crédit:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="19"
                           id="creditcard"
                           name="creditcard"
                           value="${param.creditcard}">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Valider Achat">
                </td>
            </tr>
        </table>
    </form>

    <div id="infoBox">

        <table id="priceBox">
            <tr>
                <td>Sous-total :</td>
                <td class="checkoutPriceColumn">
                    &euro; ${cart.subtotal}</td>
            </tr>
            <tr>
                <td>Frais de livraison:</td>
                <td class="checkoutPriceColumn">
                    &euro; ${initParam.deliverySurcharge}</td>
            </tr>
            <tr>
                <td class="total">total:</td>
                <td class="total checkoutPriceColumn">
                    &euro; ${cart.total}</td>
            </tr>
        </table>
    </div>
</div>