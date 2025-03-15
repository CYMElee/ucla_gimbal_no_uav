function vel = current_vel(A, w, tnow, t1, t2)

if tnow < t1
    vel = A/2*w*sin(w*(tnow));
elseif tnow < (t1+t2)
    vel = 0;
elseif tnow < (t1+t2+t1)
    vel = - A/2*w*sin(w*(tnow-t1-t2));
elseif tnow < (t1+t2+t1+t2)
    vel = 0;
elseif tnow < (t1+t2+t1+t2+t1)
    vel = - A/2*w*sin(w*(tnow-t1-t2-t1-t2));
elseif tnow < (t1+t2+t1+t2+t1+t2)
    vel = 0;
elseif tnow < (t1+t2+t1+t2+t1+t2+t1)
    vel = A/2*w*sin(w*(tnow-t1-t2-t1-t2-t1-t2));
else
    vel = 0;
end

end

