<div id="indexLeftColumn">
    <div id="welcomeText">
        <p style="font-size: larger">Bienvenue sur le site de la ferme des Dondaines</p>

        <p>Des produits frais et locaux, disponibles à tout moment !</p>
    </div>
</div>

<div id="indexRightColumn">
    <c:forEach var="category" items="${categories}">
        <div class="categoryBox">
            <a href="<c:url value='category?${category.id}'/>">
                <span class="categoryLabel"></span>
                <span class="categoryLabelText">${category.name}</span>

                <img src="${initParam.categoryImagePath}${category.name}.jpg"
                     alt="${category.name}" class="categoryImage">
            </a>
        </div>
    </c:forEach>
</div>