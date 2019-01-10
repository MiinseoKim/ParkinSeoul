<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<header id="header">      
        <div class="container">
            <div class="row">
                <div class="col-sm-12 overflow">
                   <div class="social-icons pull-right">
                        <ul class="nav nav-pills">
                            <li><a href="me.htm">oo 회원님</a></li><!-- 로그인 시 생기는 링크 -->
                            <li><a href="">로그아웃</a></li>
                    
                        </ul>
                    </div> 
                </div>
             </div>
        </div>
        <div class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="home.htm">
                      <h1><!-- <img src="images/logo.png" alt="logo"> -->Park in Seoul</h1>
                    </a>
                    
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="home.htm">Home</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath }/findpark.htm">공원 찾기</a></li>
                        <li><a href="${pageContext.request.contextPath }/boardlist.htm">커뮤니티</a></li>  
                        <li class="dropdown"><a>마이페이지<i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="me.htm">나의 정보</a></li>
                                <li><a href="hearts.htm">좋아요 리스트</a></li>
                            </ul>
                        </li>                         
                                          
                    </ul>
                </div>
                <div class="search">
                    <form role="form">
                        <i class="fa fa-search"></i>
                        <div class="field-toggle">
                            <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </header>
    <!--/#header-->