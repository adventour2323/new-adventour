<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="css/shop_index.css">
    <script src=https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js></script>
    <script src="js/shop_index.js"></script>
    <title>shop_main_index</title>
</head>

<body>

	<header>
    	 <jsp:include page="header_login.jsp"></jsp:include>
	</header>
			<%
				if(session.getAttribute("id") == null) {
					response.sendRedirect("g_logout.jsp"); }
			%>


    <!--메인 이미지 박스-->
    <div class="mImg">
        <img id="mainImg" src="image/shop/main_beach.jpg">
        <!--셀렉트 박스들-->
        <div> 국가를 입력해주세요.<br/>
            <select name="fstSel" id="fstSel">
                <option value="all">--선택--</option>
                <option value="country_eng">국가</option>
                <option value="stuff">상품</option>
            </select>
            <select name="secSel" id="secSel">
                <option value="all">--전체--</option>
            </select>
            <select name="thrdSel" id="thrdSel">
                <option value="all">--전체--</option>
            </select>
            <input type="text" name="mSrchT" placeholder="국가를 입력해주세요" id="mSrchT"><input type="button" name="mSrchBtn"
                value="검색" id="mSrchBtn">
        </div>
    </div>
    <!--물건박스 소개-->
    <div>
        <h1>베스트 아이템</h1>
    </div>
    <!--물건 전체 박스-->
    <div class="stffAllB">
        <div class="bstGdsB">
            <div class="cgTBox">
                <span class="cgTboxS"><div><img src="image/shop/tab_menu_main_book.png" alt=""></div><p>도서</p></span><span class="cgTboxS"><div><img src="image/shop/tab_menu_main_mobile.png" alt=""></div><p>모바일</p></span><span class="cgTboxS"><div><img src="image/shop/tab_menu_main_grocery.png" alt=""></div><p>잡화</p></span><span class="cgTboxS"><div><img src="image/shop/tab_menu_main_ticket.png" alt=""></div><p>티켓</p></span>
            </div>
            <div class="gdsTBxPc">
                <span><a href="" class="like"><img src="image/shop/book_france_guide.jfif"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB1">
                        <lable for="bstGdsB1"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/book_spain_guide.jpg"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB3">
                        <lable for="bstGdsB3"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/book_engl_sport.jpg"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB4">
                        <lable for="bstGdsB4"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/book_france_train_gd.jfif"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB2">
                        <lable for="bstGdsB2"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
            </div>
            <div class="gdsTBxPc">
                <span><a href="" class="like"><img src="image/shop/mobile_stff_batery.jpg"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB5">
                        <lable for="bstGdsB5"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/mobile_stff_batery_nemo.png"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB6">
                        <lable for="bstGdsB6"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/adaptet_stff_eu.jpg"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB7">
                        <lable for="bstGdsB7"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/eu-esim-mobile.jfif"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB8">
                        <lable for="bstGdsB8"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
            </div>
            <div class="gdsTBxPc">
                <span><a href="" class="like"><img src="image/shop/carrier_stff_lovely.jpg"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB9">
                        <lable for="bstGdsB9"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/PassportWallet_stff.png"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB10">
                        <lable for="bstGdsB10"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/carrier_stff_cross.jpg"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB12">
                        <lable for="bstGdsB12"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/carrier_stff_musinsa.jpg"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB11">
                        <lable for="bstGdsB11"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
            </div>
            <div class="gdsTBxPc">
                <span><a href="" class="like"><img src="image/shop/BILLYELLIOT_tk_musical.jpg"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB13">
                        <lable for="bstGdsB13"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/shop_stff_tik_wicked.jpg"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB14">
                        <lable for="bstGdsB14"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/anstasha_tk_musical.jpg"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB15">
                        <lable for=""></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/lionking_tk_musical.png"></a>
                    <div><input type="checkbox" name="likeCB" id="bstGdsB16">
                        <lable for=""></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                
            </div>
        </div>

        <!--조횟수 기준으로 데이터 뽑음-->
        <div class="tdShpOfCB">
            <div class="cgBox">
                <sapn>오늘의 쇼핑 제안</span>
            </div>
            <div class="gdsBxPc">
            <span><a href="" class="like"><img src="image/shop/MSIM-EU01.png"><div class="hover_text">모바일</div></a>
                <div><input type="checkbox" name="likeCB" id="tdShpOfCB1">
                    <lable for="tdShpOfCB1"></lable>
                    <h6>상품이름</h6>
                    <h6>상품소개</h6>
                    <h6>가격</h6>
                </div>
            </span>
        </span>
        <span><a href="" class="like"><img src="image/shop/carr1.jpg"><div class="hover_text">잡화</div></a>
            <div><input type="checkbox" name="likeCB" id="tdShpOfCB3">
                <lable for="tdShpOfCB3"></lable>
                <h6>상품이름</h6>
                <h6>상품소개</h6>
                <h6>가격</h6>
            </div>
        </span>
        <span><a href="" class="like"><img src="image/shop/re_fran.jpg"><div class="hover_text">모바일</div></a>
            <div><input type="checkbox" name="likeCB" id="tdShpOfCB4">
                <lable for="tdShpOfCB4"></lable>
                <h6>상품이름</h6>
                <h6>상품소개</h6>
                <h6>가격</h6>
            </div>
        </span>
        <span><a href="" class="like"><img src="image/shop/base_pos.jpg"><div class="hover_text">티켓</div></a>
            <div><input type="checkbox" name="likeCB" id="tdShpOfCB5">
                <lable for="tdShpOfCB5"></lable>
                <h6>상품이름</h6>
                <h6>상품소개</h6>
                <h6>가격</h6>
            </div>
        </span>
        <span><a href="" class="like"><img src="image/shop/stff_slipper_japtem.jpg"><div class="hover_text">잡화</div></a>
            <div><input type="checkbox" name="likeCB" id="tdShpOfCB2">
                <lable for="tdShpOfCB2"></lable>
                <h6>상품이름</h6>
                <h6>상품소개</h6>
                <h6>가격</h6>
            </div>
            </div>
        </div>

        <!--이용자가 좋아할만한 상품 데이터 뽑음..ex>쿠키를 -->
        <div class="lkeGdsCB">
            <div class="cgBox">
                <span>좋아할만한 상품</span>
            </div>
            <div class="gdsBxPc">
                <span><a href="" class="like"><img src="image/shop/sport_london_tk_baseball.jpeg"><div class="hover_text">티켓</div></a>
                    <div><input type="checkbox" name="likeCB" id="likeCB1">
                        <lable for="likeCB1"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/rome_palce_col.jpg"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="likeCB2">
                        <lable for="likeCB2"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/spain_museum_tk.jpg"><div class="hover_text">가이드 투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="likeCB3">
                        <lable for="likeCB3"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/sp_pos.jpg"><div class="hover_text">티켓</div></a>
                    <div><input type="checkbox" name="likeCB" id="likeCB4">
                        <lable for="likeCB4"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/paris_football_tk.jpg"><div class="hover_text">티켓</div></a>
                    <div><input type="checkbox" name="likeCB" id="likeCB5">
                        <lable for="likeCB5"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
            </div>
        </div>

        <div class="gdGdsCB">
        <img src="image/shop/left.png" class="slide-arrow left-arrow" alt="Left Arrow">
        <div class="gdGdsCBWrap">
            <div class="cgBox">
                <span>가이드 투어 연계상품</span>
            </div>
            <div class="gdsBxPc" id="guidSlide">
                <span><a href="" class="like"><img src="image/shop/guid_tour/affiche.png"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds1">
                        <lable for="likeCB1"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/guid_tour/base1.jpg"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds2">
                        <lable for="likeCB2"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/guid_tour/manifesto.jpg"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds3">
                        <lable for="likeCB3"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/guid_tour/LOLA-INDIGO-CUENCA-e-724x1024.png"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds4">
                        <lable for="likeCB4"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/guid_tour/cherry.jpg"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds5">
                        <lable for="likeCB5"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/guid_tour/FT.jpg"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds6">
                        <lable for="likeCB1"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/guid_tour/hair.jpg"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds7">
                        <lable for="likeCB2"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/guid_tour/base2.jpg"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds8">
                        <lable for="likeCB3"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/guid_tour/mistinguett.jpg"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds9">
                        <lable for="likeCB4"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/guid_tour/otello.jpg"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds10">
                        <lable for="likeCB5"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/guid_tour/s-l1200.webp"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds11">
                        <lable for="likeCB1"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/guid_tour/socrate.jfif"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds12">
                        <lable for="likeCB2"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/guid_tour/spectacle.webp"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds13">
                        <lable for="likeCB3"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/guid_tour/bull.jpg"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds14">
                        <lable for="likeCB4"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
                <span><a href="" class="like"><img src="image/shop/guid_tour/318831647989365.jpg"><div class="hover_text">가이드투어</div></a>
                    <div><input type="checkbox" name="likeCB" id="guideGds15">
                        <lable for="likeCB5"></lable>
                        <h6>상품이름</h6>
                        <h6>상품소개</h6>
                        <h6>가격</h6>
                    </div>
                </span>
            </div>
        </div>
        <img src="image/shop/right.png" class="slide-arrow right-arrow" alt="Right Arrow">
        </div>
    </div>
    <!-- footer.html import-->
	<div id="footer">
	</div>

</body>
</html>