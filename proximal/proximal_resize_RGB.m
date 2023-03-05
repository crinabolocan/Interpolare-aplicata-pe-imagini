function out = proximal_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel �nc�t aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================

    % TODO: Extrage canalul rosu al imaginii.
    redcanal = img(:,:,1);
    % TODO: Extrage canalul verde al imaginii.
    greencanal = img(:,:,2);
    % TODO: Extrage canalul albastru al imaginii.
    bluecanal = img(:,:,3);
    % TODO: Aplica functia proximal pe cele 3 canale ale imaginii.
    red = proximal_resize(redcanal, p, q);
    green = proximal_resize(greencanal, p, q);
    blue = proximal_resize(bluecanal, p, q);

    % TODO: Formeaza imaginea finala concaten�nd cele 3 canale de culori.
    out = cat(3, red, green, blue);
endfunction
