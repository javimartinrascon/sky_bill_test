<%--
  Created by IntelliJ IDEA.
  User: javier-martin
  Date: 12/04/16
  Time: 21:41
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<h1>SKY Bill</h1>
<g:if test="${model}">
    <div>
        <g:set var="bill_statement" value="${model.statement}"></g:set>
        <g:set var="bill_total" value="${model.total}"></g:set>
        <g:set var="bill_package" value="${model.package}"></g:set>
        <g:set var="bill_callCharges" value="${model.callCharges}"></g:set>
        <g:set var="bill_skyStore" value="${model.skyStore}"></g:set>
        <div class="statement">
            "${bill_statement}"
        </div>
        <div>
            "${bill_total}"
        </div>
        <div class="subscriptions">
            <table>
                <thead>
                <h3>Subscriptions</h3>
                <tr>
                    <th>Type</th>
                    <th>Name</th>
                    <th>Cost</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${bill_package.subscriptions}" status="i" var="subscription">
                    <tr>
                        <td>${subscription.type}</td>
                        <td>${subscription.name}</td>
                        <td>${subscription.cost}</td>
                    </tr>
                </g:each>
                <tr>
                    <td colspan="2">Total</td>
                    <td>${bill_package.total}</td>
                </tr>
                </tbody>
            </table>
            %{--${bill_package}--}%
        </div>
        <div class="callCharges">
            <table>
                <thead>
                <h3>Call Charges</h3>
                <tr>
                    <th>Called</th>
                    <th>Duration</th>
                    <th>Cost</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${bill_callCharges.calls}" status="i" var="call">
                    <tr>
                        <td>${call.called}</td>
                        <td>${call.duration}</td>
                        <td>${call.cost}</td>
                    </tr>
                </g:each>
                <tr>
                    <td colspan="2">Total</td>
                    <td>${bill_callCharges.total}</td>
                </tr>
                </tbody>
            </table>
            %{--${bill_callCharges}--}%
        </div>
        <div class="skyStore">
            <table>
                <thead>
                <h3>Sky Store</h3>
                <th>Title</th>
                <th>Cost</th>
                </thead>
                <tbody>
                <g:each in="${bill_skyStore}" var="kind">
                    <g:if test="${kind.key=='rentals'}">
                        <g:each in="${kind.value}" var="rental">
                            <tr>
                                <td bgcolor="blue">${rental.title}</td>

                                <td bgcolor="blue">${rental.cost}</td>
                            </tr>
                        </g:each>
                    </g:if>
                    <g:elseif test="${kind.key == 'buyAndKeep'}">
                        <g:each in="${kind.value}" var="buy">
                            <tr>
                                <td bgcolor="purple">${buy.title}</td>
                                <td bgcolor="purple">${buy.cost}</td>
                            </tr>
                        </g:each>
                    </g:elseif>
                </g:each>
                <tr>
                    <td>Total</td>
                    <td>${bill_skyStore.total}</td>
                </tr>
                </tbody>
            </table>
            %{--"${bill_skyStore}"--}%
        </div>


    </div>
</g:if>
<g:else>
    <div>
        <h2>Sorry! Technical difficulties!</h2>
        Please try again later.
    </div>
</g:else>

</body>
</html>