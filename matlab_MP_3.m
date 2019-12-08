function[] = matlab_MP_3(component)
x = component(:,1);
y = component(:,2);
least = inf;
format short g

%--for checking the best polynomial fit from 1-10th degree--%
for ctr =1:1:10
    if ctr >= length(x)
        break
    end
    p = polyfit(x,y,ctr);
    y2 = polyval(p,x); 
    e = y-y2;
    errorvector_norm = norm(e);
    if errorvector_norm < least
        least = errorvector_norm;
        BestFit_Polynomial = p;
    end
end
%--plotting--%
x3 = min(x):0.01:max(x);
y3 = polyval(BestFit_Polynomial,x3);
plot(x,y,'-o')
hold on 
plot(x3,y3,'-');
title('Polynomial Regression')
legend('Data points','Polynomial Curve')
hold off
BestFit_Polynomial

end
