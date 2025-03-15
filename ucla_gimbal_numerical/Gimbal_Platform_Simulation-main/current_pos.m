function pos = current_pos(A, w, tnow, t1, t2)

if tnow < t1
    pos = A/2 - A/2*cos(w*tnow);
elseif tnow < (t1+t2)
    pos = A;
elseif tnow < (t1+t2+t1)
    pos = A/2 + A/2*cos(w*(tnow-t1-t2));
elseif tnow < (t1+t2+t1+t2)
    pos = 0;
elseif tnow < (t1+t2+t1+t2+t1)
    pos = - A/2 + A/2*cos(w*(tnow-t1-t2-t1-t2));
elseif tnow < (t1+t2+t1+t2+t1+t2)
    pos = -A;
elseif tnow < (t1+t2+t1+t2+t1+t2+t1)
    pos = - A/2 - A/2*cos(w*(tnow-t1-t2-t1-t2-t1-t2));
else
    pos = 0;
end

end

