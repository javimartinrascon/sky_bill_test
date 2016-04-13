<%--
  Created by IntelliJ IDEA.
  User: javier-martin
  Date: 12/04/16
  Time: 21:41
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Sky Bill Test</title>
    <asset:stylesheet src="application.css"/>
    <style>
    @import url(http://fonts.googleapis.com/css?family=Bree+Serif);
    body, h1, h2, h3, h4, h5, h6{
        font-family: 'Bree Serif', serif;
    }
    </style>
</head>

<body>
    <div class="container">
<g:if test="${model}">

        <g:set var="bill_statement" value="${model.statement}"></g:set>
        <g:set var="bill_total" value="${model.total}"></g:set>
        <g:set var="bill_package" value="${model.package}"></g:set>
        <g:set var="bill_callCharges" value="${model.callCharges}"></g:set>
        <g:set var="bill_skyStore" value="${model.skyStore}"></g:set>
%{--"logo and header"--}%
        <div class="row">
            <div class="col-xs-6">
                <h1>
                    <asset:image src="grails_logo.png" alt="Grails"/>
                </h1>
            </div>
            <div class="col-xs-6 text-right">
                <h1>Sky Bill</h1>
            </div>
        </div>
%{--"statement"--}%
        <div class="row">
            <div class="col-xs-5" style="padding-left: 0px">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h4>Statement</h4>
                    </div>
                    <div class="panel-body">
                        <p>Generated: ${bill_statement.generated}</p>
                        <p>Due: ${bill_statement.due}</p>
                        <p>Period: ${bill_statement.period.from} - ${bill_statement.period.to}</p>
                    </div>
                </div>
            </div>
            <div class="col-xs-5  col-xs-offset-2" style="padding-right: 0px">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h4>Total</h4>
                        </div>
                        <div class="panel-body">
                            <h1>${bill_total}</h1>
                        </div>
                    </div>
            </div>
        </div>
%{--"subscriptions"--}%
        <div class="row">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4>Subscriptions</h4>
                </div>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th><h4>Name</h4></th>
                            <th><h4>Type</h4></th>
                            <th><h4>Cost</h4></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bill_package.subscriptions}" var="subscription">
                        <tr>
                            <td>${subscription.name}</td>
                            <td>${subscription.type}</td>
                            <td>${subscription.cost}</td>
                        </tr>
                    </g:each>
                    <tr>
                        <td colspan="2" style="background-color: #f8efc0">Total</td>
                        <td style="background-color: #f8efc0">${bill_package.total}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
%{--"Call Charges"--}%
        <div class="row">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4>Call Charges</h4>
                </div>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th><h4>Called</h4></th>
                        <th><h4>Duration</h4></th>
                        <th><h4>Cost</h4></th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bill_callCharges.calls}" var="call">
                        <tr>
                            <td>${call.called}</td>
                            <td>${call.duration}</td>
                            <td>${call.cost}</td>
                        </tr>
                    </g:each>
                    <tr>
                        <td colspan="2" style="background-color: #f8efc0">Total</td>
                        <td style="background-color: #f8efc0">${bill_callCharges.total}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
%{--"Sky Store"--}%
        <div class="row">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4>Sky Store</h4>
                </div>
                <table class="table table-bordered">
                    <thead>
                        <th>Title</th>
                        <th>Type</th>
                        <th>Cost</th>
                    </thead>
                    <tbody>
                    <g:each in="${bill_skyStore.rentals}" var="rental">
                        <tr>
                            <td>${rental.title}</td>
                            <td>Rental</td>
                            <td>${rental.cost}</td>
                        </tr>
                    </g:each>
                    <g:each in="${bill_skyStore.buyAndKeep}" var="buy">
                        <tr>
                            <td>${buy.title}</td>
                            <td>Buy And Keep</td>
                            <td>${buy.cost}</td>
                        </tr>
                    </g:each>
                        <tr>
                            <td colspan="2" style="background-color: #f8efc0">Total</td>
                            <td style="background-color: #f8efc0">${bill_skyStore.total}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    <div class="row">
        <div class="col-xs-5" style="padding-left: 0px">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <h4>Bank details</h4>
                </div>
                <div class="panel-body">
                    <p>Your Name</p>
                    <p>Bank Name</p>
                    <p>Account Number : --------</p>
                    <p>IBAN : --------</p>
                </div>
            </div>
        </div>
        <div class="col-xs-7" style="padding-right: 0px">
            <div class="span7">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h4>Contact Details</h4>
                    </div>
                    <div class="panel-body">
                        <p>
                            Email : you@example.com <br><br>
                            Mobile : -------- <br> <br>
                        </p>
                        <h4>Payment should be made by Bank Transfer</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</g:if>
<g:else>
        <h2>Sorry! Technical difficulties!</h2>
        Please try again later.
</g:else>
    </div>

</body>
</html>