p =-pi/2:pi/60:pi/2; t=0:2*pi/100:2*pi; [P,T]=meshgrid(p, t); theta=pi/2-P; phi=T;
R=Yfxz2(theta,phi); %改变此句调用其他函数
R1=abs(R); [n, m]=size(R); C=ones(n, m);
i=find(R<0); %寻找 R<0 的指标
C(i)=0;
[X,Y,Z] =sph2cart (T,P,R1); surf(X,Y,Z,C);
xlabel('x'); ylabel('y'); zlabel('z'); axis equal; rotate3d on;%按着鼠标拖动图形可以旋转

%%%也可以将最后一句改为如下语句制成动画；
%m=moviein(20); %建立一个 20 列大矩阵
% for i=1:20
% view(-37.5+24*(i-1), 30); %改变视点
% m(:,i) =getframe; %将图形保存到 m 矩阵
% end
% movie(m,2); 播放画面 2 次?



%%% 也可以下面语句保存为 M 文件，画平面极坐标图：
% t=0:pi/50:2*pi; phi=0; theta=t; 
% r=(Ysp_1(theta, phi)); polar (t, abs(r), '-r');
% i=find(r>0); r(i)=nan; hold on; polar(t, abs(r),'-b');