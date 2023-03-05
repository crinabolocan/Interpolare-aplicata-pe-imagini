function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia.
    % =========================================================================
    
    % Obtinem dimensiunea imaginii.
    [m n nr_colors] = size(I);
    Ix=zeros(m,n);
    Iy=zeros(m,n);
    Ixy=zeros(m,n);
    % TODO: Tranforma matricea I in double.
    I = double(I);
    % TODO: Calculeaza matricea cu derivate fata de x Ix.
    for x = 1:n
      for y = 1:m
        Ix(y,x) = fx(I,x,y);
      endfor
    endfor
    % TODO: Calculeaza matricea cu derivate fata de y Iy.
    for x = 1:n
      for y = 1:m
        Iy(y,x) = fy(I,x,y);
      endfor
    endfor
    % TODO: Calculeaza matricea cu derivate fata de xy Ixy.
    for x = 1:n
      for y = 1:m
        Ixy(y,x) = fxy(I,x,y);
      endfor
    endfor
endfunction
