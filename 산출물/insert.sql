------ȸ�� ������------
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test1', 'pw1', '�׽�Ʈ1', 'test1@test.com', '�����', '010-0000-0000');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test2', 'pw2', '�׽�Ʈ2', 'test2@test.com', '��õ��', '010-1111-1111');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test3', 'pw3', '�׽�Ʈ3', 'test3@test.com', '�뱸��', '010-2222-2222');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test4', 'pw4', '�׽�Ʈ4', 'test4@test.com', '�λ��', '010-3333-3333');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test5', 'pw5', '�׽�Ʈ5', 'test5@test.com', '�Ȼ��', '010-4444-4444');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test6', 'pw6', '�׽�Ʈ6', 'test6@test.com', '�Ⱦ��', '010-5555-5555');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test7', 'pw7', '�׽�Ʈ7', 'test7@test.com', '���ֽ�', '010-6666-6666');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('test8', 'pw8', '�׽�Ʈ8', 'test8@test.com', '����', '010-7777-7777');
insert into userinfo(u_id, u_pw, u_name, u_email, u_address, u_phone) values('admin', '1111', '������', 'admin@admin.com', '�����μ�', '010-1234-5678');
-----ī�װ� ������----
insert into categorys(cg_no, cg_name) values(1, '����');
insert into categorys(cg_no, cg_name) values(2, '����');
insert into categorys(cg_no, cg_name) values(3, '������ǰ');
insert into categorys(cg_no, cg_name) values(4, '����');
insert into categorys(cg_no, cg_name) values(5, '�ֹ��ǰ');

------��ǰ ������------
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '����', 200000, 'rack.jpg', '�����Դϴ�', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '�Ź���', 150000, 'shoe_rack.jpg', '�Ź����Դϴ�', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '������', 100000, 'storage_closet.jpg', '�������Դϴ�', 0, 1);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, 'å��', 100000, 'desk.jpg', 'å���Դϴ�', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '����å��', 100000, 'desk2.jpg', 'å��2�Դϴ�', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, 'å��ٸ�', 20000, 'desk3.jpg', 'å��3�Դϴ�', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '����', 50000, 'chair.jpg', '�����Դϴ�', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, 'å������', 30000, 'chiar2.jpg', '����2�Դϴ�', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, 'ħ��', 250000, 'bed.jpg', 'ħ���Դϴ�', 0, 2);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '����', 250000, 'radio.jpg', '�����Դϴ�', 0, 3);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '����Ŀ', 340000, 'speaker.jpg', '����Ŀ�Դϴ�', 0, 3);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '��Ƽ��', 430000, 'extension.jpg', '��Ƽ���Դϴ�', 0, 3);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '���ڷ�����', 550000, 'microwave.jpg', '���ڷ������Դϴ�', 0, 3);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '��������', 520000, 'light1.jpg', '����1�Դϴ�', 0, 4);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '���ĵ�����', 210000, 'light2.jpg', '����2�Դϴ�', 0, 4);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '��������', 170000, 'light3.jpg', '����3�Դϴ�', 0, 4);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '��������', 1000, 'pot1.jpg', '����1�Դϴ�', 0, 5);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '������1', 2000, 'spoon1.jpg', '������1�Դϴ�', 0, 5);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '������2', 3000, 'spoon2.jpg', '������2�Դϴ�', 0, 5);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '������1', 3000, 'chopstick1.jpg', '������1�Դϴ�', 0, 5);
insert into product(p_no, p_name, p_price, p_image, p_desc, p_click_count, cg_no) values(product_p_no_seq.nextval, '��������1', 5000, 'pan1.jpg', '��������1�Դϴ�', 0, 5);


------�ֹ�&�ֹ���-----
insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '���� �� 2��', sysdate, 200000, 'test1');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 1);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 5);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 10);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, 'å�� �� 1��', sysdate, 450000, 'test1');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 4);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 4, orders_o_no_seq.currval, 7);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '���� �� 3��', sysdate, 450000, 'test2');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 10);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 14);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 3, orders_o_no_seq.currval, 19);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '���� �� 2��', sysdate, 350000, 'test2');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 14);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 1);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 5);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, 'ħ�� �� 0��', sysdate, 100000, 'test3');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 1, orders_o_no_seq.currval, 9);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, 'ħ�� �� 1��', sysdate, 100000, 'test3');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 9);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 1);

