function list_d = distance(T)
A=0.0022;B=0.0061;C=0.4229;
P=[T(1); T(2)];
Q =-C+P(2);
n1 = 2*A^2;
n2= 3*A*B;
n3=(B^2-2*A*Q+1);
n4=-B*Q-P(1);
N = [n1 n2 n3 n4];
xT=roots(N);


list_d=[]; %list of distance
d_min = Inf;
for  i =1:size(xT,1)
    if isreal(xT(i)) %Test each xT
      T=[xT(i); A.*xT(i)^2+B.*xT(i)+C];
      d =norm(P-T);
      list_d = [list_d d];
      if (d < d_min)
          d_min=d;
      end
    end
end
% list_d

% fprintf('Distance from P(%.2f,%.2f) to parabola %.2f*x^2+%.2f*x+%.2f: %.3f \n',P(1),P(2),A,B,C,d_min);

