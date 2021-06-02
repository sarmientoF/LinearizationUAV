function EP = EP(th)
    u = rand(3, 1);
    k = u / norm(u);
    EP = [sind(th) * k; cosd(th)]; 
end