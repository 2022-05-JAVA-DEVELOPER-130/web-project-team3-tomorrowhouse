----------------------------------------------------------userinfo---------------------------------------------------------
--select
--ID�� ȸ�� ã��
select u_id,u_pw,u_name,u_email,u_address,u_phone from userinfo where u_id='test2';

--��� ȸ�� ã��
select u_id,u_pw,u_name,u_email,u_address,u_phone from userinfo;

--ID �ߺ� üũ
select count(*) cnt from userinfo where u_id='test3';


--update
--ȸ�� ���� ����
update  userinfo set u_pw='pw100' ,u_name='�̸�����',u_email='test100@test.com',u_address='�ּҼ���',u_phone='999-9999-9999' where u_id='test1';


--delete
--ȸ�� ����
delete userinfo where u_id='test4';
---------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------product---------------------------------------------------------
--select
-- product ��ü����
select * from product;

-- product ��ǰ��ȣ(p_no)�� 1�� ����
select * from product where p_no = 1 ;

-- product ��ǰ�̸�(p_name)�� 1�� ����
select * from product where p_name = 'å��';



--update
-- product ��ǰ��ȣ(p_no)�� �ҷ��� ����( �̸�(p_no), ����(p_price), �̹���(p_image), ��ǰ����(p_desc), ī�װ�(cg_no)
update product set p_name='å��' ,p_price =100000 , p_image = 'desk.jpg' ,p_desc = 'å���Դϴ�' , cg_no =1  where p_no = 1 ;

-- ��ǰ��ȣ(p_no)�� Ŭ����(p_click_count) ����
update product set p_click_count=p_click_count+1 where p_no =1;



--delete
-- product ��ǰ��ȣ(p_no)�� ����
delete from product where p_no = 16;
---------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------category---------------------------------------------------------
--select
--ī�װ� ��ȣ�� ã�� 
select * from product p join categorys c on p.cg_no = c.cg_no where c.cg_no = 1;

--ī�װ� �̸����� ã��
select * from product p join categorys c on p.cg_no = c.cg_no where c.cg_name='����';

--selectAll ī�װ� ��üã��
select * from categorys;


--update
--update ī�װ� ��������
update categorys set cg_no = 4,cg_name='����,���' where cg_no= 3;



--delete
--delete ī�װ� ����
delete  from categorys where cg_no=4;

---------------------------------------------------------------------------------------------------------------------------



------------------------------------------------------------cart-----------------------------------------------------------
--select
--�α����� test1���� īƮ ����Ʈ �ҷ�����
select * from cart c join product p on c.p_no=p.p_no where c.u_id='test1';

--�α����� test1���� īƮ ����Ʈ�� ��ǰ�ѹ� 1���� ���翩�� Ȯ��(0�� ��� insert,1�̻��� ��� update)
select count(*) product_count from cart c where c.u_id='test1' and c.p_no=1;



--update
--test1���� īƮ����Ʈ�� �ִ� ��ǰ1���� ���� 2�� ����
update cart c set c_qty=c_qty+2 where c.u_id='test1' and c.p_no=1;



--delete
--test1���� īƮ����Ʈ�� �ִ� ��ǰ1�� ����
delete from cart c where c.p_no=1;

--test1���� īƮ����Ʈ ��ü����
delete from cart c where c.u_id = 'test1';
---------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------order-------------------------------------------------------------
/**************** orders_orderitem***************/
--select
-- �ֹ� & �ֹ� �� ��ü ��� (������)
select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no;

-- test2�� �ֹ� �Ѱ�(o_no=4) & �ֹ���, ��ǰ ���� ��� ����
select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no where o.u_id = 'test2' and o.o_no=4;

-- test2 ���� �ֹ� ��ü ���
select * from orders where u_id = 'test2';

-- test3 �� �ֹ� & �ֹ� �� ��ü ���
select * from orders o join orderitem oi on  o.o_no = oi.o_no join product p on oi.p_no = p.p_no where o.u_id='test3';

-- ���1���� �ֹ���ȣ 4���� �ֹ� ����
select * from orders where o_no = 4;

-- ���1���� �ֹ���ȣ 3���� ��� �� ����(������)
select * from orderitem where o_no = 3;



--delete
--�ֹ���ȣ 3�� ����(�ֹ�1������,�ֹ��󼼻���
--on delete cascade
delete from orderitem where o_no=3;
delete from orders where o_no=3;




-- test3 ���� �ֹ� ���� ��ü ����
--select
select * from orders;
select * from orderitem;
select * from orderitem where o_no=(select o_no from orders where u_id = 'test3');
select * from orders where u_id = 'test3';



--delete
delete from orderitem where o_no=(select o_no from orders where u_id = 'test3');
delete from orders where u_id = 'test3';
---------------------------------------------------------------------------------------------------------------------------



COMMIT;
