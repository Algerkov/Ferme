
<div id="singleColumn">

    <p id="confirmationText">
        <strong>Votre comande a bien été validée.</strong>
        <br><br>
        Gardez en note le numéro de commande :
        <strong>${orderRecord.confirmationNumber}</strong>
        <br>
    </p>

    <div class="summaryColumn" >

        <table id="orderSummaryTable" class="detailsTable">
            <tr class="header">
                <th colspan="3">Résumé de la commande</th>
            </tr>

            <tr class="tableHeading">
                <td>Produit</td>
                <td>Quantité</td>
                <td>Prix</td>
            </tr>

            <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">

                <tr class="${((iter.index % 2) != 0) ? 'lightBlue' : 'white'}">
                    <td>${products[iter.index].name}</td>
                    <td class="quantityColumn">
                        ${orderedProduct.quantity}
                    </td>
                    <td class="confirmationPriceColumn">
                        &euro; ${products[iter.index].price * orderedProduct.quantity}
                    </td>
                </tr>

            </c:forEach>

            <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightBlue">
                <td colspan="2" id="deliverySurchargeCellLeft"><strong>Frais de livraison:</strong></td>
                <td id="deliverySurchargeCellRight">&euro; ${initParam.deliverySurcharge}</td>
            </tr>

            <tr class="lightBlue">
                <td colspan="2" id="totalCellLeft"><strong>total:</strong></td>
                <td id="totalCellRight">&euro; ${orderRecord.amount}</td>
            </tr>

            <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightBlue">
                <td colspan="3" id="dateProcessedRow"><strong>Date de la commande :</strong>
                    ${orderRecord.dateCreated}
                </td>
            </tr>
        </table>

    </div>

    <div class="summaryColumn" >

        <table id="deliveryAddressTable" class="detailsTable">
            <tr class="header">
                <th colspan="3">Adresse de livraison :</th>
            </tr>

            <tr>
                <td colspan="3" class="lightBlue">
                    ${customer.name}
                    <br>
                    ${customer.address}
                    <br>
                    Département ${customer.cityRegion}
                    <br>
                    <hr>
                    <strong>Mail:</strong> ${customer.email}
                    <br>
                    <strong>Telephone:</strong> ${customer.phone}
                </td>
            </tr>
        </table>

    </div>
</div>