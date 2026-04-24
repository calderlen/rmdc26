function flux_to_mag(flux::Float64, flux_err::Float64, m0::Float64)
    """ convert flux (error) to magnitude (error), given a zero-point magnitude m0"""
    mag = m0 - 2.5 * log10(flux)
    mag_err = (2.5 / log(10)) * (flux_err / flux)
    return mag, mag_err
end


function mag_to_flux(mag::Float64, mag_err::Float64, f0::Float64)
    """ convert magnitude (error) to flux (error) given a zero-point flux f0 """
    flux = f0 * 10^(-0.4 * mag)
    flux_err = flux * 0.4 * log(10) * mag_err
    return flux, flux_err
end

function u_to_gamma(u::Float64)
    """ convert u limb-darkening parameter to gamma limb-darkening parameter """
    return 2 * u / (3 - u)
end

function gamma_to_u(gamma::Float64)
    """ convert gamma limb-darkening parameter to u limb-darkening parameter """
    return 3 * gamma / (2 + gamma)
end

#= other util functions needed: get number of caustics for a binary lines, 3d earth velocity, ... =#