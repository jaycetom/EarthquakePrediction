
x=0:4;
%��Ʒa�������ȴ�ŵ���Ӧ��������
a=[0.4976,0.4877,0.4814,0.5050,0.5186];
% a=Contengency_test1(9);
%��Ʒb������ͬ����ŵ���Ӧ��������
b=[0.4697,0.5593,0.5102,0.5186];
% b=Contengency_test2(9);
%��Ʒc�����ݴ�ŵ���Ӧ��������
% c=[10.11 8.14 14.17 20.14 40.50 39.45 60.11 62.13 20.90];
% c=Contengency_test3(9);
% d=Contengency_test4(9);


plot(x,a,'b');
hold on;
plot(x(1:4),b,'r');
hold on;
% plot(x,c,'g');

title('SVR-HNN����ѵ�����ȱ仯');
xlabel('�ڼ�����');
ylabel('Ԥ�⾫��');
legend('�Ĳ�����','��������','Location','northwest');
% text(x,a,'o');
% text(x,b,'\Delta');
% text(x,c,'\bullet');
% for i=1:9
%     s1=num2str(a(i));
%     s2=num2str(b(i));
%     s3=num2str(c(i));
%     text(x(i),a(i),s1);
%     text(x(i),b(i),s2);
%     text(x(i),c(i),s3);
% end