------회원 데이터------
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test1', 'pw1', '테스트1', 'test1@test.com', '서울시', '010-0000-0000');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test2', 'pw2', '테스트2', 'test2@test.com', '인천시', '010-1111-1111');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test3', 'pw3', '테스트3', 'test3@test.com', '대구시', '010-2222-2222');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test4', 'pw4', '테스트4', 'test4@test.com', '부산시', '010-3333-3333');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test5', 'pw5', '테스트5', 'test5@test.com', '안산시', '010-4444-4444');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test6', 'pw6', '테스트6', 'test6@test.com', '안양시', '010-5555-5555');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test7', 'pw7', '테스트7', 'test7@test.com', '광주시', '010-6666-6666');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test8', 'pw8', '테스트8', 'test8@test.com', '울산시', '010-7777-7777');

-----카테고리 데이터----
insert into categorys(cg_no, cg_name) values(1, '수납');
insert into categorys(cg_no, cg_name) values(2, '가구');
insert into categorys(cg_no, cg_name) values(3, '가전제품');
insert into categorys(cg_no, cg_name) values(4, '조명');
insert into categorys(cg_no, cg_name) values(5, '주방용품');

------상품 데이터------
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '책상', 100000, 'desk.jpg', '책상입니다', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '의자', 50000, 'chair.jpg', '의자입니다', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '선반', 200000, 'rack.jpg', '선반입니다', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '침대', 250000, 'bed.jpg', '침대입니다', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '신발장', 150000, 'shoe_rack.jpg', '신발장입니다', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '수납장', 100000, 'storage_closet.jpg', '수납장입니다', 0, 1);

------주문&주문상세-----
insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '책상 외 2종', sysdate, 200000, 'test1');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 1);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 2);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '선반 외 1종', sysdate, 450000, 'test1');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 3);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 4);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '선반 외 1종', sysdate, 450000, 'test3');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 3);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 4);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '신발장 외 1종', sysdate, 350000, 'test2');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 5);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 3);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '수납장 외 0종', sysdate, 100000, 'test4');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 6);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '책상 외 2종', sysdate, 200000, 'test1');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 1);

------카트 데이터------
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 1, 'test1', 1);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 4, 'test2', 5);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 2, 'test2', 6);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 3, 'test3', 3);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 5, 'test4', 2);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 5, 'test4', 3);

------공지 데이터------
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '공지1', '공지1 내용', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '공지2', '공지2 내용', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '공지3', '공지3 내용', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '공지4', '공지4 내용', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '공지5', '공지5 내용', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '공지6', '공지6 내용', sysdate);
------리뷰 데이터------
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰1', '리뷰1 내용', 'test1', 1);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰2', '리뷰2 내용', 'test2', 2);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰3', '리뷰3 내용', 'test3', 3);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰4', '리뷰4 내용', 'test4', 4);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰5', '리뷰5 내용', 'test5', 5);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '리뷰6', '리뷰6 내용', 'test6', 6);

------qna 데이터------
insert into qna(q_no, q_title, q_content, q_date, q_category, u_id) values(qna_q_no_seq.nextval, '문의1', '문의1 내용', sysdate, '카테고리1', 'test1');
insert into qna(q_no, q_title, q_content, q_date, q_category, u_id) values(qna_q_no_seq.nextval, '문의2', '문의2 내용', sysdate, '카테고리2', 'test2');
insert into qna(q_no, q_title, q_content, q_date, q_category, u_id) values(qna_q_no_seq.nextval, '문의3', '문의3 내용', sysdate, '카테고리3', 'test3');
insert into qna(q_no, q_title, q_content, q_date, q_category, u_id) values(qna_q_no_seq.nextval, '문의4', '문의4 내용', sysdate, '카테고리4', 'test4');
insert into qna(q_no, q_title, q_content, q_date, q_category, u_id) values(qna_q_no_seq.nextval, '문의5', '문의5 내용', sysdate, '카테고리5', 'test5');
insert into qna(q_no, q_title, q_content, q_date, q_category, u_id) values(qna_q_no_seq.nextval, '문의6', '문의6 내용', sysdate, '카테고리6', 'test6');


commit;