insert into orders(o_no, o_desc, o_date, o_price, u_id) values(orders_o_no_seq.nextval, '������ �� 2��', sysdate, 200000, 'test4');
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 4, orders_o_no_seq.currval, 18);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 19);
insert into orderitem(oi_no, oi_qty, o_no, p_no) values(orderitem_oi_no_seq.nextval, 2, orders_o_no_seq.currval, 20);

------īƮ ������------
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 1, 'test1', 1);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 2, 'test1', 2);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 3, 'test1', 3);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 4, 'test2', 5);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 2, 'test2', 6);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 3, 'test3', 3);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 3, 'test3', 8);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 5, 'test4', 2);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 5, 'test4', 3);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 2, 'test5', 1);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 3, 'test5', 2);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 4, 'test5', 3);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 1, 'test6', 9);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 1, 'test6', 10);
insert into cart(c_no, c_qty, u_id, p_no) values(cart_c_no_seq.nextval, 1, 'test6', 11);

------���� ������------
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '����1', '����1 ����', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '����2', '����2 ����', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '����3', '����3 ����', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '����4', '����4 ����', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '����5', '����5 ����', sysdate);
insert into notice(n_no, n_title, n_content, n_date) values(notice_n_no_seq.nextval, '����6', '����6 ����', sysdate);

------���� ������------
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '����'||REVIEW_R_NO_SEQ.currval, '���䳻��'||REVIEW_R_NO_SEQ.currval, 'test1', 1);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '����'||REVIEW_R_NO_SEQ.currval, '���� ����'||REVIEW_R_NO_SEQ.currval, 'test1', 2);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '����'||REVIEW_R_NO_SEQ.currval, '���� ����'||REVIEW_R_NO_SEQ.currval, 'test1', 3);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '����'||REVIEW_R_NO_SEQ.currval, '���� ����'||REVIEW_R_NO_SEQ.currval, 'test1', 4);

insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '����'||REVIEW_R_NO_SEQ.currval, '���� ����'||REVIEW_R_NO_SEQ.currval, 'test2', 6);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '����'||REVIEW_R_NO_SEQ.currval, '���� ����'||REVIEW_R_NO_SEQ.currval, 'test2', 7);

insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '����'||REVIEW_R_NO_SEQ.currval, '���� ����'||REVIEW_R_NO_SEQ.currval, 'test2', 9);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '����'||REVIEW_R_NO_SEQ.currval, '���� ����'||REVIEW_R_NO_SEQ.currval, 'test2', 10);

insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '����'||REVIEW_R_NO_SEQ.currval, '���� ����'||REVIEW_R_NO_SEQ.currval, 'test3', 13);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '����'||REVIEW_R_NO_SEQ.currval, '���� ����'||REVIEW_R_NO_SEQ.currval, 'test3', 14);

insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '����'||REVIEW_R_NO_SEQ.currval, '���� ����'||REVIEW_R_NO_SEQ.currval, 'test4', 15);
insert into review(r_no, r_title, r_content, u_id, oi_no) values(REVIEW_R_NO_SEQ.nextval, '����'||REVIEW_R_NO_SEQ.currval, '���� ����'||REVIEW_R_NO_SEQ.currval, 'test4', 16);


------qna ������------
insert into qna(q_no, q_title, q_content, q_date, q_category, u_id) values(qna_q_no_seq.nextval, '����1', '����1 ����', sysdate, 'ī�װ�1', 'test1');
insert into qna(q_no, q_title, q_content, q_date, q_category, u_id) values(qna_q_no_seq.nextval, '����2', '����2 ����', sysdate, 'ī�װ�2', 'test2');
insert into qna(q_no, q_title, q_content, q_date, q_category, u_id) values(qna_q_no_seq.nextval, '����3', '����3 ����', sysdate, 'ī�װ�3', 'test3');
insert into qna(q_no, q_title, q_content, q_date, q_category, u_id) values(qna_q_no_seq.nextval, '����4', '����4 ����', sysdate, 'ī�װ�4', 'test4');
insert into qna(q_no, q_title, q_content, q_date, q_category, u_id) values(qna_q_no_seq.nextval, '����5', '����5 ����', sysdate, 'ī�װ�5', 'test5');
insert into qna(q_no, q_title, q_content, q_date, q_category, u_id) values(qna_q_no_seq.nextval, '����6', '����6 ����', sysdate, 'ī�װ�6', 'test6');


commit;