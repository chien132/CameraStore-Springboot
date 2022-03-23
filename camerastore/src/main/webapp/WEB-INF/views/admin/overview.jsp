<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>Thống kê</title>

    <style>
        .bg_rgba {
            background-color: rgba(150, 150, 150, 0.5);
            background-blend-mode: lighten;
            border-radius: 15px;
            /*width: 20%;*/
            height: 80vh;
            /* border: 1px solid black; */
        }

    </style>
</head>

<body id="homelogin">
<jsp:include page="header.jsp"/>
<div class="spacer"></div>

<!-- header -->
<div class="ui container pad-top-30 pad-bottom-30">
    <div class="center aligned segment">
        <div class="ui horizontal divider">
            <h2 style="color: white;">Thống kê</h2>
        </div>
    </div>
</div>

<div class="spacer"></div>

<div class="ui container ">

    <jsp:include page="filter.jsp"/>

    <div class="ui two column grid">
        <div class="four wide column"></div>
        <div class="twelve wide column bg_rgba">

            <div class="ui three statistics">
                <div class="blue statistic ui card">
                    <div class="value">${total}
                        <i class="blue archive icon"></i></div>
                    <div class="label"> ĐƠN HÀNG</div>
                </div>

                <div class="red statistic ui card">
                    <div class="value">
                        ${denied}<i class="red exclamation triangle icon"></i></div>
                    <div class="label"> ĐÃ TỪ CHỐI</div>
                </div>
                <div class="orange statistic ui card">
                    <div class="value">
                        ${waiting}<i class="orange spinner icon"></i></div>
                    <div class="label"> ĐANG CHỜ XÁC NHẬN</div>
                </div>
            </div>
            <div class="spacer"></div>
            <div class="ui two statistics">
                <div class="yellow statistic">
                    <div class="value">
                        ${delivering}<i class="yellow shipping fast icon"></i></div>
                    <div class="label"><h3> Đang giao hàng</h3></div>
                </div>
                <div class="green statistic">
                    <div class="value">
                        ${done}<i class="green clipboard check icon"></i></div>
                    <div class="label"><h3> Đã hoàn tất</h3></div>
                </div>

            </div>
            <div class="spacer"></div>
            <div class="ui two statistics">
                <div class="yellow statistic">
                    <div class="value">
                        <f:formatNumber type="currency" maxFractionDigits="0"
                                        currencySymbol="">${deliveringValue}</f:formatNumber> <sup
                            style="text-transform: none">đ</sup>
                    </div>
                    <div class="label"></div>
                </div>
                <div class="green statistic">
                    <div class="value"><f:formatNumber type="currency" maxFractionDigits="0"
                                                       currencySymbol="">${doneValue}</f:formatNumber> <sup
                            style="text-transform: none">đ</sup></div>
                    <div class="label"></div>
                </div>
            </div>

            <div class="spacer"></div>

            <div class="ui link three cards">
                <c:if test="${top1!=null}">

                    <div class="ui card">
                        <div class="image">
                            <img style="max-height: 20vh;object-fit: scale-down" src=${top1.image}/>
                        </div>
                        <div class="content">
                            <a class="header">${top1.name}</a>
                            <div class="description">
                                <a href="index?category=${top1.category.id}" class="date">${top1.category.name} </a> <a
                                    href="index?brand=${top1.brand.id}">${top1.brand.name}</a>
                            </div>
                        </div>
                        <div class="extra content">
                        </div>
                    </div>
                </c:if>
                <c:if test="${top2!=null}">
                    <div class="ui card">
                        <div class="image">
                            <img style="max-height: 20vh;object-fit: scale-down" src=${top2.image}/>
                        </div>
                        <div class="content">
                            <a class="header">${top2.name}</a>
                            <div class="description">
                                <a href="index?category=${top2.category.id}" class="date">${top2.category.name} </a> <a
                                    href="index?brand=${top2.brand.id}">${top2.brand.name}</a>
                            </div>
                        </div>
                        <div class="extra content">
                        </div>
                    </div>
                </c:if>
                <c:if test="${top3!=null}">
                    <div class="ui card">
                        <div class="image">
                            <img style="max-height: 20vh;object-fit: scale-down" src=${top3.image}/>
                        </div>
                        <div class="content">
                            <a class="header">${top3.name}</a>
                            <div class="description">
                                <a href="index?category=${top3.category.id}" class="date">${top3.category.name} </a> <a
                                    href="index?brand=${top3.brand.id}">${top3.brand.name}</a>
                            </div>
                        </div>
                        <div class="extra content">
                        </div>
                    </div>
                </c:if>
            </div>
            <div class="ui three statistics">
                <c:if test="${top1!=null}">
                    <div class="blue statistic">
                        <div class="value">${top1num} đã bán</div>
                    </div>
                </c:if>
                <c:if test="${top2!=null}">
                    <div class="blue statistic">
                        <div class="value">
                            <div class="value">${top2num} đã bán</div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${top3!=null}">
                    <div class="blue statistic">
                        <div class="value">
                            <div class="value">${top3num} đã bán
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

<div class="spacer"></div>

<jsp:include page="footer.jsp"/>
</body>

</html>