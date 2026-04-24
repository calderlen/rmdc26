function A(u)
    """ 
    magnification for a point source at an angular separation of u (in units of the Einstein radius) from the lens 
    """
    return (u^2 + 2) / (u * sqrt(u^2 + 4))
end

function u(t, tE, u0, t0)
    """ 
    angular separation between the lens and the source as a function of time, in units of the Einstein radius
    """
    return sqrt(u0^2 + ((t - t0) / tE)^2)
end
